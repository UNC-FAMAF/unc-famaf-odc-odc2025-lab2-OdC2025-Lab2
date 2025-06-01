.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480

.globl dibujar_nave
.globl cohete
.globl cabeza_cohete
.globl luces
.globl ventanillas
.globl propulsores
.globl aleta_izquierda
.globl aleta_derecha

.extern draw_rect
.extern triangulo

// ---------------------- Cohete ----------------------
cohete:
    SUB SP, SP, 8
    STUR X30, [SP, 0]
    movz w10, 0x5B, lsl 16
    movk w10, 0x5B5B, lsl 0
    mov x1, 65
    mov x2, 120
    mov x3, 50
    mov x4, 160
    mov x5, x1
    mov x6, x2
    mov w21, w10
    BL draw_rect

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Cabeza del cohete ----------------------
cabeza_cohete:
    SUB SP, SP, 8
    STUR X30, [SP, 0]
    movz w10, 0xFE, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 58
    mov x2, 15
    mov x3, 53
    mov x4, 145
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 45
    mov x2, 15
    mov x3, 60
    mov x4, 130
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 28
    mov x2, 15
    mov x3, 68
    mov x4, 115
    mov x5, x1
    mov x6, x2
    BL draw_rect
	
    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Luces ----------------------
luces:
    SUB SP, SP, 8
    STUR X30, [SP, 0]
    movz w10, 0xEA, lsl 16
    movk w10, 0xEA00, lsl 0
    mov w21, w10
    mov x1, 5
    mov x2, 5
    mov x3, 58
    mov x4, 170
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 3
    mov x2, 3
    mov x3, 59
    mov x4, 171
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movz w10, 0xEA, lsl 16
    movk w10, 0xEA00, lsl 0
    mov w21, w10
    mov x1, 5
    mov x2, 5
    mov x3, 58
    mov x4, 220
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 3
    mov x2, 3
    mov x3, 59
    mov x4, 221
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movz w10, 0xEA, lsl 16
    movk w10, 0xEA00, lsl 0
    mov w21, w10
    mov x1, 5
    mov x2, 5
    mov x3, 90
    mov x4, 220
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 3
    mov x2, 3
    mov x3, 91
    mov x4, 221
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movz w10, 0xEA, lsl 16
    movk w10, 0xEA00, lsl 0
    mov w21, w10
    mov x1, 5
    mov x2, 5
    mov x3, 90
    mov x4, 170
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 3
    mov x2, 3
    mov x3, 91
    mov x4, 171
    mov x5, x1
    mov x6, x2
    BL draw_rect

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Aleta izquierda ----------------------
aleta_izquierda:
    SUB SP, SP, 8
    STUR X30, [SP, 0]
    movz w10, 0xFF, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10

    mov x1, 5
    mov x2, 20
    mov x3, 45
    mov x4, 190
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 6
    mov x2, 8
    mov x3, 44
    mov x4, 210
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 8
    mov x2, 15
    mov x3, 42
    mov x4, 218
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 9
    mov x2, 8
    mov x3, 41
    mov x4, 233
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 10
    mov x2, 20
    mov x3, 40
    mov x4, 241
    mov x5, x1
    mov x6, x2
    BL draw_rect

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Aleta derecha ----------------------
aleta_derecha:
    SUB SP, SP, 8
    STUR X30, [SP, 0]
    movz w10, 0xFF, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10

    mov x1, 5
    mov x2, 20
    mov x3, 115
    mov x4, 190
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 6
    mov x2, 8
    mov x3, 115
    mov x4, 210
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 8
    mov x2, 15
    mov x3, 115
    mov x4, 218
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 9
    mov x2, 8
    mov x3, 115
    mov x4, 233
    mov x5, x1
    mov x6, x2
    BL draw_rect

    mov x1, 10
    mov x2, 20
    mov x3, 115
    mov x4, 241
    mov x5, x1
    mov x6, x2
    BL draw_rect

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Ventanillas ----------------------
ventanillas:
    SUB SP, SP, 8
    STUR X30, [SP, 0]

    movz w10, 0x00, lsl 16
    movk w10, 0xEAE0, lsl 0
    mov w21, w10

    mov x1, 15
    mov x2, 20
    mov x3, 65
    mov x4, 180
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x32EA, lsl 0
    mov w21, w10
    mov x1, 10
    mov x2, 10
    mov x3, 67
    mov x4, 185
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movz w10, 0x00, lsl 16
    movk w10, 0xEAE0, lsl 0
    mov w21, w10
    mov x1, 15
    mov x2, 20
    mov x3, 65
    mov x4, 230
    mov x5, x1
    mov x6, x2
    BL draw_rect

    movk w10, 0x32EA, lsl 0
    mov w21, w10
    mov x1, 10
    mov x2, 10
    mov x3, 67
    mov x4, 235
    mov x5, x1
    mov x6, x2
    BL draw_rect

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Propulsores ----------------------
propulsores:
    SUB SP, SP, 8
    STUR X30, [SP, 0]

    // Izquierdo
    movz w10, 0xFF, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 12
    mov x2, 18
    mov x3, 60
    mov x4, 280
    BL triangulo

    movz w10, 0xFF, lsl 16
    movk w10, 0xFF00, lsl 0
    mov w21, w10
    mov x1, 8
    mov x2, 12
    mov x3, 62
    mov x4, 284
    BL triangulo

    // Centro
    movz w10, 0xFF, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 12
    mov x2, 18
    mov x3, 80
    mov x4, 280
    BL triangulo

    movz w10, 0xFF, lsl 16
    movk w10, 0xFF00, lsl 0
    mov w21, w10
    mov x1, 8
    mov x2, 12
    mov x3, 82
    mov x4, 284
    BL triangulo

    // Derecho
    movz w10, 0xFF, lsl 16
    movk w10, 0x0000, lsl 0
    mov w21, w10
    mov x1, 12
    mov x2, 18
    mov x3, 100
    mov x4, 280
    BL triangulo

    movz w10, 0xFF, lsl 16
    movk w10, 0xFF00, lsl 0
    mov w21, w10
    mov x1, 8
    mov x2, 12
    mov x3, 102
    mov x4, 284
    BL triangulo

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret

// ---------------------- Dibujar nave completa ----------------------
dibujar_nave:
    SUB SP, SP, 8
    STUR X30, [SP, 0]

    BL aleta_izquierda
    BL aleta_derecha
    BL cohete
    BL cabeza_cohete
    BL luces
    BL ventanillas
    BL propulsores

    LDR X30, [SP, 0]
    ADD SP, SP, 8
    ret
