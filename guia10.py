from queue import LifoQueue 
def contar_lineas(nombre_archivo:str) -> int:
    num:int = 0
    archivo = open(nombre_archivo, "r")
    contenido = archivo.readlines()
    archivo.close()
    return len(contenido)

print('Tiene que devolver 5 lineas y devolvio {cantidad}'.format(cantidad = contar_lineas('texto.txt')))
print('se cuentan las lineas vacias')

"""
. una funci´on existePalabra(in palabra : str, in nombre archivo : str) → 
bool que dice si una palabra existe en un archivo de texto o no

"""
def cantidad_de_apariciones(nombre_archivo:str, palabra:str) -> int:
    num:int = 0
    archivo = open(nombre_archivo,"r") 
    contenido = archivo.read().split()
    archivo.close()
    for p in contenido:
        if p == palabra:
            num = num +1
    return num
print('Tiene que devolver 5 y devolvio {cantidad}'.format(cantidad = cantidad_de_apariciones('texto.txt', 'Turing')))

def existePalabra(palabra: str, nombre_archivo:str) -> bool:
    existe: bool = False
    apariciones_de_palabra = cantidad_de_apariciones(nombre_archivo, palabra)
    if apariciones_de_palabra > 0:
        existe= True
    return existe
print('Tiene que devolver True y devolvio {valor}'.format(valor = existePalabra('Turing','texto.txt')))

def clonar_sin_comentarios(archivo: str) -> str:
    comentario_marcador: str = '#'
    espacio_marcador: str = ' '
    contenido = open(archivo, 'r')
    lineas =  contenido.readlines()
    contenido.close()
    archivo_sin_comentario = open(archivo[:-4] + '_sin_comentarios.txt', 'w')
    i = 0
    for linea in lineas:
        primer_caracter = linea[0] 
        if primer_caracter != espacio_marcador and primer_caracter != comentario_marcador:
            archivo_sin_comentario.write(linea)
        elif primer_caracter == espacio_marcador:
            #veo_con_detalle
            separo_por_espacio = linea.split() #tengo ahora una lista de palabras
            #separo_por_espacio[0][0] es la primera letra de la primera palabra
            if separo_por_espacio[0][0] != comentario_marcador:
                archivo_sin_comentario.write(linea)
    archivo_sin_comentario.close()
    print('clonado con exito')
        
clonar_sin_comentarios('texto.txt')

def da_vuelta_el_texto(archivo:str)->str:
    nuevo_archivo = open(archivo[:-4] + '_invertido.txt', "w")
    file = open(archivo, "r")
    contenido = file.readlines()
    file.close()

    for i in range(len(contenido)-1,-1, -1):
        nuevo_archivo.write('\n'+contenido[i])

    nuevo_archivo.close()

da_vuelta_el_texto('texto.txt')

def agregar_al_archivo(archivo:str, frase:str):
    file = open(archivo, 'a')
    file.write('\n'+frase)
    file.close()

agregar_al_archivo('texto.txt', 'Esta oracion la agregue con agregar_el_archivo')

def agregar_al_ppio_del_arch(archivo:str, frase:str):
    file = open(archivo, 'r')
    contenido = file.readlines()
    file.close()
    file = open(archivo, 'w')
    file.seek(0)
    file.write('\n'+frase)
    for cont in contenido:
        file.write(cont)
    file.close()

agregar_al_ppio_del_arch('texto.txt', 'Esta oracion la agregue con agregar_al_ppio_archivo\n')
"""
Implementar una funci´on que lea un archivo en modo *binario* y devuelva la lista de ’palabras legibles’. 
Vamos a
definir una palabra legible como
secuencias de texto formadas por numeros, letras mayusculas/minusculas y los caracteres ’ ’(espacio)
 y ’ ’(guion bajo)
que tienen longitud >= 5

"""
def read_binarios(archivo:str) -> list:
    file = open(archivo, 'rb') #read binary
    cont_bi = file.read()
    l:list = []
    palabra = ''
    validos = list("ABCDEFGHIJKLMNÑOPQRSTUVWXY -abcdefghijklmnñopqrstuvwxyz1234567890")

    for con in cont_bi:
        carc = chr(con)
        if carc in validos:
            palabra = palabra + carc
        else:
            l.append(palabra)
            palabra = ""
    limp = []
    for palabra in l:
        if len(palabra) > 4:
            limp.append(palabra)
    return limp
#print(read_binarios('guia1_2021.pdf'))
def lectura_csv(lu:str)->float:
    archivo = open('sample.csv', 'r')
    filas = archivo.readlines()
    archivo.close()
    notas:list[float] = []
    promedio = 0
    for fila in filas:
        celdas = fila.split(",")
        if celdas[0] == lu:
            notas.append(float(celdas[-1]))
    for nota in notas:
        promedio = promedio + nota 
    promedio = promedio/len(notas)
    return promedio

lectura_csv("123/20")
    

"""
##pilas
pila = LifoQueue()
pila.put(1)
pila.put(4)
pila.put(2)
pila.put(3)

print(pila.empty())

def buscarElMaximo(pila: LifoQueue([int]))->int:
    res:int = 0 
    esta_vacia = pila.empty()
    while not(esta_vacia):  
        if elem1 >= elem2:
            elem2 = pila.get()
        else:
            elem1 = elem2
            elem2 = pila.get()

        esta_vacia = pila.empty()

    if elem2>=elem1:
        res = elem2
    else:
        res = elem1
    return res          

# dict
def agrupar_por_longitud(nombre:str)->dict:
    diccionario = {}
    with open(nombre, "r") as file:
        texto = file.read().split()

    for palabra in texto:
        if len(palabra) not in diccionario:
            diccionario[len(palabra)] = 1
        else:
            diccionario[len(palabra)] = diccionario[len(palabra)] + 1
    return diccionario

"""