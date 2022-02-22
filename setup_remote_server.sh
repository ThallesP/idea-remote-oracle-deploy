#!/bin/sh

IDEA_VERSION="2021.3.2"

# If you're using another version of IDEA, you'll have to change this to the correspond version
# More info: https://github.com/JetBrains/JetBrainsRuntime#releases
# Make sure you're installing for the aarch64.
JBR_AARCH64_URL="https://cache-redirector.jetbrains.com/intellij-jbr/jbr-11_0_14_1-linux-aarch64-b1751.46.tar.gz"

mkdir -p ~/.cache/JetBrains/RemoteDev/dist

echo "Downloading IntelliJ IDEA $IDEA_VERSION"
curl -fSsL --output ~/.cache/JetBrains/RemoteDev/dist/ideaIU-$IDEA_VERSION.tar.gz https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz

echo "Extracting IntelliJ IDEA $IDEA_VERSION"
mkdir -p ~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION && tar --strip-components=1 -xvf ~/.cache/JetBrains/RemoteDev/dist/ideaIU-$IDEA_VERSION.tar.gz -C ~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION

rm -r ~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION/jbr
rm -r ~/.cache/JetBrains/RemoteDev/dist/ideaIU-$IDEA_VERSION.tar.gz

sed -i 's/lib64\/ld-linux-x86-64.so.2/lib\/ld-linux-aarch64.so.1/g' ~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION/plugins/remote-dev-server/bin/launcher.sh

echo "Downloading JBR aarch64 11_0_14_1"
curl -fSsl -L --output ~/.cache/JetBrains/RemoteDev/dist/jbr.tar.gz $JBR_AARCH64_URL
tar -xvf ~/.cache/JetBrains/RemoteDev/dist/jbr.tar.gz -C ~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION
rm -r ~/.cache/JetBrains/RemoteDev/dist/jbr.tar.gz

echo "Installing OpenJDK 11"
sudo apt-get update -y
sudo apt-get install openjdk-11-jdk -y

echo "Success! Now, you can launch the remote server by executing \"~/.cache/JetBrains/RemoteDev/dist/idea-$IDEA_VERSION/bin/remote-dev-server.sh run <your project's dir>\""
echo "Also, if you want to leave it running, take a look at systemd."
