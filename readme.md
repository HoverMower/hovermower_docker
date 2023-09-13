# Docker container architecture
In total, three container are used.
1. ros:noetic_desktop contains ROS noetic itself as well as other required tools. This container isn't specific to hovermower
2. ros:hovermoser_base contains general packages used by hovermower like gps, lidar, move_base_flex etc.
3. ros:hovermower_overlay contains all packages specially used for hovermower

# How to build

To build ROS Noetic desktop base image, use this command
``` docker build -f ros_noetic_desktop/dockerfile_ros_noetic_desktop  -t ros:noetic_desktop .```

To build Hovermower base container, use this command.The base container contains common packages like ublox gps package, LD06 lidar, move_base_flex etc.

``` docker build -f hovermower/dockerfile_hovermower  -t ros:hovermower_base .```

To build Hovermower overlay container, use this command
``` docker build -f hovermower_overlay/dockerfile_hovermower_overlay -t ros:hovermower_overlay . ```

# Prepare overlay container
Overlay container is used as your active development source. First, create a folder in your host system. I named mine ```hovermower_overlay_ws```. Next, start ```bringup_ros.sh``` script on your host system. This will start your ROS container (the overlay container) and mount the volume to the container. By this, all changes made to this volume (folder overlay_ws) are shared between host and container.

Now copy file hovermower_overlay/init_hovermower_overlay.sh into this folder, change permission to allow run as program and start the script from inside your container.
The script will now init the catkin workspace, load additional necessary packages from github and does catkin_make to compile

# Run the container
By using ```bringup_ros.sh```, you can start the container with GUI support. 
Also use this command to get new terminal windows related to ROS. 

It will use the network of your host machine. Also it runs with high privileges to access GPIO and other resources without any hassle. But be warned that this can be a security issue.