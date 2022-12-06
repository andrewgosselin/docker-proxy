#!/bin/bash
version=$(mkcert --version)
if [[ $version == *"not found"* ]]; then
  OS="`uname`"
  case $OS in
    'Linux') # Linux
      curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
      chmod +x mkcert-v*-linux-amd64
      sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert
      sudo rm -rf mkcert-v*-linux-amd64
      ;;
    'Darwin') # Mac
      brew install mkcert
      brew install nss # if you use Firefox
      ;;
    *) ;;
  esac
fi

cd certs && mkcert "$1"
