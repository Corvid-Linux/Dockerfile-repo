FROM debian
RUN apt update && apt install sudo wget curl neofetch htop screenfetch python git gnupg zsh tar locate firefox-esr unzip make gcc g++ terminator tty-clock nano vim gedit -y
RUN git clone https://github.com/Z4nzu/hackingtool
RUN git clone https://github.com/Ashraf-wan/Corvid
WORKDIR "/Corvid"
RUN rm ~/.bashrc
RUN mv .bashrc ~
RUN mv logo /etc
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 755 msfinstall
RUN apt-get clean
