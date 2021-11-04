def loop():
  choice = input("Please choose your desktop mode(undercover or normal)")
  if choice == "undercover":
    os.system("docker build -t corvid -f Dockerfile-undercover .")
    os.system("docker run -it -d corvid /bin/bash")
    os.system("docker exec -it corvid bash")
  elif choice == "normal":
    os.system("docker build -t corvid .")
    os.system("docker run -it -d corvid /bin/bash")
    os.system("docker exec -it corvid bash")
  else:
    print("Wrong input")
    loop()
loop()
