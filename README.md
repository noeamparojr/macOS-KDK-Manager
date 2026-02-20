![macOS KDK Manager Banner](banner.png)

# macOS Kernel Development Kit (KDK) Manager

Este é um utilitário avançado em ZSH projetado para desenvolvedores macOS e entusiastas de Hackintosh que precisam gerenciar múltiplos **Kernel Development Kits (KDKs)**. O script automatiza o ciclo de vida completo do KDK, facilitando a depuração do kernel e a análise de símbolos.

## 🛠 Início Rápido (Quick Start)

Para baixar, configurar e executar o script automaticamente no seu Mac, copie e cole o comando abaixo no Terminal:

```bash
curl -O [https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh](https://raw.githubusercontent.com/noeamparojr/macOS-KDK-Manager/main/kdk_manager.sh) && chmod +x kdk_manager.sh && ./kdk_manager.sh

```

---

## 🚀 Funcionalidades

* **Identificação Automática:** Lista todos os KDKs instalados e destaca aquele que corresponde à sua **Build atual do macOS**.
* **Backup com Progresso:** Realiza cópias de segurança para `~/Downloads/KDK_Backups` exibindo a porcentagem de conclusão em tempo real.
* **Restauração Simples:** Permite reinstalar versões de KDK salvas no backup diretamente para a pasta de sistema.
* **Desinstalação Segura:** Remove KDKs do sistema com feedback visual do número de arquivos processados.
* **Link de Download Integrado:** Exibe o link oficial da Apple para novas versões diretamente na interface.
* **Fechamento Automático:** Opção de encerrar o script e fechar a janela do Terminal automaticamente ao sair.

---

## 📂 Caminhos Utilizados

* **Sistema:** `/Library/Developer/KDKs/`
* **Backup:** `~/Downloads/KDK_Backups/`

## 🔗 Downloads Oficiais

Como a Apple exige autenticação, você pode encontrar as últimas builds aqui:
[Apple Developer Downloads](https://developer.apple.com/download/all/?q=Kernel%20Development%20Kit)

---

# macOS Kernel Development Kit (KDK) Manager (English)

An advanced ZSH utility for macOS developers and Hackintosh enthusiasts to manage multiple **Kernel Development Kits (KDKs)**. This script automates the full KDK lifecycle, making kernel debugging and symbol analysis much easier.

## 🚀 Features

* **Auto-Detection:** Lists installed KDKs and highlights the one matching your current **macOS Build Version**.
* **Backup with Progress:** Copies KDKs to `~/Downloads/KDK_Backups` with a real-time progress bar.
* **Easy Restore:** Reinstalls backed-up KDKs back to the system directory.
* **Safe Cleanup:** Uninstalls KDKs with visual feedback of processed files.
* **Auto-Close:** Automatically closes the Terminal window upon exit.

---

*Nota: Este script requer privilégios de administrador (`sudo`) para operações em pastas do sistema.*

```

---
