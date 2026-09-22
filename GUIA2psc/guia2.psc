Algoritmo solicitudes
	
    Definir nombre, codigo, tipo, descripcion, prioridad, continuar Como Cadena
    Definir opciones, cantidad Como Entero
    cantidad <- 0
	
    Escribir "==================================="
    Escribir "        SOPORTE ACADEMICO"
    Escribir "==================================="
    Escribir "A continuacion te pedimos registrar"
    Escribir "tus consultas o solicitudes"
    Escribir ""
	
    nombre <- validarTexto("Por favor, ingresa tu nombre y apellido:", 2)
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
		
        descripcion <- validarTexto("Describe tu consulta o solicitud (mínimo 5 palabras):", 5)
        prioridad <- priorizar(tipo)
        resumen(nombre, codigo, tipo, descripcion, prioridad)
        cantidad <- cantidad + 1
		
        Escribir ""
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
    Definir c, caracter Como Cadena
    Definir i Como Entero
    Definir valido Como Logico
	
    Repetir
        Escribir "Ingresa tu código (Ej: N00444505):"
        Leer c
        valido <- Verdadero
        Si Longitud(c) <> 9 Entonces
            valido <- Falso
        SiNo
            Si Mayusculas(SubCadena(c, 1, 1)) <> "N" Entonces
                valido <- Falso
            SiNo
                Para i <- 2 Hasta 9 Hacer
                    caracter <- SubCadena(c, i, i)
                    Si caracter <> "0" Y caracter <> "1" Y caracter <> "2" Y caracter <> "3" Y caracter <> "4" Y caracter <> "5" Y caracter <> "6" Y caracter <> "7" Y caracter <> "8" Y caracter <> "9" Entonces
                        valido <- Falso
                    FinSi
                FinPara
            FinSi
        FinSi
        Si valido = Falso Entonces
            Escribir "Código no válido. Revisa e intenta nuevamente"
        FinSi
    Hasta Que valido = Verdadero
	
FinFuncion
Funcion t <- validarTexto(mensaje, minimo)
    Definir t, c Como Cadena
    Definir i, palabras Como Entero
    Definir esValido Como Logico
	
    Repetir
        Escribir mensaje
        Leer t
        esValido <- Verdadero
        palabras <- 1
        Si Longitud(t) = 0 Entonces
            esValido <- Falso
        SiNo
            Para i <- 1 Hasta Longitud(t) Hacer
                c <- Mayusculas(SubCadena(t, i, i))
                Si c = " " Entonces
                    palabras <- palabras + 1
                SiNo
                    Si (c < "A" O c > "Z") Y c <> "Á" Y c <> "É" Y c <> "Í" Y c <> "Ó" Y c <> "Ú" Y c <> "Ñ" Entonces
                        esValido <- Falso
                    FinSi
                FinSi
            FinPara
        FinSi
		
        Si palabras < minimo Entonces
            esValido <- Falso
        FinSi
        Si esValido = Falso Entonces
            Si minimo = 2 Entonces
                Escribir "Nombre no válido. Usa tu nombre y apellido."
            SiNo
                Escribir "Descripción no válida. Escribe al menos 5 palabras."
            FinSi
        FinSi
    Hasta Que esValido = Verdadero
	
FinFuncion

Funcion p <- priorizar(tipo)
	
    Definir p Como Cadena
    Segun tipo Hacer
        "Matrícula": p <- "ALTA"
        "Pagos": p <- "ALTA"
        "Constancia": p <- "BAJA"
        "Problemas de plataforma": p <- "ALTA"
        De Otro Modo: p <- "BAJA"
    FinSegun
	
FinFuncion

SubProceso resumen(nombre, codigo, tipo, descripcion, prioridad)
	
    Escribir ""
    Escribir "____________________________________"
    Escribir "       RESUMEN DE LA CONSULTA"
    Escribir "------------------------------------"
    Escribir "Nombre: ", nombre
    Escribir "Código: ", codigo
    Escribir "Tipo: ", tipo
    Escribir "Prioridad: ", prioridad
    Escribir "Descripción: ", descripcion
    Escribir "Estado: SOLICITUD REGISTRADA"
    Escribir "____________________________________"
	
FinSubProceso

SubProceso calificarExperiencia
	
    Definir resp, comentario Como Cadena
    Definir nota Como Entero
    Escribir ""
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
        Escribir "Ingresa un comentario (opcional):"
        Leer comentario
        Escribir ""
        Escribir "============================================="
        Escribir "    TUS CONSULTAS SERÁN ATENDIDAS PRONTO"
        Escribir " ¡Gracias por tu calificación y comentarios!"
        Escribir "============================================="
    SiNo
        Escribir ""
        Escribir "=========================================="
        Escribir "   TUS CONSULTAS SERÁN ATENDIDAS PRONTO"
        Escribir " No dudes en volver para nuevas consultas."
        Escribir " ¡Hasta pronto!"
        Escribir "=========================================="
    FinSi

FinSubProceso