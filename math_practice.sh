#!/bin/bash

# Función para generar un número aleatorio entre min y max
random_number() {
    echo $(( RANDOM % ($2 - $1 + 1) + $1 ))
}

# Función para manejar los intentos del usuario
handle_attempts() {
    local correct_answer=$1
    local operation=$2
    local attempts=3

    while [ $attempts -gt 0 ]; do
        read -p "Tu respuesta: " user_answer
        if [ "$user_answer" -eq "$correct_answer" ]; then
            echo "¡Felicidades! Tu respuesta es correcta."
            return 0
        else
            attempts=$((attempts - 1))
            if [ $attempts -eq 0 ]; then
                echo "Lo siento, has agotado tus intentos. La respuesta correcta es $correct_answer."
            else
                echo "Respuesta incorrecta. Te quedan $attempts intentos."
            fi
        fi
    done
}

# Función para problemas de suma
suma_problem() {
    local num1=$(random_number 1 100)
    local num2=$(random_number 1 100)
    local result=$((num1 + num2))
    echo "¿Cuánto es $num1 + $num2?"
    handle_attempts $result "suma"
}

# Función para problemas de resta
resta_problem() {
    local num1=$(random_number 1 100)
    local num2=$(random_number 1 $num1)
    local result=$((num1 - num2))
    echo "¿Cuánto es $num1 - $num2?"
    handle_attempts $result "resta"
}

# Función para problemas de multiplicación
multiplicacion_problem() {
    local num1=$(random_number 1 100)
    local num2=$(random_number 1 20)
    local result=$((num1 * num2))
    echo "¿Cuánto es $num1 x $num2?"
    handle_attempts $result "multiplicación"
}

# Función para problemas de división
division_problem() {
    local divisor=$(random_number 1 10)
    local dividend=$(($(random_number 1 100) * divisor))
    local result=$((dividend / divisor))
    echo "¿Cuánto es $dividend ÷ $divisor?"
    handle_attempts $result "división"
}

# Menú principal
while true; do
    echo "
1. Problemas de suma
2. Problemas de resta
3. Problemas de multiplicación
4. Problemas de división
5. Salir
"
    read -p "Elige una opción (1-5): " option

    case $option in
        1) suma_problem ;;
        2) resta_problem ;;
        3) multiplicacion_problem ;;
        4) division_problem ;;
        5) echo "Gracias por practicar. ¡Hasta luego!"; exit 0 ;;
        *) echo "Opción inválida. Por favor, elige un número del 1 al 5." ;;
    esac

    echo "Presiona Enter para continuar..."
    read
done