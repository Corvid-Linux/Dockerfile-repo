def loop():
  choice = input("Please choose your desktop environment.(lxde, lxqt, none, xfce, kde)")

  if choice == "lxde":
    os.system("docker run -h corvid -it parrotsecurity/corvid:lxde-1")
  elif choice == "lxqt":
    os.system("docker run -h corvid -it parrotsecurity/corvid:lxqt-1")
  elif choice == "none":
    os.system("docker run -h corvid -it parrotsecurity/corvid:slim-1")
  elif choice == "xfce":
    os.system("docker run -h corvid -it parrotsecurity/corvid")
  elif choice == "kde":
    os.system("docker run -h corvid -it parrotsecurity/corvid:kde-1")
  else:
    print("Wrong input")
    loop()
loop()
