from queue import LifoQueue 

def cantidad_de_apariciones(nombre_archivo:str, palabra:str) -> int:
    num:int = 0
    with open(nombre_archivo,"r") as file:
        contenido = file.read().split()
    for p in contenido:
        if p == palabra:
            num = num +1
    return num


def contar_lineas(nombre_archivo:str, palabra:str) -> int:
    num:int = 0
    with open(nombre_archivo,"r") as file:
        contenido = file.readlines()
    return len(contenido)

##pilas
pila = LifoQueue()
pila.put(1)
pila.put(4)
pila.put(2)
pila.put(3)

print(pila.empty())

def buscarElMaximo(pila: LifoQueue([int]))->int:
    res:int = 0 #la espec dice in , entonces a la pila la tengo que dejar intacta.
    #entonces tenemos que trabajar sobre una copia. Si era inout, no hace falta la copia.
    """
    elem1 = pila.get() 
    if pila.empty():
        res = elem1
    else:
        elem2 = pila.get() #¿?
        if pila.empty():
            if elem1>=elem2:
                res = elem1
            else:
                res = elem2
    """
     #aca estoy asumiendo que tiene 2 elementos o mas
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

#ej 4
def da_vuelta_el_texto(archivo:str)->str:
    nuevo_archivo = open("archivo_inverso2.txt", "a")

    with open(archivo, "r") as file:
        contenido = file.readlines()
        print(contenido)
    for i in range(len(contenido)-1,-1, -1):
        
        nuevo_archivo.write(contenido[i] + "\n")

    nuevo_archivo.close()
    return "archivo_inverso2.txt"
    
