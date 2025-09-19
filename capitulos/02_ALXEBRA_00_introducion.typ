#import("/funcions.typ"): *

#capitulo(
    nome : "Álxebra",
    ancora : "cap:alxebra",
)

#seccion(
    nome : "Introdución",
    ancora : "sec:alxebra:introducion"
)

O estudo da álxebra dende un punto de vista abstracto é sorprendentemente útil
na física. O motivo, irónicamente, é que queremos *medir*, ou incluso de forma
máis xeral, *asignar un número a un obxecto físico* e con este facer
operacións. En xeral facemos isto dicindo que certa magnitude física ten
relacionado un número racional máis unha unidade. Por exemplo, a miña
velocidade media ao ir dende casa á facultade en coche é de 46.7 km/h, a
distancia media é de 46.7 km, e o tempo de viaxe é de 1 hora. En todos os casos
temos un número máis unha unidade, o cal resulta excepcionalmente cómodo. Se
miramos magnitudes máis complexas (como a velocidade con unha dirección) ou
incluso outros obxectos que non sexan necesariamente magnitudes físicas, vemos
que o uso dun simple número non é suficiente para caracterizar dito obxecto.
Para unha velocidade cunha dirección usamos _vectores xeométricos_, #nota[Máis
adiante na sección @sec:alxebra:espazos comentarei o por qué do apelido
_xeométricos_.] para caracterizar o efecto dun polarizador nun feixe
luminoso usamos unha _matriz_, na física cuántica describimos os observables
como _operadores_ nun espazo de funcións. En ningún destes casos nos chegaría
con usar un simple _número_, pero en todos estes casos usamos outros obxectos
matemáticos que manteñen certas propiedades destes: os _vectores xeométricos_
ou os _operadores_ poden sumarse e multiplicarse entre si como se fosen simples
números, inda que son conceptos máis complexos.

A álxebra abstrae as relacións entre os números e constrúe estruturas baseadas
nestas, paso a paso, dende aquelas máis simples, coma un monoide ou un grupo,
ás máis mesturadas, coma unha álxebra de Lie. A relevancia da álxebra na física
é esta: non nos chega con números para caracterizar a física, queremos algo
*máis*, mentres mantemos as propiedades que nos son cómodas e coñecidas.
#cita("shafarevich_1990")

Usamos grupos para caracterizar a simetría; os aneis, e concretamente os
corpos, son os números cos que medimos as magnitudes escalares como as que
mencionei antes; a combinación de grupos e aneis danos os espazos lineais
omnipresentes en calquera rama de traballo; se tivésemos varios aneis
falaríamos dunha #underline[álxebra]#nota[Coidado con isto: _a álxebra_, cun artículo
definido, é a rama das matemáticas; _unha álxebra_ cun artículo indefinido, é
unha estrutura concreta];; se un de ditos aneis é asociativo temos unha álxebra
asociativa; se en vez de asociatividade fose unha operación bilineal que cumpre
a identidade de Jacobi, temos unha álxebra de Lie, de uso tamén ubicuo na
cuántica ou na gravitación.

Neste punto non é relevante explicar ningunha desas estruturas, de feito, o
lector cunha base matemática quererá tirarme dos pelos por mencionar tantas
palabras grandes con tanta soltura e tan pouca formalidade. O único que importa
é que calquera estudante de física desta nosa facultade vería algunha vez
algunha de ditas palabras grandes. O que quero facer é comentar, con certa
prudencia, como se constrúen todas elas dende a máis básica á máis complexa.
Meu enfoque é máis pragmático ca os dos matemáticos. Impórtame *menos* seguir
un fío totalmente lóxico e formal entre as partes, e impórtame *máis*
motivalas, presentalas e finalmente definilas de xeito que nos resulten máis
naturais na nosa ciencia. Inda así, é imposible esquivar o estudo de varios
resultados en forma de teoremas, pero non hai que preocuparse, porque
importarannos máis como ferramenta que como base teórica.

Neste capítulo centrareime en presentar variedade de estruturas en orde e en
pasos que personalmente considero razoables. A maioría destas estruturas non se
usan directamente na física, pero son relevantes do mismo xeito que un ladrillo
é importante para construir unha casa. Nos capítulos seguintes falarei en máis
detalle das estruturas relevantes, como os grupos, espazos lineais e álxebras,
que serán estruturas de uso directo na física.
