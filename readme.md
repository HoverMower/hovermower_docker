# Docker container architecture
In total, three container are used.
1. ros:noetic_desktop contains ROS noetic itself as well as other required tools. This container isn't specific to hovermower
2. ros:hovermoser_base contains general packages used by hovermower like gps, lidar, move_base_flex etc.
3. ros:hovermower_overlay contains all packages specially used for hovermower

# How to build

To build ROS Noetic desktop base image, use this command
''' docker build -f ros_noetic_desktop/dockerfile_ros_noetic_desktop  -t paddycube/ros:noetic_desktop .'''

To build Hovermower base container, use this command.The base container contains common packages like ublox gps package, LD06 lidar, move_base_flex etc.

''' docker build -f hovermower/dockerfile_hovermower  -t paddycube/ros:hovermower_base .'''