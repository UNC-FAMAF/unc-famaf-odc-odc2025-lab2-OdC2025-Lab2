.globl star
.extern elipse_simple

star:
    // Guardar lr si vas a llamar funciones
    stp x30, xzr, [sp, #-16]!    // guarda lr, y un valor dummy para alinear stack

    // Pasar parámetros para elipse_simple usando x0,x1,x2
    // Se usa x6 = centro_x, x7 = centro_y, x20 = framebuffer base
    mov x6, x0       // centro x
    mov x7, x1       // centro y
    mov x20, x2      // framebuffer base

    // Capa 1
    movz w21, 0x001E, lsl 16
    movk w21, 0x00, lsl 0

    mov x8, #6
    mov x9, #6
    bl elipse_simple

    // Capa 2
    movz w21, 0x003C, lsl 16
    movk w21, 0x00, lsl 0

    mov x8, #5
    mov x9, #5
    bl elipse_simple

    // Capa 3
    movz w21, 0x0078, lsl 16
    movk w21, 0x00, lsl 0

    mov x8, #4
    mov x9, #4
    bl elipse_simple

    // Capa 4
    movz w21, 0x50C8, lsl 16
    movk w21, 0x00, lsl 0

    mov x8, #3
    mov x9, #3
    bl elipse_simple

    // Capa 5
    movz w21, 0xA0FF, lsl 16
    movk w21, 0x00, lsl 0

    mov x8, #2
    mov x9, #2
    bl elipse_simple

    // Capa 6
    movz w21, 0xFFFF, lsl 16
    movk w21, 0xFF, lsl 0

    mov x8, #1
    mov x9, #1
    bl elipse_simple

    ldp x30, xzr, [sp], #16       // restaurar lr
    ret






