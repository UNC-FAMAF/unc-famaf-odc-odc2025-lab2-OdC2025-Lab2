Informe de Laboratorio – OdC 2025
Nombre y Apellido del Grupo
Grupo N.º: G33

Integrantes:
Integrante 1: Ariel Corte

Integrante 2: Gino Bringa

Integrante 3: Ignacio Narvaja

Integrante 4: Roland Martínez King

Descripción del Ejercicio 1
En este primer ejercicio se inicializó correctamente el framebuffer de la Raspberry Pi y se desarrolló una rutina que permite colorear todos los píxeles de la pantalla con un color uniforme. Este ejercicio sirvió como base para entender el acceso directo a memoria de video, los cálculos de dirección en el framebuffer, y la interacción con hardware de bajo nivel usando ensamblador ARMv8.

Descripción del Ejercicio 2
El segundo ejercicio consistió en implementar una animación en pantalla usando ensamblador ARMv8, cumpliendo los siguientes requerimientos:

Fondo no continuo: Se generó un fondo con múltiples elementos visuales como cielo celeste, tierra marrón, césped verde, sol amarillo con rayos pixelados y aves negras volando.

-Dos figuras distintas:

Figura 1: Animación cuadro por cuadro del personaje Sonic en movimiento, compuesta por múltiples imágenes que representan distintas fases de la corrida.

Figura 2: Un edificio azul simulado mediante bloques rectangulares, junto a otros elementos fijos.

Tres colores o más: Se emplearon múltiples colores (celeste, marrón, verde, rojo, azul, negro, amarillo, blanco, etc.) distribuidos en figuras, fondo y texto.

Texto "OdC 2025": Se colocó en la parte superior izquierda de la pantalla, dibujado a través de rutinas propias de dibujo de texto con bloques.

Movimiento: Sonic se anima a través de una secuencia de imágenes tipo “sprite” que cambia cada pocos ciclos, logrando la ilusión de movimiento continuo (animación fluida).

Duración: El bucle principal de animación corre indefinidamente (o más de 10 segundos garantizados).

Se utilizó únicamente código assembler para generar cada frame, sin lectura desde archivos externos ni imágenes precompiladas, cumpliendo así con las restricciones del enunciado.

La animación fue programada enteramente en ensamblador, respetando las restricciones impuestas por el ejercicio, y fue ejecutada sobre una emulación de Raspberry Pi 3 a través de QEMU.

Justificación de Instrucciones ARMv8 Utilizadas (fuera del subconjunto LEGv8)
Se utilizaron varias instrucciones fuera del subconjunto LEGv8 académico, que se detallan a continuación:

movz, movk: utilizadas para cargar valores de 32 bits en registros. Justificadas porque son necesarias para inicializar colores y direcciones de memoria.

str, ldr, stur: permiten la lectura y escritura en memoria. Son esenciales para trabajar con el framebuffer y registros periféricos.

cbz, cbnz, subs, b.ne: instrucciones de control de flujo condicional, fundamentales para implementar bucles, condiciones y lógica de movimiento en la animación.

bl, ret: para implementar subrutinas reutilizables (procedimientos de dibujo, delay, etc.).

Estas instrucciones son necesarias en un entorno bare-metal para lograr eficiencia, modularidad y control sobre el hardware, y no pueden ser reemplazadas por instrucciones del subconjunto LEGv8 sin comprometer la funcionalidad básica del sistema.

Video de la Animación
La animación fue grabada en ejecución y se encuentra subida al Padlet oficial del curso, en la sección correspondiente a OdC 2025 – Grupo G33.
