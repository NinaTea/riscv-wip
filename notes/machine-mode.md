## Machine-Level (M-mode) ISA v1.12

Info from edx course. 

M-mode is used for low-level access to a hardware platform and is the first mode entered at reset, when the processor finishes initializing and is ready to execute code.

Propiedades del M-mode:
- Non-maskable interrupciones
- Control de la memoria física (atributos y protección) (PMA)

### Non-maskable interrupts (NMI)

Para errores de hardware.

Todos los errores **tienen registri mcause** que indica la causa del error.

Los NMI no resetean el procesador, entonces podemos diagnosticar el error y actuar en consecuencia.

### Manejo de memoria - PMA

PMA = Physical Memory attributes

Engloba todo lo relacionado con la memoria física, como los atributos de la memoria(propiedades de las regiones, si son ejecutables o no, qué cosas están permitidas, espacios libres, etc).

En RISC-V existe el **PMA checker**. Queda para el próximo capítulo.

#### Protección de la memoría física - PMP

RISC-V PMP limita el espacio físico al que un programa corriendo en un hart puede acceder.

Hay una unidad PMP opcional que te da registros de control para cada hart en donde describís los privilegios que tiene un programa dentro de una región de memoria.







