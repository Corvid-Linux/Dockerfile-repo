FROM archlinux
RUN pacman -Syyu
RUN pacman -Sy git
RUN git clone https://github.com/Corvid-Linux/ArchTitus-docker
RUN cd ArchTitus
RUN ./archtitus.sh
