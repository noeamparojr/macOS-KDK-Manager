# macOS Kernel Development Kit (KDK) Manager

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
