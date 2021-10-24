FROM debian
RUN apt update && apt install sudo wget curl neofetch htop screenfetch python git python3-pip gnupg zsh tar locate firefox-esr liblttng-ust0 unzip make gpg gcc g++ terminator gobuster tty-clock nano vim nmap lynis aircrack-ng apktool gedit -y
RUN git clone https://github.com/Ashraf-wan/Corvid
WORKDIR "/Corvid"
RUN rm ~/.bashrc
RUN mv .bashrc ~
RUN mv logo /etc
RUN rm /etc/os-release
RUN mv os-release /etc
WORKDIR "/"
RUN apt-get update && apt-mark hold iptables && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      dbus-x11 \
      psmisc \
      xdg-utils \
      x11-xserver-utils \
      x11-utils && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      xfce4 && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libgtk-3-bin \
      libpulse0 \
      mousepad \
      xfce4-notifyd \
      xfce4-taskmanager \
      xfce4-terminal && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      xfce4-battery-plugin \
      xfce4-clipman-plugin \
      xfce4-cpufreq-plugin \
      xfce4-cpugraph-plugin \
      xfce4-diskperf-plugin \
      xfce4-datetime-plugin \
      xfce4-fsguard-plugin \
      xfce4-genmon-plugin \
      xfce4-indicator-plugin \
      xfce4-netload-plugin \
      xfce4-places-plugin \
      xfce4-sensors-plugin \
      xfce4-smartbookmark-plugin \
      xfce4-systemload-plugin \
      xfce4-timer-plugin \
      xfce4-verve-plugin \
      xfce4-weather-plugin \
      xfce4-whiskermenu-plugin && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      libxv1 \
      mesa-utils \
      mesa-utils-extra && \
    sed -i 's%<property name="ThemeName" type="string" value="Xfce"/>%<property name="ThemeName" type="string" value="Raleigh"/>%' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

# disable xfwm4 compositing if X extension COMPOSITE is missing and no config file exists
RUN Configfile="~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml" && \
echo "#! /bin/bash\n\
xdpyinfo | grep -q -i COMPOSITE || {\n\
  echo 'x11docker/xfce: X extension COMPOSITE is missing.\n\
Window manager compositing will not work.\n\
If you run x11docker with option --nxagent,\n\
you might want to add option --composite.' >&2\n\
  [ -e $Configfile ] || {\n\
    mkdir -p $(dirname $Configfile)\n\
    echo '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
<channel name=\"xfwm4\" version=\"1.0\">\n\
\n\
  <property name=\"general\" type=\"empty\">\n\
    <property name=\"use_compositing\" type=\"bool\" value=\"false\"/>\n\
  </property>\n\
</channel>\n\
' > $Configfile\n\
  }\n\
}\n\
startxfce4\n\
" > /usr/local/bin/start && \
chmod +x /usr/local/bin/start
    
RUN env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      konsole \
      kwrite \
      libcups2 \
      libpulse0 \
      procps \
      psmisc \
      sudo \
      synaptic \
      systemsettings \
      zsh \
      yakuake \
      screen \
      pulseaudio \
      guake 
      
WORKDIR "/root"
RUN curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
RUN git clone https://github.com/FaarisAnsari/nord-dotfiles
RUN git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
RUN git clone https://github.com/Z4nzu/hackingtool
RUN git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/ && pip3 install -r setoolkit/requirements.txt && python3 setoolkit/setup.py
RUN git clone https://github.com/vanhauser-thc/thc-hydra
RUN git clone https://github.com/sullo/nikto
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.5/powershell_7.1.5-1.debian.10_amd64.deb
RUN dpkg -i powershell_7.1.5-1.debian.10_amd64.deb
RUN git clone https://github.com/EmpireProject/Empire
WORKDIR "/root/Empire"
RUN ./setup/install.sh
WORKDIR "/root"
RUN echo 'deb http://download.opensuse.org/repositories/home:/cabelo/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list
RUN curl -fsSL https://download.opensuse.org/repositories/home:cabelo/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null
RUN apt update
RUN apt install owasp-zap
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 755 msfinstall
WORKDIR "/root/thc-hydra"
RUN ./configure && make && make install
WORKDIR "/"
RUN apt-get clean
WORKDIR "/Corvid"
RUN rm -r /usr/share/backgrounds/xfce
RUN mkdir /usr/share/backgrounds/xfce
RUN mv corvidos.png /usr/share/backgrounds/xfce
CMD start
