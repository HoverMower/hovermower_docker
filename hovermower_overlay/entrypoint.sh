#!/bin/bash
 
# Source ROS and Catkin workspaces
source /opt/ros/noetic/setup.bash
source /catkin_ws/devel/setup.bash
source /overlay_ws/devel/setup.bash
echo "Sourced Catkin workspace!"
 
# Set environment variables
export ROSMower_USB="/dev/ttyUSB0"
export HoverBoard_UART="/dev/ttyAMA1"

# Source open_mower config
source /overlay_ws/src/open_mower_ros/src/open_mower/config/mower_config.sh
# Execute the command passed into this entrypoint
exec "$@"