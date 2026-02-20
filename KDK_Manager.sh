#!/bin/zsh

# Cores
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# Configurações
KDK_DIR="/Library/Developer/KDKs"
BACKUP_DEST="$HOME/Downloads/KDK_Backups"

while true; do
    clear
    echo -e "${BLUE}===================================================${NC}"
    echo -e "${BLUE}       GERENCIADOR DE KDK - MAC OS                 ${NC}"
    echo -e "${BLUE}===================================================${NC}"
    
    CURRENT_BUILD=$(sw_vers -buildVersion)
    echo -e "Sua Build atual: ${YELLOW}$CURRENT_BUILD${NC}\n"

    # Listar KDKs Instalados
    echo -e "${CYAN}>> KDKs instalados no sistema:${NC}"
    if [ -d "$KDK_DIR" ]; then
        kdks=($(ls "$KDK_DIR" 2>/dev/null))
        if [ ${#kdks[@]} -eq 0 ]; then
            echo -e "${RED}Nenhum KDK instalado.${NC}"
        else
            for i in {1..${#kdks[@]}}; do
                if [[ "${kdks[$i]}" == *"$CURRENT_BUILD"* ]]; then
                    echo -e "$i) ${kdks[$i]} ${GREEN}(Build Atual)${NC}"
                else
                    echo -e "$i) ${kdks[$i]}"
                fi
            done
        fi
    else
        echo -e "${RED}Erro: Pasta do sistema não encontrada.${NC}"
        kdks=()
    fi

    echo -e "\n${BLUE}===================================================${NC}"
    echo -e "${CYAN}DOWNLOAD:${NC} ${YELLOW}https://developer.apple.com/download/all/?q=KDK${NC}"
    echo -e "${BLUE}===================================================${NC}\n"

    echo "1) Fazer Backup para Downloads"
    echo "2) Restaurar um KDK do Backup"
    echo "3) Desinstalar um KDK do Sistema"
    echo "4) Sair e Fechar Terminal"
    echo -n "Escolha uma opção: "
    read opt

    case $opt in
        1)
            echo -n "Digite o número do KDK para Backup: "
            read num
            target=${kdks[$num]}
            if [ -n "$target" ]; then
                mkdir -p "$BACKUP_DEST"
                echo -e "\n${CYAN}Iniciando backup...${NC}"
                sudo rsync -ah --progress "$KDK_DIR/$target" "$BACKUP_DEST/"
                echo -e "\n${GREEN}✔ Backup finalizado em Downloads/KDK_Backups${NC}"
            else
                echo -e "${RED}Opção inválida.${NC}"
            fi
            echo -e "\nPressione Enter para voltar..."
            read
            ;;
        2)
            echo -e "${CYAN}>> KDKs disponíveis no Backup:${NC}"
            if [ -d "$BACKUP_DEST" ]; then
                bkp_list=($(ls "$BACKUP_DEST" 2>/dev/null))
                if [ ${#bkp_list[@]} -eq 0 ]; then
                    echo -e "${RED}Nenhum backup encontrado.${NC}"
                else
                    for i in {1..${#bkp_list[@]}}; do
                        echo -e "$i) ${bkp_list[$i]}"
                    done
                    echo -n "Digite o número do KDK para restaurar: "
                    read bkp_num
                    bkp_target=${bkp_list[$bkp_num]}
                    if [ -n "$bkp_target" ]; then
                        echo -e "\n${YELLOW}Restaurando para o sistema...${NC}"
                        sudo rsync -ah --progress "$BACKUP_DEST/$bkp_target" "$KDK_DIR/"
                        echo -e "\n${GREEN}✔ KDK restaurado com sucesso!${NC}"
                    else
                        echo -e "${RED}Opção inválida.${NC}"
                    fi
                fi
            else
                echo -e "${RED}Pasta de backup não existe.${NC}"
            fi
            echo -e "\nPressione Enter para voltar..."
            read
            ;;
        3)
            echo -n "Digite o número do KDK para remover: "
            read num
            target=${kdks[$num]}
            if [ -n "$target" ]; then
                echo -n "Confirmar remoção de $target? (s/n): "
                read confirm
                if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
                    echo -e "${YELLOW}Removendo...${NC}"
                    sudo rm -rfv "$KDK_DIR/$target" | awk '{if (NR%50==0) printf "\rArquivos processados: %d...", NR}'
                    echo -e "\n${GREEN}✔ KDK removido.${NC}"
                else
                    echo "Operação cancelada."
                fi
            else
                echo -e "${RED}Opção inválida.${NC}"
            fi
            echo -e "\nPressione Enter para voltar..."
            read
            ;;
        4)
            echo "Encerrando sessão..."
            # Comando para fechar a janela do Terminal no macOS
            osascript -e 'tell application "Terminal" to close first window' & exit
            break
            ;;
        *)
            echo -e "${RED}Opção inválida.${NC}"
            sleep 1
            ;;
    esac
done
