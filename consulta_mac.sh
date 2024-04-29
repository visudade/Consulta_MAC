#!/bin/bash

# Verifica se o arquivo de entrada foi fornecido como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 arquivo_de_entrada.txt"
    exit 1
fi

# Verifica se o arquivo de entrada existe
if [ ! -f "$1" ]; then
    echo "Arquivo $1 não encontrado."
    exit 1
fi

# Loop para ler cada linha do arquivo
while IFS= read -r linha || [ -n "$linha" ]; do
    # Remove espaços em branco extras
    linha=$(echo "$linha" | tr -d '[:space:]')
    
    # Monta a URL com o valor lido do arquivo
    url="https://api.macvendors.com/$linha"
    
    # Realiza a consulta e salva o resultado em uma variável
    resultado=$(curl -s "$url")
    
    # Loga o resultado da consulta
    echo "Resultado para $linha: $resultado"
done < "$1"
