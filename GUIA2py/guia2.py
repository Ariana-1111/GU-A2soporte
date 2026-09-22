def validarnombre(mensajeinicio, mensajeerror):
    valido = False
    while not valido:
        texto = input(mensajeinicio)
        palabras = texto.split()
        if len(palabras) >= 2:
            valido = True
            for palabra in palabras:
                if len(palabra) < 2 or not palabra.isalpha():
                    valido = False
        if not valido:
            print(mensajeerror)
    return texto

def validardescripcion(mensajeinicio, mensajeerror):
    valido = False
    while not valido:
        texto = input(mensajeinicio)
        palabras = texto.split()
        if len(palabras) >= 5:
            valido = True
            for palabra in palabras:
                if len(palabra) < 2:
                    valido = False
        if not valido:
            print(mensajeerror)
    return texto

def validarcodigo():
    codigovalido = False
    while not codigovalido:
        codigo = input("\nIngresa tu codigo real o no podremos ayudarte (Ej: N00444505): ")
        if len(codigo) == 9 and (codigo[0] == "N" or codigo[0] == "n") and codigo[1:].isdigit():
            codigovalido = True
        else:
            print("Codigo no valido, revisa e intenta nuevamente\n")
    return codigo

def mostrarmenu():
    print("      \n-----· MENU DE OPCIONES ·-----")
    print("Selecciona el tipo de consulta o solicitud:")
    print("1. 📚 Matricula ")
    print("2. 💳 Pagos ")
    print("3. 📄 Constancia ")
    print("4. 💻 Problemas de plataforma ")
    print("5. 📌 Otro ")

def asignarprioridad(opcion):
    if opcion == 1:
        return "Matricula", "ALTA"
    elif opcion == 2:
        return "Pagos", "ALTA"
    elif opcion == 3:
        return "Constancia", "BAJA"
    elif opcion == 4:
        return "Problemas de plataforma", "ALTA"
    elif opcion == 5:
        return "Otro", "BAJA"

def mostrarresumen(nombre, codigo, tipo, prioridad, descripcion):
    print("\n____________________________________")
    print("|      RESUMEN DE LA CONSULTA      |")
    print("------------------------------------")
    print(f"Nombre: {nombre}")
    print(f"Codigo: {codigo}")
    print(f"Tipo: {tipo}")
    print(f"Prioridad: {prioridad}")
    print(f"Descripcion: {descripcion}")

def calificarexperiencia():
    resp = ""
    while resp not in ["si", "SI", "no", "NO"]:
        resp = input("¿Deseas calificar tu experiencia? si/no:")
        if resp not in ["si", "SI", "no", "NO"]:
            print("\nRespuesta no valida, responde solo si o no.")
    if resp.lower() == "si":
        nota = 0
        while nota < 1 or nota > 5:
            print("\nCalifica la atencion:")
            print("1. Muy malo \U0001F62A")
            print("2. Malo \U0001F61E")
            print("3. Regular \U0001F642")
            print("4. Bueno \U0001F600")
            print("5. Muy bueno \U0001F917")
            e = input("\nIngresa tu calificacion 1-5: ")
            if e in ["1", "2", "3", "4", "5"]:
                nota = int(e)
            else:
                print("\nOpcion no valida, escribe un numero del 1 al 5")
        
        comentario = input("\nIngresa un comentario (opcional): ")
        print("\n=============================================")
        print(" << TUS CONSULTAS SERAN ATENDIDAS PRONTO >>")
        print(" ¡Gracias por tu calificacion y comentarios!")
        print(" ¡Hasta pronto!")
        print("=============================================\n")
    else:
        print("\n==========================================")
        print(" << TUS CONSULTAS SERAN ATENDIDAS PRONTO >>")
        print(" No dudes en volver para nuevas consultas.")
        print(" ¡Hasta pronto!")
        print("==========================================\n")

def main():
    print("=================================================")
    print("|             · SOPORTE ACADEMICO ·             |")
    print("| Bienvenido, lamentamos que nuestros servicios |")
    print("| hayan presentado inconvenientes pero estamos  |")
    print("| aqui para ayudarte en lo que necesites.       |")
    print("=================================================\n")

    cantidad = 0
    continuar = "si"
    nombre = validarnombre("Por favor, ingresa tu nombre y apellido: ", "\nNombre no valido, usa tu nombre y apellido real")
    codigo = validarcodigo()

    while continuar.lower() == "si":
        mostrarmenu()
        opcion = 0
        while opcion < 1 or opcion > 5:
            entrada = input("\nSelecciona una opcion 1-5:")
            if entrada in ["1", "2", "3", "4", "5"]:
                opcion = int(entrada)
            else:
                print("\nOpcion no valida, ingresa un numero del 1 al 5.")
        tipo, prioridad = asignarprioridad(opcion)
        descripcion = validardescripcion("Describe tu consulta, usa minimo 5 palabras: ", "\nEs necesario conocer detalles, escribe al menos 5 palabras")
        mostrarresumen(nombre, codigo, tipo, prioridad, descripcion)
        cantidad += 1
        continuar = ""

        while continuar.lower() not in ["si", "no"]:
            continuar = input("\n¿Todavia tienes otra consulta? si/no:")
            if continuar.lower() not in ["si", "no"]:
                print("\nRespuesta no valida, escribe solo si o no")
    print("\n.................................")
    print(f" >> CONSULTAS REGISTRADAS: {cantidad}")
    print("·································\n")

    calificarexperiencia()

main()