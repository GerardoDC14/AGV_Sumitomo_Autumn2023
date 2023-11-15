#!/bin/bash

# Ejecutar el script canSetUp.sh
echo "Inicializando configuración CAN..."
~/catkin_ws/AGV_Scripts/canSetUp.sh
echo "Configuración CAN completada."

# Esperar un momento para asegurarse de que canSetUp.sh ha terminado
sleep 2

# Ejecutar el archivo de lanzamiento de ROS
echo "Iniciando nodos de ROS..."
roslaunch my_launch_files my_nodes.launch
