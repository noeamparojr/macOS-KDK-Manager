#!/bin/zsh

# Cores para facilitar a leitura
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Diretório padrão onde o macOS instala os KDKs
KDK_DIR="/Library/Developer/KDKs"

clear
echo -e "${BLUE}===================================================${NC}"
echo -e "${BLUE}       GERENCIADOR DE KERNEL DEVELOPMENT KITS      ${NC}"
echo -e "${BLUE}===================================================${NC}\n"

# Exibir Build atual do sistema para referência
CURRENT_BUILD=$(sw_vers -buildVersion)
echo -e "Sua Build atual do macOS: ${YELLOW}$CURRENT_BUILD${NC}\n"

# 1. Listar KDKs Instalados
echo -e "${CYAN}>> KDKs instalados em $KDK_DIR:${NC}"

if [ -d "$KDK_DIR" ]; then
    # Cria um array com as pastas dentro do diretório de KDKs
    kdks=($(ls "$KDK_DIR" 2>/dev/null))
    
    if [ ${#kdks[@]} -eq 0 ]; then
        echo -e "${RED}Nenhum KDK encontrado no sistema.${NC}"
    else
        for i in {1..${#kdks[@]}}; do
            # Destaca se o KDK instalado coincide com a Build atual
            if [[ "${kdks[$i]}" == *"$CURRENT_BUILD"* ]]; then
                echo -e "$i) ${kdks[$i]} ${GREEN}(Build Atual)${NC}"
            else
                echo -e "$i) ${kdks[$i]}"
            fi
        done
    fi
else
    echo -e "${RED}Diretório $KDK_DIR não existe.${NC}"
    kdks=()
fi

echo -e "\n${BLUE}===================================================${NC}"
echo -e "${CYAN}LINK PARA DOWNLOAD (Copie e cole no navegador):${NC}"
echo -e "${YELLOW}https://developer.apple.com/download/all/?q=Kernel%20Development%20Kit${NC}"
echo -e "${BLUE}===================================================${NC}\n"

# Menu de Opções
echo -e "1) Desinstalar um KDK (Requer senha de admin)"
echo -e "2) Sair"
read "opt?Escolha uma opção: "

case $opt in
    1)
        if [ ${#kdks[@]} -eq 0 ]; then 
            echo -e "${RED}Erro: Não há KDKs para remover.${NC}"
            exit 1
        fi
        
        read "num?Digite o número do KDK que deseja apagar: "
        
        # Validação simples do índice
        target=${kdks[$num]}
        if [ -n "$target" ]; then
            echo -e "\n${RED}Atenção: Você está prestes a remover permanentemente:${NC}"
            echo -e "$target"
            read "confirm?Tem certeza? (s/n): "
            
            if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
                echo -e "${RED}Removendo... Aguarde a autenticação.${NC}"
                sudo rm -rf "$KDK_DIR/$target"
                echo -e "${GREEN}KDK removido com sucesso!${NC}"
            else
                echo "Operação cancelada."
            fi
        else
            echo -e "${RED}Opção inválida.${NC}"
        fi
        ;;
    *)
        echo "Saindo..."
        exit 0
        ;;
esac
