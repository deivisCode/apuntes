SHELL := bash
.DEFAULT_GOAL := .pdf/apuntes.pdf
.PHONY: limpa descargar_fontes comprobar_fontes

# :FACER: poder elixir se usar compile ou watch con 'make metodo=watch'. Polo
# de agora, ao cancelar con CTRL-C, make da erro
METODO := compile
XERADOS := .pdf/*

# Lista de nomes das figuras que queremos compilar.
# $(patsubst pattern,replacement,text)
# https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
#
# Os nomes das figuras en PDF
FIGURAS_PDF = $(patsubst figuras/typ/%.typ, .pdf/%.pdf, $(wildcard figuras/typ/*.typ))

# Opcions para compilar
# :FACER: esto invoca Git 3 veces pra comprobar a info do repo, non é de todo ideal
OPCIONS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--input rama=$(shell git rev-parse --abbrev-ref HEAD) \
	--input hash=$(shell git rev-parse --short HEAD) \
	--input dirt=$(shell test -z "$$(git status --porcelain)" && echo "limpo" || echo "sucio")

OPCIONS_FIGURAS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \

# Hai que asegurarse de que existe o directorio .pdf
$(shell if [ ! -d ".pdf" ]; then mkdir .pdf; fi)

# Xeramos os apuntes
# :FACER: dependencias nunha variable aparte
.pdf/apuntes.pdf: apuntes.typ estilo.typ funcions.typ $(wildcard capitulos/*.typ) $(FIGURAS_PDF)
	typst $(METODO) $(OPCIONS) apuntes.typ .pdf/apuntes.pdf

# Xerar as figuras
#
# https://www.gnu.org/software/make/manual/html_node/Static-Usage.html#index-_0025_002c-quoting-in-static-pattern
# 4.12.1 Syntax of Static Pattern Rules
# targets …: target-pattern: prereq-patterns …
#
# $@ -> target, e.g. .pdf/figura1.pdf
# $^ -> prereq, e.g. figuras/typ/figura.typ
# :FACER: non podo poñer funcions_figuras como prerequisito..
$(FIGURAS_PDF): .pdf/%.pdf: figuras/typ/%.typ
	typst $(METODO) $(OPCIONS_FIGURAS) $^ $@

descargar_fontes:

	$(shell if [ ! -d "fontes/NewCM" ]; then mkdir -p fontes/NewCM; fi)
	$(shell if [ ! -d "fontes/SymbolsNerdFont" ]; then mkdir -p fontes/SymbolsNerdFont; fi)

	# Descargando e descomprimindo fontes
	wget -O fontes/NewCM.txz https://download.gnu.org.ua/release/newcm/newcm-7.0.4.txz
	tar -xvf fontes/NewCM.txz -C fontes/NewCM

	wget -O fontes/SymbolsNerdFont.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
	unzip fontes/SymbolsNerdFont.zip -d fontes/SymbolsNerdFont

comprobar_fontes:

	# comprobar as rutas
	typst fonts --ignore-system-fonts --ignore-embedded-fonts --font-path=fontes --variants

limpa:
	rm -rf $(XERADOS)
