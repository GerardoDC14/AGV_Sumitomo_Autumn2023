#!/bin/bash

# Define el número de pin GPIO en la Raspberry Pi
PIN=26  # Equivalente a GPIO 388 en Jetson

# Exporta y configura el GPIO como entrada
if [ ! -e /sys/class/gpio/gpio$PIN ]; then
    echo $PIN > /sys/class/gpio/export
    echo "GPIO $PIN exportado"
fi
echo in > /sys/class/gpio/gpio$PIN/direction
echo "GPIO $PIN configurado como entrada"

# Bucle para verificar el estado del GPIO
while true
do
  file="/sys/class/gpio/gpio$PIN/value"
  STATUS=$(cat "$file")
  echo "Estado actual de GPIO $PIN: $STATUS"

  if [ "$STATUS" -eq 1 ]
  then
    echo "Detectado 1 lógico en GPIO $PIN. Deteniendo ROS y apagando..."
    # Aquí reemplaza por tu comando/script para detener ROS si es necesario
    # ros-net-init-stop

    # Espera un poco antes de apagar
    sleep 5

    # Apaga la Raspberry Pi
    sudo shutdown now
  fi

  # Espera un poco antes de la siguiente verificación
  sleep 0.2
done
