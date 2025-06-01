.globl star2
.extern elipse_simple

star2:
    // Guardar lr si vas a llamar funciones
    stp x30, xzr, [sp, #-16]!    // guarda lr, y un valor dummy para alinear stack

    // Pasar parámetros para elipse_simple usando x0,x1,x2
    // Se usa x6 = centro_x, x7 = centro_y, x20 = framebuffer base
    mov x6, x0       // centro x
    mov x7, x1       // centro y
    mov x20, x2      // framebuffer base

    // Capa 1
    movz w21, 0x18C3, lsl 0

    mov x8, #15
    mov x9, #15
    bl elipse_simple

    // Capa 2
    movz w21, 0x3186, lsl 0

    mov x8, #14
    mov x9, #14
    bl elipse_simple

    // Capa 3
    movz w21, 0x528A, lsl 0

    mov x8, #13
    mov x9, #13
    bl elipse_simple

    // Capa 4
    movz w21, 0x8410, lsl 0

    mov x8, #12
    mov x9, #12
    bl elipse_simple

    // Capa 5
    movz w21, 0xBDF7, lsl 0

    mov x8, #11
    mov x9, #11
    bl elipse_simple

    // Capa 6
    movz w21, 0xDEFB, lsl 0

    mov x8, #10
    mov x9, #10
    bl elipse_simple

    // Capa 7
    movz w21, 0xFFFF, lsl 0

    mov x8, #9
    mov x9, #9
    bl elipse_simple

    ldp x30, xzr, [sp], #16       // restaurar lr
    ret

