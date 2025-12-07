#!/usr/bin/env bash

# Fontes: https://github.com/iuricode/padroes-de-commits
#       : https://github.com/fisicaUSC/revista

# Ruta ao ficheiro da mensaxe de commit (fornecido por Git)
COMMIT_MSG_FILE=$1

# Le a mensaxe de commit do ficheiro
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

CONVENTIONAL_COMMIT_REGEX='^(novo|apaño|traballo|docs|estilo|orde|rendemento|compilacion|tarefa|tornar)(\([a-zA-Z0-9_.-]+\))?(!)?:\s.*$'

# Comproba se a mensaxe de commit cadra co regex
if ! [[ $COMMIT_MSG =~ $CONVENTIONAL_COMMIT_REGEX ]]; then
    echo "ERRO: A mensaxe de commit non segue o formato dos Conventional Commits."
    echo
    echo "Cómpre utilizar mensaxes de commit co seguinte formato:"
    echo "  <tipo>(<contexto opcional>): <descrición>"
    echo
    echo "Os tipos válidos son:"
    echo "  novo:        Engadir unha nova funcionalidade, capitulo ou sección."
    echo "  traballo:    Continuar escribindo contido xenérico."
    echo "  apaño:       Corrección dun bug ou errata."
    echo "  docs:        Cambios na documentación (README, comentarios, etc.)."
    echo "  estilo:      Cambios no estilo visual dos apuntes."
    echo "  orde:        Reestruturación do código sen engadir funcionalidades nin corrixir bugs."
    echo "  rendemento:  Melloras no rendemento."
    echo "  compilacion: Cambios que afectan o sistema de compilación ou dependencias externas."
    echo "  tarefa:      Tarefas de mantemento que non afectan ao código principal (scripts, hooks, .gitignore, etc.)."
    echo "  tornar:      Reverter un commit anterior."
    echo
    echo "Nota:"
    echo "  O contexto é opcional, e pode indicar un tema (alxebra, mecanica clasia, etc.),"
    echo "  ficheiros ou directorios concretos (Makefile, apuntes.typ, fontes), ou partes do libro (teorema, seccions)."
    echo "  Os commits que introduzan cambios críticos deben ser indicados cun ! antes do :"
    echo
    echo "Exemplos:"
    echo "  novo(topoloxia): crear sección de homotoía"
    echo "  novo(funcions): crear función pra facer tal cousa"
    echo "  traballo(topoloxia): continuar ca sección de homotopía"
    echo "  apaño(alxebra): ecuacións mal escritas"
    echo "  docs(readme): actualizar instrucións de instalación"
    echo "  estilo(teoremas): cambiar as cores dos teoremas"
    echo "  orde(Makefile): eliminar liñas que non facían nada"
    echo "  rendemento(git): usar libgit2 pra obter a info de git na portada"
    echo "  compilacion: Desactivar cache pra reducir uso de memoria"
    echo "  tarefa(fontes): refacer o script de instalación para NewCM"
    echo "  tornar(894febc): contribución engadia un erro"
    echo
    exit 1
fi

exit 0
