
section .text

; Marca un ejercicio como aún no completado (esto hace que no corran sus tests)
FALSE EQU 0
; Marca un ejercicio como hecho
TRUE  EQU 1

; Marca el ejercicio 2A como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - ej2a
global EJERCICIO_2A_HECHO
EJERCICIO_2A_HECHO: db FALSE ; Cambiar por `TRUE` para correr los tests.

; Dada una imagen origen escribe en el destino `scale * px + offset` por cada
; píxel en la imagen.
;
; Parámetros:
;   - dst_depth: La imagen destino (mapa de profundidad). Está en escala de
;                grises a 32 bits con signo por canal.
;   - src_depth: La imagen origen (mapa de profundidad). Está en escala de
;                grises a 8 bits sin signo por canal.
;   - scale:     El factor de escala. Es un entero con signo de 32 bits.
;                Multiplica a cada pixel de la entrada.
;   - offset:    El factor de corrimiento. Es un entero con signo de 32 bits.
;                Se suma a todos los píxeles luego de escalarlos.
;   - width:     El ancho en píxeles de `src_depth` y `dst_depth`.
;   - height:    El alto en píxeles de `src_depth` y `dst_depth`.
global ej2a
ej2a:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
; 	; ubicación según la convención de llamada. Prestá atención a qué
; 	; valores son de 64 bits y qué valores son de 32 bits.
; 	;
; 	; rdi = int32_t* dst_depth
; 	; rsi = uint8_t* src_depth
; 	; edx  = int32_t  scale
; 	; ecx = int32_t  offset
; 	; r8d = int      width
; 	; r9d = int      height

; 	;prologo
	push rbp
	mov rbp, rsp

	;iteraciones
	xor rax, rax
	mov eax, r8d
	mul r9d ; eax = width * height 
	
    ; se que me hice lio contando las iteraciones, en ambos ejercicios
	; no sabia que este tipo de preguntas valian entonces opte por no preguntar

	;en ambos ejercicios tengo lecturas invalidas
	shr rax, 4; rax = rax / 4

.ciclo:
	cmp rax, 0
	je .fin

	movq xmm0, [rsi] ; xmm0 = depths de 8 bits

	;extiendo sin signo
	pmovzxbd xmm0, xmm0 ; xmm0 = depths de 32 bits

	;en edx tengo scale
	;necesitaria un registro con | scale | ... | scale |

	pxor xmm2, xmm2
	movd xmm2, edx ; cargo el scale en xmm1
	
	;con el shuf double pongo el scale donde lo necesito
	pshufd xmm2, xmm2, 0b00000000 

	;como dicen que p*offset + scala entra en 32 bits, no me preocupo y uso pmuldq
	;sino tendria que separar en la parte baja y en la parte alta de la 
	;multiplicacion
	pmuldq xmm0, xmm2

	;para el offset hago lo mismo que en scale
	pxor xmm3, xmm3
	movd xmm3, ecx 

	pshufd xmm3, xmm3, 0b00000000 ;|offset | offset | offset | offset |

	paddd xmm0, xmm3 ; | p*scale + offset | p*scale + offset | p*scale + offset | p*scale + offset |

	movq [rdi], xmm0

	add rdi, 8
	add rsi, 8
	dec rax
	jmp .ciclo

.fin:
	;epilogo
	pop rbp
	ret

; Marca el ejercicio 2B como hecho (`true`) o pendiente (`false`).
;
; Funciones a implementar:
;   - ej2b
global EJERCICIO_2B_HECHO
EJERCICIO_2B_HECHO: db FALSE ; Cambiar por `TRUE` para correr los tests.

; Dadas dos imágenes de origen (`a` y `b`) en conjunto con sus mapas de
; profundidad escribe en el destino el pixel de menor profundidad por cada
; píxel de la imagen. En caso de empate se escribe el píxel de `b`.
;
; Parámetros:
;   - dst:     La imagen destino. Está a color (RGBA) en 8 bits sin signo por
;              canal.
;   - a:       La imagen origen A. Está a color (RGBA) en 8 bits sin signo por
;              canal.
;   - depth_a: El mapa de profundidad de A. Está en escala de grises a 32 bits
;              con signo por canal.
;   - b:       La imagen origen B. Está a color (RGBA) en 8 bits sin signo por
;              canal.
;   - depth_b: El mapa de profundidad de B. Está en escala de grises a 32 bits
;              con signo por canal.
;   - width:  El ancho en píxeles de todas las imágenes parámetro.
;   - height: El alto en píxeles de todas las imágenes parámetro.
global ej2b
ej2b:
	; Te recomendamos llenar una tablita acá con cada parámetro y su
	; ubicación según la convención de llamada. Prestá atención a qué
	; valores son de 64 bits y qué valores son de 32 bits.
	;
	; rdi = rgba_t*  dst
	; rsi = rgba_t*  a
	; rdx = int32_t* depth_a
	; rcx = rgba_t*  b
	; r8 = int32_t* depth_b
	; r9d = int      width
	; dword [rbp + 0x10] = int height

	;prologo
	push rbp
	mov rbp, rsp

	;iteraciones
	xor rax, rax
	mov eax, dword [rbp + 0x10]
	mul r9d ; eax = width * height

	; iteraciones
	shr rax, 4 ;  rax = rax / 4

.ciclo:
	cmp rax, 0
	je .fin

	;Imagenes a y b sin signo por canal(cada pixel 4 bytes)

	movq xmm0, [rsi] ; xmm0 = |a3|a2|a1|a0|
	movq xmm1, [rcx] ; xmm1 = |b3|b2|b1|b0|
	

	;profundidades
	;con signo, 32 bits por pixel
	movq xmm2, [rdx] ; xmm2 = |depth a3|depth a2|depth a1|depth a0|
	movq xmm3, [r8] ; xmm3 =  |depth b3|depth b2|depth b1|depth b0|

	;el compare es signado
	;command dst, src 
	;esta va a ser mi mascara

	movdqu xmm4, xmm3 ;  xmm4 =  |depth b3|depth b2|depth b1|depth b0|

	pcmpgtd xmm3, xmm2, ; xmm3 =  1 si depth b >  depth a, 0 caso contrario
	
	pcmpeqd xmm4, xmm0 ; xmm3 = 1 si depth A = depth B, 0 caso contrario

	por xmm4, xmm3 ; xmm4 = 1 si B >= a

	pand xmm1, xmm4 ; xmm1 = sobreviven B los casos depth b >= depth a
	
	pandn xmm4, xmm4 ; doy vuelta la mascara

	pand xmm0, xmm4 ; xmm0 = sobreviven A depth a < depth b

	paddd xmm0, xmm1 ; sumo ambos casos

	movq [rdi], xmm0 ; cargo el resultado en destino

	;actualizo ciclo
	dec rax
	add rdi, 8
	add rsi, 8

	add rdx, 8
	add rcx, 8
	add r8, 8
	
	jmp .ciclo

.fin:
	;epilogo
	pop rbp
	ret
