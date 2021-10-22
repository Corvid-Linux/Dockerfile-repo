RUN apt update && apt install sudo wget curl neofetch htop screenfetch python git gnupg esptool zsh tar locate -y
RUN git clone https://github.com/Z4nzu/hackingtool 
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall 
RUN chmod 755 msfinstall 
RUN apt-get clean
