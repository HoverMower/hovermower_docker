#!/bin/bash

# clone all needed repos into overlay_ws
cd /overlay_ws/src

git clone -b breadcrump_navigation https://github.com/HoverMower/open_mower_ros
git clone https://github.com/HoverMower/slic3r_coverage_planner
git clone https://github.com/HoverMower/ftc_local_planner
git clone https://github.com/HoverMower/Slic3r

source /opt/ros/noetic/setup.bash
source /catkin_ws/devel/setup.bash

cd /overlay_ws
catkin_make -DCATKIN_WHITELIST_PACKAGES="mower_msgs"
catkin_make -DCATKIN_WHITELIST_PACKAGES=""

echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "source /overlay_ws/devel/setup.bash" >> ~/.bashrc