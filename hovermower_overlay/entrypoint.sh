#!/bin/bash
 
# Source ROS and Catkin workspaces
source /opt/ros/noetic/setup.bash
if [ -f /catkin_ws/devel/setup.bash ]
then
  source /catkin_ws/devel/setup.bash
fi
if [ -f /overlay_ws/devel/setup.bash ]
then
  source /overlay_ws/devel/setup.bash
fi
echo "Sourced Catkin workspace!"
 
# Set environment variables

# Execute the command passed into this entrypoint
exec "$@"