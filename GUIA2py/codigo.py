#este codigo fue el que la IA redacto en un inicio
def validar_texto(mensaje_input, mensaje_error):
    """Función con retorno para validar texto obligatorio."""
    valido = False
    while not valido:
        texto = input(mensaje_input)
        if texto != "":
            valido = True
            for caracter in texto:
                if not (caracter.isalpha() or caracter == " "):
                    valido = False
        if not valido:
            print(mensaje_error)
    return texto

def validar_codigo():
    """Función con retorno para validar el código del estudiante."""
    codigo_valido = False
    while not codigo_valido:
        codigo = input("Ingresa tu codigo (Ej: N00444505): ")
        if len(codigo) >= 8 and (codigo[0] == "N" or codigo[0] == "n"):
            codigo_valido = True
        else:
            print("Codigo no valido. Revisa e intenta nuevamente.")
    return codigo

def mostrar_menu():
    """Función sin retorno para mostrar el menú principal."""
    print("\n--- MENU DE OPCIONES ---")
    print("1. Matricula")
    print("2. Pagos")
    print("3. Constancia")
    print("4. Problemas de plataforma")
    print("5. Otro")

def asignar_prioridad(opcion):
    """Función con retorno para calcular o asignar prioridad según tipo de consulta."""
    if opcion == 1:
        return "Matricula", "ALTA"
    elif opcion == 2:
        return "Pagos", "ALTA"
    elif opcion == 3:
        return "Constancia", "BAJA"
    elif opcion == 4:
        return "Problemas de plataforma", "MEDIA"
    elif opcion == 5:
        return "Otro", "BAJA"

def mostrar_resumen(nombre, codigo, tipo, prioridad, descripcion):
    """Función sin retorno que usa paso de parámetros para mostrar el resumen."""
    print("\n____________________________________")
    print("       RESUMEN DE LA CONSULTA")
    print("------------------------------------")
    print(f"Nombre: {nombre}")
    print(f"Codigo: {codigo}")
    print(f"Tipo: {tipo}")
    print(f"Prioridad: {prioridad}")
    print(f"Descripcion: {descripcion}")

def calificar_experiencia():
    """Función modular para manejar la encuesta final."""
    resp = ""
    while resp not in ["si", "SI", "no", "NO"]:
        resp = input("¿Deseas calificar tu experiencia? (si/no): ")
        if resp not in ["si", "SI", "no", "NO"]:
            print("Respuesta no valida. Responde si o no.")

    if resp.lower() == "si":
        nota = 0
        while nota < 1 or nota > 5:
            e = input("Califica la atencion del 1 al 5: ")
            if e in ["1", "2", "3", "4", "5"]:
                nota = int(e)
            else:
                print("Opcion invalida. Ingresa un numero del 1 al 5.")
        
        comentario = input("\nIngresa un comentario (opcional): ")
        print("\n=============================================")
        print("    TUS CONSULTAS SERAN ATENDIDAS PRONTO")
        print(" ¡Gracias por tu calificacion y comentarios!")
        print("=============================================")
    else:
        print("\n==========================================")
        print("   TUS CONSULTAS SERAN ATENDIDAS PRONTO")
        print(" No dudes en volver para nuevas consultas.")
        print(" ¡Hasta pronto!")
        print("==========================================")

def main():
    """Programa principal que controla el flujo y el alcance de las variables locales."""
    print("===================================")
    print("        SOPORTE ACADEMICO  ")
    print("===================================")
    print("A continuacion te pedimos registrar \ntus consultas o solicitudes\n")

    cantidad = 0
    continuar = "si"

    while continuar.lower() == "si":
        # Uso de variables locales y llamadas a funciones
        nombre = validar_texto("Por favor, ingresa tu nombre: ", "Nombre no valido. Ingresa solo letras.")
        codigo = validar_codigo()
        
        mostrar_menu()
        
        opcion = 0
        while opcion < 1 or opcion > 5:
            entrada = input("Selecciona una opcion (1-5): ")
            if entrada in ["1", "2", "3", "4", "5"]:
                opcion = int(entrada)
            else:
                print("Opcion invalida. Ingresa un numero del 1 al 5.")
        
        tipo, prioridad = asignar_prioridad(opcion)
        descripcion = validar_texto("Describe tu consulta o solicitud: ", "Descripcion no valida.")
        
        mostrar_resumen(nombre, codigo, tipo, prioridad, descripcion)
        cantidad += 1
        
        continuar = ""
        while continuar.lower() not in ["si", "no"]:
            continuar = input("\n¿Deseas registrar otra consulta? (si/no): ")
            if continuar.lower() not in ["si", "no"]:
                print("Respuesta no valida. Responde si o no.")

    print("\n.................................")
    print(f"  CONSULTAS REGISTRADAS: {cantidad}")
    print("·································")
    
    calificar_experiencia()

# Ejecución del programa
if __name__ == "__main__":
    main()