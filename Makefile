SHELL := bash
.DEFAULT_GOAL := .pdf/apuntes.pdf
.PHONY: limpa

# :FACER: poder elixir se usar compile ou watch con 'make metodo=watch'. Polo
# de agora, ao cancelar con CTRL-C, make da erro
METODO := compile
XERADOS := .pdf/*

# Lista de nomes das figuras que queremos compilar. Podería facerse con
# $(wildcard figuras/*.typ) pero prefiero ser explícito
FIGURAS := \
	proba \
	proba2

FIGURAS_PDF = $(patsubst %, .pdf/%.pdf, $(FIGURAS))

# Opcions para compilar
OPCIONS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0,a-4f   \
	--diagnostic-format short \

# Hai que asegurarse de que existe o directorio .pdf
$(shell if [ ! -d ".pdf" ]; then mkdir .pdf; fi)

# Xeramos os apuntes
.pdf/apuntes.pdf: apuntes.typ funcions.typ $(wildcard capitulos/*.typ) $(FIGURAS_PDF)
	typst $(METODO) $(OPCIONS) apuntes.typ .pdf/apuntes.pdf

# Xerar as figuras
$(FIGURAS_PDF): .pdf/%.pdf: figuras/typ/%.typ
	typst $(METODO) $(OPCIONS) $^ $@

limpa:
	rm -rf $(XERADOS)
