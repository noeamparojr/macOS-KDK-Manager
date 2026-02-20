# macOS Kernel Development Kit (KDK) Manager

[English version below]

Este é um utilitário simples em ZSH projetado para desenvolvedores macOS e entusiastas de Hackintosh que precisam gerenciar múltiplos **Kernel Development Kits (KDKs)**. Ele ajuda a identificar quais versões estão ocupando espaço e garante que você esteja usando a build correta para o seu sistema atual.

## 🚀 Funcionalidades

- **Detecção Automática:** Lista todos os KDKs instalados em `/Library/Developer/KDKs/`.
- **Correspondência de Build:** Identifica e destaca automaticamente se um KDK instalado corresponde à versão de Build atual do seu macOS.
- **Limpeza Fácil:** Oferece uma maneira segura de desinstalar KDKs específicos usando `sudo`.
- **Acesso Direto:** Link rápido para o portal oficial de downloads da Apple Developer.

## 🛠 Instalação Rápida

Para baixar e configurar o script automaticamente, copie e cole o comando abaixo no Terminal:

```bash
curl -O [https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh](https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh) && chmod +x kdk_manager.sh

------------------------------------------------

# macOS Kernel Development Kit (KDK) Manager

This is a lightweight ZSH utility designed for macOS developers and Hackintosh enthusiasts who need to manage multiple **Kernel Development Kits (KDKs)**. It helps you identify which versions are installed, how much space they occupy, and ensures you are using the correct build for your current system.

## 🚀 Features

- **Auto-Detection:** Automatically lists all installed KDKs found in `/Library/Developer/KDKs/`.
- **Build Matching:** Detects your current macOS Build Version and highlights if an installed KDK matches it.
- **Safe Cleanup:** Provides a streamlined way to uninstall specific KDKs using `sudo`.
- **Direct Download Link:** Includes a direct reference to the Apple Developer download portal.

## 🛠 Quick Installation

To download and set up the script automatically, copy and paste the following command into your Terminal:

```bash
curl -O [https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh](https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh) && chmod +x kdk_manager.sh
