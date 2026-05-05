SHELL := bash
.DEFAULT_GOAL := .pdf/apuntes.pdf
.PHONY: limpa descargar_fontes comprobar_fontes

METODO := compile
XERADOS := .pdf/* .aux/*

# Os nomes das figuras en PDF
#
# $(patsubst pattern,replacement,text)
# https://www.gnu.org/software/make/manual/html_node/Text-Functions.html
FIGURAS_PDF = $(patsubst figuras/typ/%.typ, .pdf/%.pdf, $(wildcard figuras/typ/*.typ))

# Opcions para compilar
OPCIONS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \
	--timings=.aux/perf.json  \
	--input rama=$(shell git rev-parse --abbrev-ref HEAD) \
	--input hash=$(shell git rev-parse --short HEAD) \
	--input dirt=$(shell test -z "$$(git status --porcelain)" && echo "limpo" || echo "sucio") \
	--input contribucions=$(shell git rev-list HEAD --count)

OPCIONS_FIGURAS := \
	--format pdf              \
	--root .                  \
	--pdf-standard 2.0        \
	--diagnostic-format short \
	--ignore-system-fonts     \
	--ignore-embedded-fonts   \
	--font-path=fontes        \

# Hai que asegurarse de que existe o directorio .pdf e .aux
$(shell if [ ! -d ".pdf" ]; then mkdir .pdf; fi)
$(shell if [ ! -d ".aux" ]; then mkdir .aux; fi)

# Xeramos os apuntes
#
# Esto é pa que Make non borre os PDF se o quito con CTRL-C
.PRECIOUS: .pdf/apuntes.pdf $(FIGURAS_PDF)

.pdf/apuntes.pdf: apuntes.typ funcions/* $(wildcard capitulos/*.typ) $(FIGURAS_PDF)
	@echo -e "\nCompilando apuntes...\n"
	typst $(METODO) \
		$(OPCIONS) \
		apuntes.typ .pdf/apuntes.pdf

# Xerar as figuras
#
# https://www.gnu.org/software/make/manual/html_node/Static-Usage.html#index-_0025_002c-quoting-in-static-pattern
# 4.12.1 Syntax of Static Pattern Rules
# targets …: target-pattern: prereq-patterns …
#
# $@ -> target, e.g. .pdf/figura1.pdf
# $^ -> prereq, e.g. figuras/typ/figura.typ
# :FACER: non podo poñer funcions/figuras.typ como prerequisito..
$(FIGURAS_PDF): .pdf/%.pdf: figuras/typ/%.typ
	@echo -e "\nCompilando figuras...\n"
	typst compile \
		$(OPCIONS_FIGURAS) \
		$^ $@

# :FACER: actualizar isto. Posiblemente facendo un repo cas fontes compiladas e usando submódulos
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
