#!/bin/bash

echo "Обновление списка пакетов..."
sudo apt update

echo "Установка минимального LaTeX и необходимых дополнений..."
sudo apt install -y \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-lang-cyrillic \
    texlive-bibtex-extra \
    biber \
    latexmk \
    make

echo "Готово! Попробуй собрать документ командой:"
echo "  make"
