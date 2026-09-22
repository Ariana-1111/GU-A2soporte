// FUNCIÓN 1: Sin retorno para mostrar el menú principal
SubProceso MostrarMenuPrincipal()
	Escribir "=== MÓDULO DE SOPORTE ACADÉMICO ==="
	Escribir "Seleccione el tipo de consulta:"
	Escribir "1. Matrícula"
	Escribir "2. Pagos"
	Escribir "3. Constancia"
	Escribir "4. Plataforma"
	Escribir "5. Otro"
FinSubProceso

// FUNCIÓN 2: Con retorno para validar texto obligatorio (Código de estudiante)
SubProceso esValido <- ValidarCodigoEstudiante(codigo)
	Definir esValido Como Logico
	// Valida que tenga exactamente 9 caracteres y esté en mayúsculas
	Si Longitud(codigo) = 9 Y codigo = Mayusculas(codigo) Entonces
		esValido <- Verdadero
	Sino
		esValido <- Falso
	FinSi
FinSubProceso

// FUNCIÓN 3: Con retorno para calcular o asignar prioridad según el tipo
SubProceso prioridad <- CalcularPrioridadAtencion(tipoConsulta)
	Definir prioridad Como Cadena
	Si tipoConsulta = "Pagos" O tipoConsulta = "Plataforma" Entonces
		prioridad <- "ALTA"
	Sino
		prioridad <- "BAJA"
	FinSi
FinSubProceso

// FUNCIÓN 4: Sin retorno (o procedimiento) para mostrar el resumen de la solicitud
SubProceso MostrarResumenSolicitud(codigo, nombre, tipo, descripcion, prioridad)
	Escribir "----------------------------------------"
	Escribir "--- RESUMEN DE LA SOLICITUD REGISTRADA ---"
	Escribir "Estudiante: ", nombre
	Escribir "Código:     ", codigo
	Escribir "Tipo:       ", tipo
	Escribir "Detalle:    ", descripcion
	Escribir "Prioridad:  ", prioridad
	Escribir "----------------------------------------"
	Escribir ""
FinSubProceso

// PROGRAMA PRINCIPAL
Algoritmo orientacion_registro_y_atencion
	Definir i, opcion_tipo, experiencia Como Entero
	Definir nombre, codigo, tipo, descripcion, prioridad, calificar Como Cadena
	
	Escribir "BIENVENIDO AL SISTEMA DE SOPORTE ACADÉMICO"
	Escribir "Se registrarán al menos tres solicitudes por sesión."
	Escribir ""
	
	// Bucle para permitir registrar al menos tres solicitudes
	Para i <- 1 Hasta 3 Con Paso 1 Hacer
		Escribir "----------------------------------------"
		Escribir ">>> REGISTRO DE SOLICITUD N° ", i, " de 3"
		Escribir "----------------------------------------"
		
		Escribir "Ingrese nombre del estudiante:"
		Leer nombre
		
		// Validación de código de estudiante (Obligatorio 9 caracteres y Mayúsculas)
		Repetir
			Escribir "Ingrese código de estudiante (Ej: N00466878):"
			Leer codigo
			Si NO ValidarCodigoEstudiante(codigo) Entonces
				Escribir "[ERROR]: El código debe tener 9 caracteres y estar en MAYÚSCULAS. Intente de nuevo."
			FinSi
		Hasta Que ValidarCodigoEstudiante(codigo) = Verdadero
		
		// Selección del tipo de consulta mediante menú modular
		Repetir
			MostrarMenuPrincipal()
			Leer opcion_tipo
			Si opcion_tipo < 1 O opcion_tipo > 5 Entonces
				Escribir "[ERROR]: Opción no válida. Elija un número del 1 al 5."
			FinSi
		Hasta Que opcion_tipo >= 1 Y opcion_tipo <= 5
		
		// Asignación de texto según la opción numérica
		Segun opcion_tipo Hacer
			1: tipo <- "Matrícula"
			2: tipo <- "Pagos"
			3: tipo <- "Constancia"
			4: tipo <- "Plataforma"
			5: tipo <- "Otro"
		FinSegun
		
		Escribir "Ingrese una descripción breve de su consulta:"
		Leer descripcion
		
		// Llamada a la función con retorno para la prioridad
		prioridad <- CalcularPrioridadAtencion(tipo)
		
		// Llamada a la función para mostrar el resumen
		MostrarResumenSolicitud(codigo, nombre, tipo, descripcion, prioridad)
	FinPara
	
	Escribir "¡Se han completado los registros requeridos!"
	Escribir "¿Desea responder una calificación de su experiencia? (si/no)"
	Leer calificar
	
	Si Minusculas(calificar) = "si" Entonces
		Escribir "Califique su experiencia:"
		Escribir "1. Bueno :)"
		Escribir "2. Neutro :|"
		Escribir "3. Malo :("
		Leer experiencia
		Escribir "¡Gracias por su calificación! Hasta luego."
	Sino
		Escribir "Gracias por usar el sistema. ¡Hasta luego!"
	FinSi
	
FinAlgoritmo