def loop():
  choice = input("Please choose your desktop environment.(lxde, lxqt, none, xfce, kde)")

  if choice == "lxde":
    os.system("docker run -it parrotsecurity/corvid:lxde-0.5")
  elif choice == "lxqt":
    os.system("docker run -it parrotsecurity/corvid:lxqt-0.5")
  elif choice == "none":
    os.system("docker run -it parrotsecurity/corvid:slim-0.5")
  elif choice == "xfce":
    os.system("docker run -it parrotsecurity/corvid")
  elif choice == "kde":
    os.system("docker run -it parrotsecurity/corvid:kde-0.5")
  else:
    print("Wrong input")
    loop()
loop()
