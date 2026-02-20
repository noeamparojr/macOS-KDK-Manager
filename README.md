# macOS Kernel Development Kit (KDK) Manager

This is a simple ZSH utility designed for macOS developers and Hackintosh enthusiasts who need to manage multiple **Kernel Development Kits (KDKs)**. It helps you identify which versions are taking up space and ensures you are using the correct build for your current system.

## 🚀 Features

- **Auto-Detection:** Lists all installed KDKs in `/Library/Developer/KDKs/`.
- **Build Matching:** Automatically identifies and highlights if an installed KDK matches your current macOS Build Version.
- **Easy Cleanup:** Provides a safe way to uninstall specific KDKs using `sudo`.
- **Direct Access:** Quick link to the official Apple Developer download portal.

## 🛠 How to Use

1. **Clone the repository or download the script:**
   ```bash
   curl -O [https://raw.githubusercontent.com/YOUR_USERNAME/macOS-KDK-Manager/main/kdk_manager.sh](https://raw.githubusercontent.com/YOUR_USERNAME/macOS-KDK-Manager/main/kdk_manager.sh)
