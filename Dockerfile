RUN apt update && apt install sudo wget curl neofetch htop screenfetch python git gnupg zsh tar locate firefox-esr unzip gunzip make gcc g++ terminator tty-clock nano vim vi gedit -y
RUN git clone https://github.com/Z4nzu/hackingtool 
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall 
RUN chmod 755 msfinstall 
RUN apt-get clean
