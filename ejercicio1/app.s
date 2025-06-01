	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main

	.extern triangulo
	.extern elipse_simple
	.extern draw_rect

	.extern font_O
	.extern font_D
	.extern font_C
	.extern font_2
	.extern font_0
	.extern font_5
	.extern draw_char
	.extern draw_char_scaled

	.extern star
	.extern star2

	.extern dibujar_nave

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------

	movz x10, 0

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//---------------------------------------------------------------
	// Infinite Loop

// agujero negro		 
	
	//CENTRO
	mov x6, #360              // cx (centro x)		
	mov x7, #240              // cy (centro y)

	mov x8, #100
	mul x9, x8, x8
	movz w21, 0xFF, lsl 16
	movk w21, 0x8C00, lsl 0  
	bl circulo

	mov x8, #98
	mul x9, x8, x8
	movz w21, 0xF2, lsl 16
	movk w21, 0x7A00, lsl 0   
	bl circulo

	mov x8, #96
	mul x9, x8, x8
	movz w21, 0xE6, lsl 16
	movk w21, 0x6800, lsl 0   
	bl circulo

	mov x8, #94
	mul x9, x8, x8
	movz w21, 0xD8, lsl 16
	movk w21, 0x5600, lsl 0  
	bl circulo

	mov x8, #92
	mul x9, x8, x8
	movz w21, 0xCB, lsl 16
	movk w21, 0x4800, lsl 0  
	bl circulo

	mov x8, #90
	mul x9, x8, x8
	movz w21, 0xBE, lsl 16
	movk w21, 0x3A00, lsl 0  
	bl circulo

	mov x8, #88
	mul x9, x8, x8
	movz w21, 0xA8, lsl 16
	movk w21, 0x2F00, lsl 0  
	bl circulo

	mov x8, #86
	mul x9, x8, x8
	movz w21, 0x92, lsl 16
	movk w21, 0x2400, lsl 0  
	bl circulo

	mov x8, #84
	mul x9, x8, x8
	movz w21, 0x7A, lsl 16
	movk w21, 0x1A00, lsl 0  
	bl circulo

	mov x8, #82
	mul x9, x8, x8
	movz w21, 0x64, lsl 16
	movk w21, 0x1200, lsl 0   
	bl circulo

	mov x8, #80
	mul x9, x8, x8
	movz w21, 0x50, lsl 16
	movk w21, 0x0C00, lsl 0   
	bl circulo

	mov x8, #78
	mul x9, x8, x8
	movz w21, 0x40, lsl 16
	movk w21, 0x0800, lsl 0
	bl circulo

	mov x8, #76
	mul x9, x8, x8
	movz w21, 0x30, lsl 16
	movk w21, 0x0500, lsl 0
	bl circulo

	mov x8, #74
	mul x9, x8, x8
	movz w21, 0x22, lsl 16
	movk w21, 0x0300, lsl 0
	bl circulo

	mov x8, #72
	mul x9, x8, x8
	movz w21, 0x18, lsl 16
	movk w21, 0x0200, lsl 0
	bl circulo

	mov x8, #70
	mul x9, x8, x8
	movz w21, 0x0F, lsl 16
	movk w21, 0x0100, lsl 0
	bl circulo

	mov x8, #68
	mul x9, x8, x8
	movz w21, 0x09, lsl 16
	movk w21, 0x0080, lsl 0
	bl circulo

	mov x8, #66
	mul x9, x8, x8
	movz w21, 0x05, lsl 16
	movk w21, 0x0040, lsl 0
	bl circulo

	mov x8, #64
	mul x9, x8, x8
	movz w21, 0x03, lsl 16
	movk w21, 0x0020, lsl 0
	bl circulo

	mov x8, #62
	mul x9, x8, x8
	movz w21, 0x01, lsl 16
	movk w21, 0x0010, lsl 0
	bl circulo

	mov x8, #60
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0008, lsl 0
	bl circulo

	mov x8, #58
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0004, lsl 0
	bl circulo

	mov x8, #56
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0002, lsl 0
	bl circulo

	mov x8, #54
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0001, lsl 0
	bl circulo

	mov x8, #52
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0001, lsl 0
	bl circulo

	mov x8, #50
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0001, lsl 0
	bl circulo

	mov x8, #48
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0001, lsl 0
	bl circulo

	mov x8, #46
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0000, lsl 0
	bl circulo

	mov x8, #44
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0000, lsl 0
	bl circulo

	mov x8, #42
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0000, lsl 0
	bl circulo

	mov x8, #40
	mul x9, x8, x8
	movz w21, 0x00, lsl 16
	movk w21, 0x0000, lsl 0  
	bl circulo

// nave

    BL dibujar_nave

// ODC 2025

    mov x6, #1              // Escala

    mov x1, #55
    mov x2, #264
    mov x0, x20
    movz x4, 0xFF, lsl 16 	// Blanco
    movk x4, 0xFFFF, lsl 0

    ldr x3, =font_O
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

    ldr x3, =font_D
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

    ldr x3, =font_C
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

    ldr x3, =font_2
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

    ldr x3, =font_0
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

	ldr x3, =font_2
    bl draw_char_scaled
	lsl x7, x6, 3           // x7 = 8 * escala
    add x1, x1, x7

    ldr x3, =font_5
    bl draw_char_scaled
	

// estrellas

    mov x0, #150        // centro x
    mov x1, #180        // centro y
    mov x2, x20
    bl star

    mov x0, #180		// centro x
    mov x1, #380		// centro y	
    mov x2, x20
    bl star

    mov x0, #400		// centro x
    mov x1, #80			// centro y
    mov x2, x20
    bl star

	mov x0, #430		// centro x
    mov x1, #450		// centro y
    mov x2, x20
    bl star

	mov x0, #530		// centro x
    mov x1, #320		// centro y
    mov x2, x20
    bl star

	mov x0, #530		// centro x
    mov x1, #30			// centro y
    mov x2, x20
    bl star

	mov x0, #50			// centro x
    mov x1, #10			// centro y
    mov x2, x20
    bl star

// estrellas mas grandes

	mov x0, #300        // centro x
    mov x1, #100        // centro y
    mov x2, x20
    bl star2

	mov x0, #500        // centro x
    mov x1, #400        // centro y
    mov x2, x20
    bl star2

	mov x0, #50         // centro x
    mov x1, #400        // centro y
    mov x2, x20
    bl star2

InfLoop:
	b InfLoop

