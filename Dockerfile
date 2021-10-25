FROM debian:bullseye
RUN apt update && apt-get install -y --no-install-recommends sudo wget curl python git python3-pip tightvncserver zsh locate firefox-esr net-tools liblttng-ust0 unzip make gpg gcc g++ terminator gobuster vim nmap lynis aircrack-ng apktool
RUN git clone https://github.com/Ashraf-wan/Corvid
RUN sudo apt install software-properties-common apt-transport-https curl -y
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN sudo apt update && sudo apt install code -y
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
      xfce4-notifyd &&
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
      kwrite \
      libcups2 \
      libpulse0 \
      procps \
      psmisc \
      synaptic \
      systemsettings
WORKDIR "/root"
RUN mkdir tools
WORKDIR "/root/tools"
RUN git clone https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
RUN git clone https://github.com/Z4nzu/hackingtool
RUN git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
RUN git clone https://github.com/vanhauser-thc/thc-hydra
RUN git clone https://github.com/sullo/nikto
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.5/powershell_7.1.5-1.debian.10_amd64.deb
RUN dpkg -i powershell_7.1.5-1.debian.10_amd64.deb
WORKDIR "/root/tools"
RUN echo 'deb http://download.opensuse.org/repositories/home:/cabelo/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list
RUN curl -fsSL https://download.opensuse.org/repositories/home:cabelo/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null
RUN apt update
RUN apt install owasp-zap
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 755 msfinstall
WORKDIR "/root/tools/thc-hydra"
RUN ./configure && make && make install
WORKDIR "/root/tools"
RUN GITLEAKS_VERSION=$(curl -s https://api.github.com/repos/zricethezav/gitleaks/releases/latest |  grep -oP '"tag_name": "\K(.*)(?=")') && wget https://github.com/zricethezav/gitleaks/releases/download/$GITLEAKS_VERSION/gitleaks-linux-amd64
RUN mv gitleaks-linux-amd64 gitleaks
RUN chmod +x gitleaks
RUN sudo mv gitleaks /usr/local/bin/
RUN git clone https://github.com/RhinoSecurityLabs/pacu
RUN git clone https://github.com/RhinoSecurityLabs/CVEs
RUN git clone https://github.com/RhinoSecurityLabs/CloudScraper
RUN git clone https://github.com/RhinoSecurityLabs/dsnap
RUN git clone https://github.com/RhinoSecurityLabs/GCP-IAM-Privilege-Escalation
RUN git clone https://github.com/RhinoSecurityLabs/external_c2_framework
RUN git clone https://github.com/RhinoSecurityLabs/GCPBucketBrute
RUN git clone https://github.com/RhinoSecurityLabs/ccat 
RUN git clone https://github.com/RhinoSecurityLabs/Swagger-EZ
RUN git clone https://github.com/RhinoSecurityLabs/SleuthQL
RUN wget https://download.documentfoundation.org/libreoffice/stable/7.2.2/deb/x86_64/LibreOffice_7.2.2_Linux_x86-64_deb.tar.gz
RUN tar -xf LibreOffice_7.2.2_Linux_x86-64_deb.tar.gz
WORKDIR "LibreOffice_7.2.2.2_Linux_x86-64_deb/DEBS"
RUN dpkg -i *.deb
WORKDIR "/root/tools"
RUN rm LibreOffice_7.2.2_Linux_x86-64_deb.tar.gz
CMD start
# cleanup & adding new user so vscode dont crash
RUN apt-get clean
WORKDIR "/root/tools"
RUN rm powershell_7.1.5-1.debian.10_amd64.deb
WORKDIR "/root"
RUN useradd -m -p pakXq6/z0Zcdk corvid
RUN du -h --max-depth=1
RUN rm -r /tools/LibreOffice_7.2.2.2_Linux_x86-64_deb
#change wallpaper and theme
#use the docker commit
