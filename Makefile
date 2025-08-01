# Unhas regras de make básicas

SHELL := bash

.DEFAULT_GOAL := rula

NOME := apuntes

# COMANDO PARA COMPILAR
# --format pdf              -> xerar un PDF (por defecto, pero prefiero explicitalo)
# --root .                  -> tomar '.' como directorio principal, podense importar cousas
#                              con /a/b/c onde / é o directorio '.'
# --pdf-standard 2.0,a-4f   -> versión do PDF e estandar de accesibilidade
# --diagnostic-format short -> mostra os error en forma corta para poder metelos no editor facilmente
# $(NOME).typ               -> o nome do documento
# .pdf/$(NOME).pdf          -> gardar o PDF no directorio especifico
COMPILA := typst compile \
	--format pdf \
	--root . \
	--pdf-standard 2.0,a-4f \
	--diagnostic-format short \
	$(NOME).typ \
	.pdf/$(NOME).pdf

# Typst non crea os diretorios auxiliares (inda)
rula: $(NOME).typ

	# Checkeamos se temos os directorios auxiliares
	@if [ ! -d ".pdf" ]; then mkdir .pdf; fi

	# Compilamos o documento
	@$(COMPILA)

limpa:
	rm -rf .pdf/* .aux/*

.PHONY: rula limpa
