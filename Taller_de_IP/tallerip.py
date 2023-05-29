#segunda parte
import random
"""
1. Implementar una funcion que dada una lista de n ́umeros, en las posiciones pares borra el valor original y coloca un
cero. Esta funci ́on modifica el par ́ametro ingresado. Nota: La lista ser ́a un tipo inout.
"""
def borrar_posiciones_pares(s:list)->list: #si s es un inout, eso se aclara en python?
    i:int = 0
    while i < len(s):
        if i % 2 == 0:
            s[i] = 0
        i=i+1
    return s

"""
Implementar la funcion del punto anterior pero esta vez sin modificar la lista original, devolviendo una nueva lista,
igual a la anterior pero con las posiciones pares en cero. Nota: La lista ser ́a de tipo in.
"""
def idem_anterior_pares(s:list)-> list:
    l = s.copy()
    i:int = 0
    while i < len(s):
        if i % 2 == 0:
            l[i] = 0
        i=i+1
    return l

def sacaVocales(s:str) -> str:
    res:str = ""
    for i in s:
        if i.lower() not in "aeiou":
            res = res + i
    return res

""" 
problema reemplazaVocales (in s:seq<Char>) : seq<Char> {
requiere: { True }
asegura: { (∀i : Z)(0 ≤ i < |res| → (pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>, s[i]) ∧ res[i] = ‘ ’) ∨
(¬ pertenece(<‘a’,‘e’,‘i’,‘o’,‘u’>, s[i]) ∧ res[i] = s[i] ) ) }
}
"""
def reemplazaVocales(s:list)->list:
    res=s.copy()
    i:int=0
    while i < len(s):
        if s[i].lower() in "aeiou":
            res[i] = "-"
        else:
            res[i] = s[i]
        i=i+1
    return res

"""
problema daVueltaStr (in s:seq<Char>) : seq<Char> {
requiere: { True }
asegura: { (∀i : Z)(0 ≤ i < |res| → (res[i]=s[|s|-i-1]) }
"""
def daVueltaStr(s:str)-> str:
   # { (∀i : Z)(0 ≤ i < |res| → (res[i]=s[|s|-i-1]) }
    i:int=0
    l:str= ""
    while i < len(s):
        l = l + s[-1*(i+1)]
        i=i+1
    return l

def nombreDeEstudiantes():
    nombreEstudiante:str = ""
    nombresEstudiantes:list = []
    while nombreEstudiante.lower()  != "listo":
        nombreEstudiante = input("Ingrese nombre del estudiante. Cuando no quiera agregar mas, escriba: Listo ")
        if nombreEstudiante != "listo":
            nombresEstudiantes.append(nombreEstudiante)
    return nombresEstudiantes

def historial_monedero():
    monedero:int = 0
    historial:list = []
    accion:str = ""
    while accion != "x":
        accion = input("Ingrese la operacion que quiere realizar: C; cargar, D; descontar, X; finalizar").lower()
        if accion == "c":
            monto = int(input("Ingrese el monto a cargar: Solo enteros"))
            historial.append((accion, monto))
            monedero = monedero + monto
            print("El saldo actual en su monedero es: ", monedero)
        else:
            monto = int(input("Ingrese el monto a descontar: Solo enteros"))
            historial.append((accion, monto))
            monedero = monedero - monto
            print("El saldo actual en su monedero es: ", monedero)

def siete_y_medio():
    valor:int = 0
    cartas:list = []
    accion:str = ""
    while accion != "plantarse":
        accion = input("te plantas o seguis? ")
        if accion == "sigo":
            val_posibles:list = [0,1,2,3,4,5,6,7,8,9,10,11,12]
            numero_random = random.choices(val_posibles, weights=[1,1,1,1,1,1,1,1,0,0,1,1,1], k=1)[0] #devuelve una lista
            cartas.append(numero_random)
            if numero_random == 10 or numero_random == 11 or numero_random == 12:
                valor = valor + 0.5
            else:
                valor = valor + 1
            if valor > 7.5:
                print("perdiste. Estas cartas te salieron: ", cartas)
                accion = "plantarse"

def perteneceACadaUno(s:list, e:int)->list:
    res:bool=False
