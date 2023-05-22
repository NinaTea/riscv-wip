#es es la suma de todos los elementos de s
def suma_elementos(s:list)-> int:
    suma:int=0
    for i in s:
        suma+=i
    return suma

""" 
ordenados (in s:seq<Z>) : Bool {
requiere: { True }
asegura: { res = true ↔ (∀i : Z)(0 ≤ i < (|s| − 1) → s[i] < s[i + 1]}
"""
def ordenados(s:list)->bool:
    res:bool= False
    i:int=0
    while (i < len(s) - 1) and s[i] < s[i+1]:
        i= i+1
    if i == len(s)-1:
        res=True
    return res

""" 
dada una cadena de texto (string), devolver verdadero si  ́esta es pal ́ındroma (se lee igual en ambos sentidos), falso en
caso contrario.
"""
def es_palindroma(s:list) -> bool:
    res:bool=False
    i:int=0
    while i < len(s)//2 and s[i]==s[-1*(i+1)]:
        i=i+1
    if i == len(s)//2:
        res=True
    return res

#segunda parte
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