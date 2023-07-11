FROM tiryoh/ros-desktop-vnc:melodic

RUN sudo apt-get update && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y ros-melodic-grid-map && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ARG WS=/home/catkin_ws
RUN mkdir -p $WS/src && \
    cd $WS/src && \
    git clone https://github.com/hccz95/ErgodicHumanSwarmCollab.git && \
    chmod -R 777 $WS
RUN echo "source $WS/devel/setup.bash" >> ~/.bashrc
