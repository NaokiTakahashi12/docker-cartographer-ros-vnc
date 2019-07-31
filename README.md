# docker-cartographer-ros-vnc 🗺🐋
VNC container for ROS(kinetic/melodic).

cartographer_ws is setuped in /.


This container image based on [dorowu/ubuntu-desktop-lxde-vnc](https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc).

## How to build
```
make
```

## Usage
```
docker run -p 6080:80 naokitakahashi12/cartographer-ros-vnc:melodic
```
Access to [localhost:6080](http://localhost:6080).
