.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.section .text
.globl draw_char_scaled

// Entrada:
// x0 = framebuffer base
// x1 = X
// x2 = Y
// x3 = dirección de la fuente (8 bytes)
// x6 = escala
draw_char_scaled:
    mov x5, 0                  // fila
draw_row:
    ldrb w7, [x3, x5]          // byte fila
    mov x8, 0                  // columna
draw_col:
    mov x9, 7
    sub x9, x9, x8
    mov x10, 1
    lsl x10, x10, x9
    and w11, w7, w10
    cbz w11, skip_block

    // Dibujar píxel expandido
    mov x12, 0                // dy
draw_block_y:
    mov x13, 0                // dx
draw_block_x:
    mul x14, x8, x6
    add x14, x14, x13
    add x14, x14, x1          // x destino

    mul x15, x5, x6
    add x15, x15, x12
    add x15, x15, x2          // y destino

    mov x16, SCREEN_WIDTH
    mul x17, x15, x16
    add x17, x17, x14
    lsl x17, x17, 2
    add x17, x0, x17
    stur w4, [x17]

    add x13, x13, 1
    cmp x13, x6
    blt draw_block_x

    add x12, x12, 1
    cmp x12, x6
    blt draw_block_y

skip_block:
    add x8, x8, 1
    cmp x8, 8
    blt draw_col

    add x5, x5, 1
    cmp x5, 8
    blt draw_row
    ret

    