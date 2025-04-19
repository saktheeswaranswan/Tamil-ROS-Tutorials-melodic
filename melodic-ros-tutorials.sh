#!/bin/bash

# ROS Melodic Full Setup Script for Ubuntu 18.04

echo "🛠️ Installing ROS Melodic + Gazebo + RViz..."

# 1. Setup sources and keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt update
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# 2. Install ROS Melodic Desktop-Full (includes RViz, Gazebo 9, rqt, etc.)
sudo apt update
sudo apt install -y ros-melodic-desktop-full

# 3. Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# 4. rosdep (for managing dependencies)
sudo apt install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
rosdep update

# 5. Catkin Tools (optional but helpful)
sudo apt install -y python-catkin-tools

# 6. Extra tools: simulation, visualization, debugging
sudo apt install -y \
  ros-melodic-gazebo-ros-pkgs \
  ros-melodic-gazebo-ros-control \
  ros-melodic-rqt* \
  ros-melodic-rviz \
  ros-melodic-joint-state-publisher \
  ros-melodic-robot-state-publisher \
  ros-melodic-tf2-tools \
  ros-melodic-xacro \
  ros-melodic-navigation \
  ros-melodic-slam-gmapping

echo "✅ ROS Melodic + Gazebo + RViz installation complete!"
echo "💡 Open a new terminal or run: source ~/.bashrc"

