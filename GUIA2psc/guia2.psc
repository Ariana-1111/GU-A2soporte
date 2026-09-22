Algoritmo solicitudes
	
    Definir nombre, codigo, tipo, descripcion, prioridad, continuar Como Cadena
    Definir opciones, cantidad Como Entero
	
    cantidad <- 0
	Escribir "==================================="
    Escribir "        SOPORTE ACADEMICO  "
	Escribir "==================================="
	Escribir "A continuacion te pedimos registrar "
	Escribir "tus consultas o solicitudes"
	Escribir ""
	
    nombre <- validarTexto("Por favor, ingresa tu nombre:")
    codigo <- validarCodigo
	
    Repetir
        menu
        Leer opciones
        Mientras opciones < 1 O opciones > 5 Hacer
            Escribir "Opción inválida. Ingresa un número del 1 al 5:"
            Leer opciones
        FinMientras
		
        Segun opciones Hacer
            1: tipo <- "Matrícula"
            2: tipo <- "Pagos"
            3: tipo <- "Constancia"
            4: tipo <- "Problemas de plataforma"
            5: tipo <- "Otro"
        FinSegun
		
        descripcion <- validarTexto("Describe tu consulta o solicitud:")
        prioridad <- priorizar(tipo)
        resumen(nombre, codigo, tipo, descripcion, prioridad)
        cantidad <- cantidad + 1
		
        Escribir "¿Deseas registrar otra consulta? (si/no):"
        Leer continuar
        continuar <- Minusculas(continuar)
        Mientras continuar <> "si" Y continuar <> "no" Hacer
            Escribir "Respuesta no válida. Responde si o no:"
            Leer continuar
            continuar <- Minusculas(continuar)
        FinMientras
    Hasta Que continuar = "no"
	Escribir ""
	Escribir "................................."
    Escribir "  CONSULTAS REGISTRADAS: ", cantidad 
	Escribir "·································"
    calificarExperiencia
	
FinAlgoritmo

SubProceso menu
    Escribir "1. Matrícula"
    Escribir "2. Pagos"
    Escribir "3. Constancia"
    Escribir "4. Problemas de plataforma"
    Escribir "5. Otro"
FinSubProceso

Funcion c <- validarCodigo
    Definir c Como Cadena
    Repetir
        Escribir "Ingresa tu código (Ej: N00444505):"
        Leer c
        Si Longitud(c) < 8 O SubCadena(c, 1, 1) <> "N" Entonces
            Escribir "Código no válido. Revisa e intenta nuevamente"
        FinSi
    Hasta Que Longitud(c) >= 8 Y SubCadena(c, 1, 1) = "N"
FinFuncion

Funcion t <- validarTexto(mensaje)
    Definir t, c Como Cadena
    Definir i Como Entero
    Definir esValido Como Logico
    Repetir
        Escribir mensaje
        Leer t
        esValido <- Verdadero
        Si Longitud(t) = 0 Entonces
            esValido <- Falso
        SiNo
            Para i <- 1 Hasta Longitud(t) Hacer
                c <- Mayusculas(SubCadena(t, i, i))
                Si (c < "A" O c > "Z") Y c <> " " Y c <> "Á" Y c <> "É" Y c <> "Í" Y c <> "Ó" Y c <> "Ú" Y c <> "Ñ" Entonces
                    esValido <- Falso
                FinSi
            FinPara
        FinSi
        Si esValido = Falso Entonces
            Escribir "No es valido, por favor usa solo letras"
        FinSi
    Hasta Que esValido = Verdadero
FinFuncion

Funcion p <- priorizar(tipo)
    Definir p Como Cadena
    Segun tipo Hacer
        "Matrícula", "Pagos": p <- "ALTA"
        "Problemas de plataforma": p <- "MEDIA"
        De Otro Modo: p <- "BAJA"
    FinSegun
FinFuncion

SubProceso resumen(nombre, codigo, tipo, descripcion, prioridad)
	Escribir "____________________________________"
    Escribir "       RESUMEN DE LA CONSULTA"
	Escribir "------------------------------------"
    Escribir "Nombre: ", nombre
    Escribir "Código: ", codigo
    Escribir "Tipo: ", tipo
    Escribir "Prioridad: ", prioridad
    Escribir "Descripción: ", descripcion
FinSubProceso

SubProceso calificarExperiencia
    Definir resp, comentario Como Cadena
    Definir nota Como Entero
    Escribir "¿Deseas calificar tu experiencia? si/no:"
    Leer resp
    resp <- Minusculas(resp)
    Mientras resp <> "si" Y resp <> "no" Hacer
        Escribir "Respuesta no válida. Responde si o no:"
        Leer resp
        resp <- Minusculas(resp)
    FinMientras
    Si resp = "si" Entonces
        Escribir "Califica la atención del 1 al 5:"
        Leer nota
        Mientras nota < 1 O nota > 5 Hacer
            Escribir "Opción inválida. Ingresa un número del 1 al 5:"
            Leer nota
        FinMientras
		
		Escribir ""
        Escribir "Ingresa un comentario (opcional):"
        Leer comentario
		
		Escribir ""
		Escribir "============================================="
		Escribir "    TUS CONSULTAS SERAN ATENDIDAS PRONTO"
        Escribir " ¡Gracias por tu calificación y comentarios!."
		Escribir "============================================="
    SiNo
		Escribir "=========================================="
		Escribir "   TUS CONSULTAS SERAN ATENDIDAS PRONTO"
        Escribir " No dudes en volver para nuevas consultas."
		Escribir " ¡Hasta pronto!"
		Escribir "=========================================="
    FinSi
FinSubProceso