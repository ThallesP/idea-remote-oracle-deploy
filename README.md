<h1 align="center">Idea Remote Oracle Deploy</h1>

You want to use Oracle's free tier to launch a remote development server of IntelliJ IDEA but noticed that Jetbrains still doesn't support ARM? This is the script for you!

## ⚙️ Setup

```bash
# You should run this on the server and not on your machine
sudo apt-get install ansible # You'll need Ansible
git clone https://github.com/ThallesP/idea-remote-oracle-deploy
cd idea-remote-oracle-deploy
```

## 🚀 How to run the script

```bash
# You should run this on the server and not on your machine
ansible-playbook install-remote-dev.yaml
```

## ✨ How do I connect?
Open your favorite IDE, go to the remote development tab (normally is in the select project screen), create a new ssh connection, put your ssh credentials and hit login, then you can select your favorite IDE from the dropdown. 


# ⚙️ Configuration

You'll be asked for the IDE download link, copy your ide link below.

| IDE               | Link                                                                 |
| ----------------- | -------------------------------------------------------------------- |
| **Web Storm**     | https://download-cdn.jetbrains.com/webstorm/WebStorm-2022.2.3.tar.gz |
| **IntelliJ Idea** | https://download-cdn.jetbrains.com/idea/ideaIU-2022.2.3.tar.gz       |

## 🤔 Questions

### Can this script run on non-oracle machines?

It probably can, but I haven't tested it yet, you can give it a try and show us the results by opening an issue!
