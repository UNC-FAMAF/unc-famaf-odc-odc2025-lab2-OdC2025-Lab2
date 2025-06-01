.globl draw_rect
.globl triangulo
.globl circulo
.globl elipse_simple

// ------------------- CIRCULO -------------------
// x6 = cx (centro x)
// x7 = cy (centro y)
// x8 = radio
// x9 = radio^2 
// w21 = color
// x20 = framebuffer base

circulo:
    mov x1, #0                // y = 0
circle_y_loop:
    cmp x1, #480              // recorrer hasta el alto de pantalla
    bge end_circle

    mov x0, #0                // x = 0
circle_x_loop:
    cmp x0, #640              // recorrer hasta el ancho de pantalla
    bge next_y

    sub x2, x0, x6            // dx = x - cx
    sub x3, x1, x7            // dy = y - cy
    mul x2, x2, x2            // dx²
    mul x3, x3, x3            // dy²
    add x4, x2, x3            // dx² + dy²

    // Verificamos si el punto está dentro del círculo
    cmp x4, x9                // comparar con radio²
    bgt skip_pixel

    // Calcular dirección del píxel y pintar
    mov x5, #640
    mul x12, x1, x5
    add x12, x12, x0
    lsl x12, x12, #2          // * 4 bytes por píxel
    add x12, x20, x12
    str w21, [x12]

skip_pixel:
    add x0, x0, #1
    b circle_x_loop

next_y:
    add x1, x1, #1
    b circle_y_loop

end_circle:
    RET

// ------------------- RECTANGULO -------------------
// x3 = x inicio
// x4 = y inicio
// x5 = ancho
// x6 = alto
// w21 = color
// x20 = framebuffer base

draw_rect:
    mov x7, #0
rect_loop_y:
    cmp x7, x6
    bge end_draw_rect

    mov x8, #0
rect_loop_x:
    cmp x8, x5
    bge next_row

    add x9, x3, x8            // x actual
    add x10, x4, x7           // y actual

    mov x11, #640
    mul x12, x10, x11         // y * ancho pantalla
    add x12, x12, x9          // + x
    lsl x12, x12, #2          // * 4 bytes por píxel
    add x12, x20, x12
    str w21, [x12]

    add x8, x8, #1
    b rect_loop_x

next_row:
    add x7, x7, #1
    b rect_loop_y

end_draw_rect:
    ret

// ------------------- ELIPSE -------------------
// x6 = cx (centro x)
// x7 = cy (centro y)
// x8 = rx (radio x)
// x9 = ry (radio y)
// w21 = color
// x20 = framebuffer base

elipse_simple:
    mov x1, #0
ellipse_y_loop:
    cmp x1, #480
    bge end_ellipse

    mov x0, #0
ellipse_x_loop:
    cmp x0, #640
    bge next_ey

    sub x2, x0, x6            // dx = x - cx
    sub x3, x1, x7            // dy = y - cy

    // Fórmula: (dx² * ry²) + (dy² * rx²)
    mul x4, x2, x2            // dx²
    mul x4, x4, x9            // dx² * ry
    mul x4, x4, x9            // dx² * ry²

    mul x5, x3, x3            // dy²
    mul x5, x5, x8            // dy² * rx
    mul x5, x5, x8            // dy² * rx²

    add x10, x4, x5

    // Comparar con rx² * ry²
    mul x11, x8, x8           // rx²
    mul x11, x11, x9          // rx² * ry
    mul x11, x11, x9          // rx² * ry²

    cmp x10, x11
    bgt skip_ellipse_px

    // pintar píxel
    mov x12, #640
    mul x13, x1, x12
    add x13, x13, x0
    lsl x13, x13, #2
    add x13, x20, x13
    str w21, [x13]

skip_ellipse_px:
    add x0, x0, #1
    b ellipse_x_loop

next_ey:
    add x1, x1, #1
    b ellipse_y_loop

end_ellipse:
    ret

// ------------------- TRIÁNGULO -------------------
// x1 = base
// x2 = altura
// x3 = x inicial (x0)
// x4 = y inicial (y0)
// w21 = color
// x20 = framebuffer base

triangulo:
    mov x5, x1                // ancho actual
    mov x6, x2                // altura restante
    mov x7, x3                // x actual
    mov x8, x4                // y actual

tr_loop_altura:
    cmp x6, #0
    ble fin_triangulo

    mov x9, x5
    mov x10, x7
tr_loop_ancho:
    cmp x9, #0
    ble siguiente_fila

    // calcular dirección y pintar
    mov x11, #640
    mul x12, x8, x11
    add x12, x12, x10
    lsl x12, x12, #2
    add x12, x20, x12
    str w21, [x12]

    add x10, x10, #1
    sub x9, x9, #1
    b tr_loop_ancho

siguiente_fila:
    add x8, x8, #1            // siguiente fila (y)
    sub x5, x5, #2            // reducir base
    add x7, x7, #1            // centrar la base
    sub x6, x6, #1            // reducir altura
    b tr_loop_altura

fin_triangulo:
    ret
