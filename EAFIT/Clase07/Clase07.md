---
title: "Expresiones Regulares"
author: "Cristian Santa"
always_allow_html: yes
output:
  rmdformats::readthedown:
    df_print: paged
    code_folding: show
    highlight: tango
    keep_md: yes
---



## Introducción

Una expresión regular es un mecanismo que permite seleccionar una cadena de caracteres de otra cadena a través de un patrón específico.


```r
texto <- c("Filosofía", "Antropología", "Matemáticas", "Biología")
regexpr("gía",texto)
```

```
## [1] -1 10 -1  6
## attr(,"match.length")
## [1] -1  3 -1  3
```

El ejemplo anterior busca la sarta `gía` en el vector de sartas `texto`. Ingresa en cada posición del vector y busca si la sarta `gía` es un patrón identificable en cada una de las cadenas de caracteres, si encuentra el patrón entonces indica en cuál posición comienza el patrón:

`1[A] 2[n] 3[t] 4[r] 5[o] 6[p] 7[o] 8[l] 9[o] 10[g] 11[í] 12[a]`
`1[B] 2[i] 3[o] 4[l] 5[o] 6[g] 7[í] 7[a]`

## Metacaracteres

Son caracteres no alfabéticos que poseen un significado especial en las expresiones regulares.

### Cuantificadores

* `?`: El caracter que precede puede aparecer como mucho una vez.
* `+`: El carácter que le precede debe aparecer al menos una vez.
* `*`: El carácter que le precede puede aparecer cero, una, o más veces.
* `{}`. Las llaves juegan el papel de meta caracteres, para que cumplan su funcionalidad deben estar despues de la expresión regular y encierren uno o varios números.
    - `{n}`: Indica que coincide n veces.
    - `{n,}`: Indica que coincide mas n veces.
    - `{,n}`: Indica que coincide hasta n veces.
    - `{n,m}`: Indica que coincide mas n veces y menos de m veces.

### Alternación

* `$`: El signo de dolar representa el final de la cadena de caracteres o el final de la línea.
* `^`: El acento representa el inicio de la cadena.

### Agrupación

* `()`: Los parentesis son usados para la aplicación de operadores sobre mas de un caracter.
* `[]`: Los corchetes agrupan caracteres en grupos o clases. Son útiles cuando es necesario buscar uno de un grupo de caracteres.
    * `[a-z]`: Especifica un rango de caracteres.
    * `[^.... ]`: Lista de caracteres excluidos
* `|` Una barra vertical separa las alternativas. Realiza el papel de o.
* `.` El punto busca cualquier carácter sin incluir los saltos de línea.

### Backslash

* `\a`: Representa una “campana” o “beep” que se produce al imprimir este carácter.
* `\e`: Representa la tecla “Esc” o “Escape”
* `\x`: Se utiliza para representar caracteres [ASCII](https://es.wikipedia.org/wiki/ASCII) o [ANSI](https://es.wikipedia.org/wiki/ANSI.SYS) si conoce su código. De esta forma, si se busca el símbolo de derechos de autor y la fuente en la que se busca utiliza el conjunto de caracteres Latin-1 es posible encontrarlo utilizando `9`.
* `\d`: Representa un dígito del 0 al 9.
* `\w`: Representa cualquier carácter alfanumérico.
* `\s`: Representa un espacio en blanco.
* `\D`: Representa cualquier carácter que no sea un dígito del 0 al 9.
* `\W`: Representa cualquier carácter no alfanumérico.
* `\S`: Representa cualquier carácter que no sea un espacio en blanco.
* `\A`: Representa el inicio de la cadena. No un carácter sino una posición.
* `\Z`: Representa el final de la cadena. No un carácter sino una posición.
* `\b`: Marca la posición de una palabra limitada por espacios en blanco, puntuación o el inicio/final de una cadena.
* `\B`: Marca la posición entre dos caracteres alfanuméricos o dos no-alfanuméricos.

### Negación

* `!`: El signo de admiración representa una busqueda negativa, en otras palabras que no incluya la palabra que especificamos.

### Metacaracteres especiales o de control

* `\t`: Representa un tabulador.
* `\r`: Representa el “retorno de carro” o “regreso al inicio” o sea el lugar en que la línea vuelve a iniciar.
* `\n`: Representa la “nueva línea” el carácter por medio del cual una línea da inicio.
* `\f`: Representa un salto de página
* `\v`: Representa un tabulador vertical
* `\e`: Representa un *escape*.

### Búsqueda y condicionales

* `(?=)`: Búsqueda hacia adelante.
* `(?!)`: Búsqueda hacia adelante negativa, la posición no sigue un patrón.
* `(?<=)`: Búsqeda hacia atrás.
* `(?<!)`: Búsqueda hacia atrás negativa, la posición no sigue un patrón.
* `?( ) `: Condicional, busca lo que está entre paréntesis, si es verdadero entrega lo que esta por fuera.
* `?( ) | `: Condicional, busca lo que está entre paréntesis, si es verdadero entrega lo que esta por fuera, sino entrega lo que sigue de `|`.

### Clases de caracteres

* `[aeiou]`:	Coincide las vocales minúsculas.
* `[AEIOU]`:	Coincide las vocales mayúsculas.
* `[0123456789]`:	Coincide cualquier número.
* `[0-9]`:	Coincide cualquier número.
* `[a-z]`:	Coincide cualquier letra minúscula.
* `[A-Z]`:	Coincide cualquier letra mayúscula.
* `[a-zA-Z0-9]`:	Coincide cualquier alfanúmerico.
* `[^aeiou]`:	Coincide todo excepto las letras definidas.
* `[^0-9]`:	Coincide todo excepto los números.

### Clases de caracteres tipo [`POSIX`](https://es.wikipedia.org/wiki/POSIX)

* `[[:lower:]]`: Coincide letras minúsculas.
* `[[:upper:]]`: Coincide letras mayúsculas.
* `[[:alpha:]]`: Coincide letras.
* `[[:digit:]]`: Coincide números.
* `[[:space:]]`: Coincide caracteres de espacio.
* `[[:blank:]]`: Coincide caracteres de espacio, excepto los de línea nueva.
* `[[:alnum:]]`: Coincide caracteres alfanuméricos.
* `[[:cntrl:]]`: Coincide caracteres de control. Estos no son visibles como `\t`, `\n`, `\e`, `\f`, etc.
* `[[:punct:]]`: Coincide caracteres de puntuación.
* `[[:xdigit:]]`:	Coincide caracteres de digitos Hexadecimales `(0 - 9 A - E)`
* `[[:print:]]`: Coincide caracteres imprimible (`[[:alpha:]]`, `[[:punct:]]` y espacios).
* `[[:graph:]]`: Coincide caracteres gráficos (`[[:alpha:]]` y `[[:punct:]]`)
* `[[:word:]]`: Coincide dígitos, letras y guiones bajos.

## Funciones para Expresiones Regulares


```r
a <- c("Murciélago","Un pájaro en la ventana","Su ID: adf7149q#csl&232")
```

`grep()`: Muestra la posición del vector que contiene el patrón, con el argumento `value` se puede extraer el texto.


```r
grep("(a|2)",a)
```

```
## [1] 1 2 3
```

```r
grep("(a|2)",a,value = T)
```

```
## [1] "Murciélago"              "Un pájaro en la ventana"
## [3] "Su ID: adf7149q#csl&232"
```

```r
grep("[[:digit:]]",a,value = T)
```

```
## [1] "Su ID: adf7149q#csl&232"
```

`grepl()`: Muestra un `TRUE/FALSE` en la posición del vector que contiene el patrón.


```r
grepl("(a|2)",a)
```

```
## [1] TRUE TRUE TRUE
```

```r
grepl("[[:digit:]]",a)
```

```
## [1] FALSE FALSE  TRUE
```

`regexpr()`: Busca el patrón en el vector de caracteres y extrae el índice y la longitud del emparejamiento.


```r
regexpr("(a|2)",a)
```

```
## [1] 8 7 8
## attr(,"match.length")
## [1] 1 1 1
```

```r
regexpr("[[:space:]]",a)
```

```
## [1] -1  3  3
## attr(,"match.length")
## [1] -1  1  1
```

```r
regexpr("[[:digit:]]",a)
```

```
## [1] -1 -1 11
## attr(,"match.length")
## [1] -1 -1  1
```

`gregexpr()`: Busca el patrón en el vector de caracteres y extrae los índices y las longitudes del emparejamiento por cada cada cadena y lo guarda en una lista.


```r
gregexpr("[l|j]a[g|r]o",a)
```

```
## [[1]]
## [1] 7
## attr(,"match.length")
## [1] 4
## 
## [[2]]
## [1] 6
## attr(,"match.length")
## [1] 4
## 
## [[3]]
## [1] -1
## attr(,"match.length")
## [1] -1
```

```r
gregexpr("[[:space:]]",a)
```

```
## [[1]]
## [1] -1
## attr(,"match.length")
## [1] -1
## 
## [[2]]
## [1]  3 10 13 16
## attr(,"match.length")
## [1] 1 1 1 1
## 
## [[3]]
## [1] 3 7
## attr(,"match.length")
## [1] 1 1
```

```r
gregexpr("[[:digit:]]",a)
```

```
## [[1]]
## [1] -1
## attr(,"match.length")
## [1] -1
## 
## [[2]]
## [1] -1
## attr(,"match.length")
## [1] -1
## 
## [[3]]
## [1] 11 12 13 14 21 22 23
## attr(,"match.length")
## [1] 1 1 1 1 1 1 1
```

`substr()`: Dada una sarta extrae un fragmento del texto entre `start` y `stop`.


```r
substr(a,3,10)
```

```
## [1] "rciélago" " pájaro " " ID: adf"
```

```r
substr(a,10,20)
```

```
## [1] "o"           " en la vent" "f7149q#csl&"
```

```r
substr(a,3:5,6:10)
```

```
## [1] "rcié" "pája" "D: a"
```

`regmatches()`: Es similar a `substr` pero recibe las salidas de `regexpr` para extraer el fragmento del texto.


```r
regmatches(a,regexpr("[[:digit:]]",a))
```

```
## [1] "7"
```

```r
regmatches(a,regexpr("[l|j]a[g|r]o",a))
```

```
## [1] "lago" "jaro"
```

```r
regmatches(a,gregexpr("[l|j]a[g|r]o",a))
```

```
## [[1]]
## [1] "lago"
## 
## [[2]]
## [1] "jaro"
## 
## [[3]]
## character(0)
```

`regexec()`: Es similar a `regexpr` pero se puede implementar con metacaracteres.


```r
regexec("[[:punct:]] | [[:alpha:]]",a)
```

```
## [[1]]
## [1] -1
## attr(,"match.length")
## [1] -1
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 3
## attr(,"match.length")
## [1] 2
## attr(,"useBytes")
## [1] TRUE
## 
## [[3]]
## [1] 3
## attr(,"match.length")
## [1] 2
## attr(,"useBytes")
## [1] TRUE
```

```r
regexec("[a-z]{1,5}",a)
```

```
## [[1]]
## [1] 2
## attr(,"match.length")
## [1] 4
## attr(,"useBytes")
## [1] TRUE
## 
## [[2]]
## [1] 2
## attr(,"match.length")
## [1] 1
## attr(,"useBytes")
## [1] TRUE
## 
## [[3]]
## [1] 2
## attr(,"match.length")
## [1] 1
## attr(,"useBytes")
## [1] TRUE
```

`sub()`: Busca el patrón en la sarta y reemplaza el primer emparejamiento por un valor definido.


```r
sub("[a-z]{1,5}","---",a)
```

```
## [1] "M---élago"                 "U--- pájaro en la ventana"
## [3] "S--- ID: adf7149q#csl&232"
```

```r
sub("[[:alnum:]]","---",a)
```

```
## [1] "---urciélago"              "---n pájaro en la ventana"
## [3] "---u ID: adf7149q#csl&232"
```

```r
sub("(é|á|+[[:punct:]])","=",a)
```

```
## [1] "Murci=lago"              "Un p=jaro en la ventana"
## [3] "Su ID= adf7149q#csl&232"
```

`gsub()`: Busca el patrón en la sarta y reemplaza todos los valores del emparejamiento por un valor definido.


```r
gsub("[a-z]{1,5}","---",a)
```

```
## [1] "M---é---"                    "U--- ---á--- --- --- ------"
## [3] "S--- ID: ---7149---#---&232"
```

```r
gsub("[[:alnum:]]","_",a)
```

```
## [1] "__________"              "__ ______ __ __ _______"
## [3] "__ __: ________#___&___"
```

```r
gsub("(é|á|[[:punct:]]|[[:upper:]])","=",a)
```

```
## [1] "=urci=lago"              "=n p=jaro en la ventana"
## [3] "=u === adf7149q=csl=232"
```

`nchar()`:	Cuenta el número de caracteres en una sarta o vector de sartas.


```r
nchar(a)
```

```
## [1] 10 23 23
```

```r
nchar("    ")
```

```
## [1] 4
```

`tolower()`: Convierte todas las sartas o caracteres a minúsculas.


```r
tolower(a)
```

```
## [1] "murciélago"              "un pájaro en la ventana"
## [3] "su id: adf7149q#csl&232"
```

```r
tolower("NADA ME OBLIGA")
```

```
## [1] "nada me obliga"
```

`toupper()`: Convierte todas las sartas o caracteres a mayúsculas.


```r
toupper(a)
```

```
## [1] "MURCIÉLAGO"              "UN PÁJARO EN LA VENTANA"
## [3] "SU ID: ADF7149Q#CSL&232"
```

```r
toupper("voy para arriba")
```

```
## [1] "VOY PARA ARRIBA"
```

`chartr()`: Busca el patrón en una sarta y lo reemplaza por una cadena de caracteres definido.


```r
chartr("iéla","Hola",a)
```

```
## [1] "MurcHolago"              "Un pájaro en la ventana"
## [3] "Su ID: adf7149q#csl&232"
```

`setdiff()`: Determina la diferencia entre dos vectores.


```r
setdiff(a,c("Mucrielago","Un pájaro en la ventana","ID: adf7149q$csl&232"))
```

```
## [1] "Murciélago"              "Su ID: adf7149q#csl&232"
```

`setequal()`: Compureba si dos vectores contiene las mismas cadenas de caracteres.


```r
setequal(a,c("Mucrielago","Un pájaro en la ventana","ID: adf7149q$csl&232"))
```

```
## [1] FALSE
```

```r
setequal(a,c("Murciélago","Un pájaro en la ventana","Su ID: adf7149q#csl&232"))
```

```
## [1] TRUE
```

`abbreviate()`: Abrevia las sartas a un número definido de caracteres.


```r
abbreviate(a,2)
```

```
##              Murciélago Un pájaro en la ventana Su ID: adf7149q#csl&232 
##                    "Mr"                 "Upelv"                   "SIa"
```

```r
abbreviate(a,6)
```

```
##              Murciélago Un pájaro en la ventana Su ID: adf7149q#csl&232 
##                "Murclg"                "Unpelv"                "SID:a7"
```

```r
abbreviate(a)
```

```
##              Murciélago Un pájaro en la ventana Su ID: adf7149q#csl&232 
##                  "Mrcl"                 "Upelv"                  "SIDa"
```

`strsplit()`: Divide las sartas basado en el patrón de busqueda y la transforma en un vector.


```r
strsplit(a,"l")
```

```
## [[1]]
## [1] "Murcié" "ago"   
## 
## [[2]]
## [1] "Un pájaro en " "a ventana"    
## 
## [[3]]
## [1] "Su ID: adf7149q#cs" "&232"
```

```r
strsplit(a,"[[:punct:]]")
```

```
## [[1]]
## [1] "Murciélago"
## 
## [[2]]
## [1] "Un pájaro en la ventana"
## 
## [[3]]
## [1] "Su ID"     " adf7149q" "csl"       "232"
```

```r
strsplit(a,"(é|á|[[:blank:]])")
```

```
## [[1]]
## [1] "Murci" "lago" 
## 
## [[2]]
## [1] "Un"      "p"       "jaro"    "en"      "la"      "ventana"
## 
## [[3]]
## [1] "Su"               "ID:"              "adf7149q#csl&232"
```

### Paquete `stringr`

Este paquete hace parte del universo `tidyverse` y sirve para trabajar análisis de texto.


```r
install.packages("stringr",dependencies = T)
```


```r
library(stringr)
```

`str_detect(cadena, patrón)`: Detecta la presencia de un patrón o la coincidencia en una cadena.


```r
str_detect(a,"(élag|ája)")
```

```
## [1]  TRUE  TRUE FALSE
```

```r
str_detect(a,"[[:digit:]]")
```

```
## [1] FALSE FALSE  TRUE
```

`str_which(cadena, patrón)`: Encuentra los índices de las cadenas que contienen un patrón coincidente.


```r
str_which(a,"(élag|ája)")
```

```
## [1] 1 2
```

```r
str_which(a,"[[:blank:]]")
```

```
## [1] 2 3
```

`str_count(cadena, patrón)`: Cuenta el número de coincidencias en una cadena.


```r
str_count(a,"[[:lower:]]")
```

```
## [1]  9 18  8
```

```r
str_count(a,"[[:blank:]]")
```

```
## [1] 0 4 2
```

`str_locate(cadena, patrón)`: Localiza las posiciones del patrón que coincide en la cadena. También `str_locate_all`.


```r
str_locate(a,"la")
```

```
##      start end
## [1,]     7   8
## [2,]    14  15
## [3,]    NA  NA
```

```r
str_locate_all(a,"la")
```

```
## [[1]]
##      start end
## [1,]     7   8
## 
## [[2]]
##      start end
## [1,]    14  15
## 
## [[3]]
##      start end
```

```r
str_locate_all(a,"[[:punct:]]")
```

```
## [[1]]
##      start end
## 
## [[2]]
##      start end
## 
## [[3]]
##      start end
## [1,]     6   6
## [2,]    16  16
## [3,]    20  20
```

```r
str_locate(a,"[[:digit:]]")
```

```
##      start end
## [1,]    NA  NA
## [2,]    NA  NA
## [3,]    11  11
```

```r
str_locate_all(a,"[[:digit:]]")
```

```
## [[1]]
##      start end
## 
## [[2]]
##      start end
## 
## [[3]]
##      start end
## [1,]    11  11
## [2,]    12  12
## [3,]    13  13
## [4,]    14  14
## [5,]    21  21
## [6,]    22  22
## [7,]    23  23
```

`str_sub(cadena, start = 1L, end = -1L)`: Extrae subcadenas de un vector de caracteres.


```r
str_sub(a,3,7)
```

```
## [1] "rciél" " pája" " ID: "
```

`str_subset(cadena, patrón)`: Devuelve solo las cadenas que contienen un patrón coincidente.


```r
str_subset(a,"la")
```

```
## [1] "Murciélago"              "Un pájaro en la ventana"
```

```r
str_subset(a,"[[:blank:]]")
```

```
## [1] "Un pájaro en la ventana" "Su ID: adf7149q#csl&232"
```

`str_extract(cadena, patrón)`: Devuelve el primer patrón encontrado que coincide en cada cadena, como un vector. También `str_extract_all` para devolver cada patrón coincidente.


```r
str_extract(a,"la")
```

```
## [1] "la" "la" NA
```

```r
str_extract(a,"[[:blank:]]")
```

```
## [1] NA  " " " "
```

```r
str_extract(a,"[[:punct:]]")
```

```
## [1] NA  NA  ":"
```

```r
str_extract_all(a,"[[:punct:]]")
```

```
## [[1]]
## character(0)
## 
## [[2]]
## character(0)
## 
## [[3]]
## [1] ":" "#" "&"
```

```r
str_extract_all(a,"[[:graph:]]")
```

```
## [[1]]
##  [1] "M" "u" "r" "c" "i" "é" "l" "a" "g" "o"
## 
## [[2]]
##  [1] "U" "n" "p" "á" "j" "a" "r" "o" "e" "n" "l" "a" "v" "e" "n" "t" "a" "n" "a"
## 
## [[3]]
##  [1] "S" "u" "I" "D" ":" "a" "d" "f" "7" "1" "4" "9" "q" "#" "c" "s" "l" "&" "2"
## [20] "3" "2"
```

`str_match(cadena, patrón)`: Devuelve el primer patrón encontrado que coincide en cada cadena, como una matriz, con una columna para cada un metacaracter entre `( )` agrupado por patrón. También `str_match_all`.


```r
str_match(a,"[[:alnum:]]")
```

```
##      [,1]
## [1,] "M" 
## [2,] "U" 
## [3,] "S"
```

```r
str_match_all(a,"[[:space:]]")
```

```
## [[1]]
##      [,1]
## 
## [[2]]
##      [,1]
## [1,] " " 
## [2,] " " 
## [3,] " " 
## [4,] " " 
## 
## [[3]]
##      [,1]
## [1,] " " 
## [2,] " "
```

* `str_length(cadena)`: Los anchos de las cadenas (i.e. número de puntos de código, suele ser igual al número de caracteres).
* `str_pad()`: Extiende cadenas a un ancho constante.
* `str_trunc()`: Trunca el ancho de una cadena, eliminando el contenido sobrante.
* `str_trim()`: Elimina los espacios en blanco desde el comienzo y/o el final de una cadena.
* `str_sub() <- valor`: Reemplaza subcadenas identificadas con str_sub() y se asignan al resultado.
* `str_replace(cadena, patrón, reemplazo)`: Reemplaza el primer patrón coincidente en cada cadena.
* `str_replace_all(cadena, patrón, reemplazo)`: Remplaza todos los patrones coincidentes en cada cadena.
* `str_to_lower(cadena)` Convierte cadenas a minúscula.
* `str_to_upper(cadena)`: Convierte cadenas a mayúsculas.
* `str_to_title(cadena)`: Convierte cadenas a título.

`str_c(..., sep = "", collapse = NULL)`: Une múltiples cadenas en una.


```r
str_c("Hola",a,sep = " ")
```

```
## [1] "Hola Murciélago"              "Hola Un pájaro en la ventana"
## [3] "Hola Su ID: adf7149q#csl&232"
```

`str_c(..., sep = "", collapse = "")`: Colapsa un vector de cadenas en una sola cadena.


```r
str_c(a,collapse = " - ")
```

```
## [1] "Murciélago - Un pájaro en la ventana - Su ID: adf7149q#csl&232"
```

* `str_dup(cadena, veces)`: Repite cadenas varias veces.
* `str_split_fixed(cadena, patrón, n)`: Divide un vector de cadenas en una matriz de subcadenas (dividiendo en las ocurrencias del patrón de coincidencia). También `str_split` para devolver una lista de subcadenas.
* `str_order()`: Devuelve el vector de índices que ordena un vector de caracteres. `x[str_order(x)]`.
* `str_sort()`: Ordena un vector de caracteres.
* `str_conv(cadena, encoding)`: Sobre escribe el tipo de codificación de una cadena.
* `str_view(cadena, patrón, match = NA)`: Vista en HTML de la primera coincidencia de expresión regular en cada cadena.
* `str_view_all(cadena, patrón, match = NA)`: Vista en HTML de todas las coincidencias de la expresión regular.
* `str_wrap()`: Envuelve cadenas en párrafos de forma atractiva.

## Web Scrapping

Esta metodología sirve para buscar patrones en internet y construir bases de datos estructuradas con el fin de realizar análisis estadísticos posteriores. El primer paso es identificar los patrones en las direcciones de las páginas web, luego identificar los nodos con la información de interés y finalmente extraer la información con Expresiones Regulares

Este es un ejemplo básico.


```r
# install.packages("rvest",dependencies = T)
library(rvest)

curriculos <- ""
for (dip in seq(1,10,by=1)){
  url = paste0("http://www.congreso.es/portal/page/portal/Congreso/Congreso/Diputados/BusqForm?_piref73_1333155_73_1333154_1333154.next_page=/wc/fichaDiputado?idDiputado=",dip,"&idLegislatura=12")
  
  congreso <- read_html(url)
  curric <- congreso %>%
    html_node("#curriculum") %>%
    html_text %>%
    strsplit(split = "\n") %>%
    unlist() %>%
    .[. != ""]
  #Pequeña limpieza de texto
  curric <- trimws(curric)
  #Elimina las líneas sin contenido
  curric <- curric[which(curric!="")]
  #Nos quedamos justo con la linea que hay debajo de la palabra legislaturas
  linea <- curric[grep("legislatura", curric)+1]
  curriculos <- rbind(curriculos,linea)
}

curriculos <- data.frame(curriculos[-1])
palabras <- strsplit(as.matrix(curriculos)," ")
palabras <- as.character(unlist(palabras))
palabras <- data.frame(palabras)
names(palabras) = c("V1")
palabras$V1 <- sub("([[:space:]])","",palabras$V1)
palabras$V1 <- sub("([[:digit:]])","",palabras$V1)
palabras$V1 <- sub("([[:punct:]])","",palabras$V1)
palabras$largo <- nchar(palabras$V1)
palabras
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["V1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["largo"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"Dos","2":"3"},{"1":"hijos","2":"5"},{"1":"","2":"0"},{"1":"Diplomado","2":"9"},{"1":"Universitario","2":"13"},{"1":"en","2":"2"},{"1":"Trabajo","2":"7"},{"1":"Social","2":"6"},{"1":"Licenciado","2":"10"},{"1":"en","2":"2"},{"1":"Derecho","2":"7"},{"1":"","2":"0"},{"1":"Diplomado","2":"9"},{"1":"en","2":"2"},{"1":"Altos","2":"5"},{"1":"estudios","2":"8"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Defensa(CESEDEN)","2":"16"},{"1":"","2":"0"},{"1":"Idioma","2":"6"},{"1":"Inglés","2":"6"},{"1":"","2":"0"},{"1":"Inspector","2":"9"},{"1":"de","2":"2"},{"1":"Hacienda","2":"8"},{"1":"del","2":"3"},{"1":"Estado","2":"6"},{"1":"","2":"0"},{"1":"Miembro","2":"7"},{"1":"del","2":"3"},{"1":"Instituto","2":"9"},{"1":"de","2":"2"},{"1":"Censores","2":"8"},{"1":"Jurados","2":"7"},{"1":"de","2":"2"},{"1":"Cuentas","2":"7"},{"1":"Graduada","2":"8"},{"1":"Social","2":"6"},{"1":"Diplomada","2":"9"},{"1":"Licenciado","2":"10"},{"1":"en","2":"2"},{"1":"Derecho","2":"7"},{"1":"por","2":"3"},{"1":"la","2":"2"},{"1":"Universidad","2":"11"},{"1":"de","2":"2"},{"1":"Málaga","2":"6"},{"1":"Procurador","2":"10"},{"1":"de","2":"2"},{"1":"los","2":"3"},{"1":"Tribunales","2":"10"},{"1":"ha","2":"2"},{"1":"ostentado","2":"9"},{"1":"el","2":"2"},{"1":"cargo","2":"5"},{"1":"de","2":"2"},{"1":"Vicedecano","2":"10"},{"1":"del","2":"3"},{"1":"Ilustre","2":"7"},{"1":"Colegio","2":"7"},{"1":"de","2":"2"},{"1":"Procuradores","2":"12"},{"1":"de","2":"2"},{"1":"Málaga","2":"6"},{"1":"de","2":"2"},{"1":"donde","2":"5"},{"1":"ha","2":"2"},{"1":"sido","2":"4"},{"1":"profesor","2":"8"},{"1":"del","2":"3"},{"1":"Curso","2":"5"},{"1":"de","2":"2"},{"1":"prácticas","2":"9"},{"1":"Jurídicas","2":"9"},{"1":"Bachelor","2":"8"},{"1":"of","2":"2"},{"1":"Art","2":"3"},{"1":"and","2":"3"},{"1":"Design","2":"6"},{"1":"Southampton","2":"11"},{"1":"University","2":"10"},{"1":"","2":"0"},{"1":"Grado","2":"5"},{"1":"en","2":"2"},{"1":"diseño","2":"6"},{"1":"ELISAVA","2":"7"},{"1":"Universitat","2":"11"},{"1":"Pompeu","2":"6"},{"1":"Fabra","2":"5"},{"1":"","2":"0"},{"1":"Concejal","2":"8"},{"1":"del","2":"3"},{"1":"Ayuntamiento","2":"12"},{"1":"de","2":"2"},{"1":"Llagostera","2":"10"},{"1":"011","2":"3"},{"1":"a","2":"1"},{"1":"016","2":"3"},{"1":"","2":"0"},{"1":"Secretario","2":"10"},{"1":"General","2":"7"},{"1":"de","2":"2"},{"1":"las","2":"3"},{"1":"Joventut","2":"8"},{"1":"Nacionalista","2":"12"},{"1":"de","2":"2"},{"1":"Catalunya","2":"9"},{"1":"","2":"0"},{"1":"Vinculado","2":"9"},{"1":"al","2":"2"},{"1":"mundo","2":"5"},{"1":"del","2":"3"},{"1":"ocio","2":"4"},{"1":"juvenil","2":"7"},{"1":"i","2":"1"},{"1":"de","2":"2"},{"1":"los","2":"3"},{"1":"esplais","2":"7"},{"1":"Casado","2":"6"},{"1":"Dos","2":"3"},{"1":"hijas","2":"5"},{"1":"Licenciado","2":"10"},{"1":"en","2":"2"},{"1":"Derecho","2":"7"},{"1":"Diplomado","2":"9"},{"1":"de","2":"2"},{"1":"tercer","2":"6"},{"1":"grado","2":"5"},{"1":"en","2":"2"},{"1":"Derecho","2":"7"},{"1":"Público","2":"7"},{"1":"Máster","2":"6"},{"1":"en","2":"2"},{"1":"Seguridad","2":"9"},{"1":"y","2":"1"},{"1":"Política","2":"8"},{"1":"Exterior","2":"8"},{"1":"Programa","2":"8"},{"1":"de","2":"2"},{"1":"Gestión","2":"7"},{"1":"Pública","2":"7"},{"1":"en","2":"2"},{"1":"IESE","2":"4"},{"1":"Programa","2":"8"},{"1":"de","2":"2"},{"1":"gestión","2":"7"},{"1":"de","2":"2"},{"1":"Parlamentarios","2":"14"},{"1":"en","2":"2"},{"1":"el","2":"2"},{"1":"Instituto","2":"9"},{"1":"de","2":"2"},{"1":"Empresa","2":"7"},{"1":"IE.","2":"3"},{"1":"School.","2":"7"},{"1":"Abogado","2":"7"},{"1":"y","2":"1"},{"1":"profesor","2":"8"},{"1":"de","2":"2"},{"1":"Derecho","2":"7"},{"1":"Administrativo","2":"14"},{"1":"","2":"0"},{"1":"Militante","2":"9"},{"1":"de","2":"2"},{"1":"Convergència","2":"12"},{"1":"Democràtica","2":"11"},{"1":"de","2":"2"},{"1":"Catalunya","2":"9"},{"1":"Fue","2":"3"},{"1":"Presidente","2":"10"},{"1":"y","2":"1"},{"1":"Secretario","2":"10"},{"1":"General","2":"7"},{"1":"de","2":"2"},{"1":"las","2":"3"},{"1":"juventudes","2":"10"},{"1":"de","2":"2"},{"1":"Convergència","2":"12"},{"1":"998-2001).","2":"10"},{"1":"Presidente","2":"10"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Fundació","2":"8"},{"1":"Llibertat","2":"9"},{"1":"","2":"0"},{"1":"i","2":"1"},{"1":"Democràcia","2":"10"},{"1":"sección","2":"7"},{"1":"catalana","2":"8"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Internacional","2":"13"},{"1":"Liberal","2":"7"},{"1":"y","2":"1"},{"1":"Vicepresidente","2":"14"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Internacional","2":"13"},{"1":"Liberal","2":"7"},{"1":"Casado","2":"6"},{"1":"Dos","2":"3"},{"1":"hijos","2":"5"},{"1":"","2":"0"},{"1":"Técnico","2":"7"},{"1":"especialista","2":"12"},{"1":"en","2":"2"},{"1":"Dibujo","2":"6"},{"1":"Lineal","2":"6"},{"1":"","2":"0"},{"1":"Concejal","2":"8"},{"1":"del","2":"3"},{"1":"Ayuntamiento","2":"12"},{"1":"de","2":"2"},{"1":"Breña","2":"5"},{"1":"Baja","2":"4"},{"1":"996-1999).","2":"10"},{"1":"","2":"0"},{"1":"Consejero","2":"9"},{"1":"del","2":"3"},{"1":"Cabildo","2":"7"},{"1":"Insular","2":"7"},{"1":"de","2":"2"},{"1":"La","2":"2"},{"1":"Palma","2":"5"},{"1":"999-2003).","2":"10"},{"1":"","2":"0"},{"1":"Diputado","2":"8"},{"1":"del","2":"3"},{"1":"Parlamento","2":"10"},{"1":"de","2":"2"},{"1":"Canarias","2":"8"},{"1":"004-2007).","2":"10"},{"1":"","2":"0"},{"1":"Director","2":"8"},{"1":"General","2":"7"},{"1":"de","2":"2"},{"1":"Desarrollo","2":"10"},{"1":"Rural","2":"5"},{"1":"de","2":"2"},{"1":"Canarias","2":"8"},{"1":"007-2010)","2":"9"},{"1":"Licenciada","2":"10"},{"1":"en","2":"2"},{"1":"Ciencias","2":"8"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Información","2":"11"},{"1":"por","2":"3"},{"1":"la","2":"2"},{"1":"Universidad","2":"11"},{"1":"de","2":"2"},{"1":"Navarra","2":"7"},{"1":"Doctora","2":"7"},{"1":"en","2":"2"},{"1":"Ciencias","2":"8"},{"1":"de","2":"2"},{"1":"la","2":"2"},{"1":"Información","2":"11"},{"1":"Universidad","2":"11"},{"1":"de","2":"2"},{"1":"Navarra.","2":"8"},{"1":"Catedrática","2":"11"},{"1":"de","2":"2"},{"1":"Comunicación","2":"12"},{"1":"Audiovisual","2":"11"},{"1":"y","2":"1"},{"1":"Publicidad","2":"10"},{"1":"Universidad","2":"11"},{"1":"de","2":"2"},{"1":"Alicante.","2":"9"},{"1":"Licenciado","2":"10"},{"1":"en","2":"2"},{"1":"Medicina","2":"8"},{"1":"y","2":"1"},{"1":"Cirugía","2":"7"},{"1":"Especialista","2":"12"},{"1":"Digestivo","2":"9"},{"1":"Licenciada","2":"10"},{"1":"en","2":"2"},{"1":"Medicina","2":"8"},{"1":"y","2":"1"},{"1":"Cirugía","2":"7"},{"1":"Funcionaria","2":"11"},{"1":"de","2":"2"},{"1":"carrera","2":"7"},{"1":"del","2":"3"},{"1":"Cuerpo","2":"6"},{"1":"Superior","2":"8"},{"1":"Salud","2":"5"},{"1":"Pública","2":"7"},{"1":"y","2":"1"},{"1":"Administración","2":"14"},{"1":"Sanitaria","2":"9"},{"1":"Especialista","2":"12"},{"1":"en","2":"2"},{"1":"Medicina","2":"8"},{"1":"Familiar","2":"8"},{"1":"y","2":"1"},{"1":"Comunitaria","2":"11"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
palabras <- subset(palabras, largo>4)
palabras
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["V1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["largo"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"hijos","2":"5","_rn_":"2"},{"1":"Diplomado","2":"9","_rn_":"4"},{"1":"Universitario","2":"13","_rn_":"5"},{"1":"Trabajo","2":"7","_rn_":"7"},{"1":"Social","2":"6","_rn_":"8"},{"1":"Licenciado","2":"10","_rn_":"9"},{"1":"Derecho","2":"7","_rn_":"11"},{"1":"Diplomado","2":"9","_rn_":"13"},{"1":"Altos","2":"5","_rn_":"15"},{"1":"estudios","2":"8","_rn_":"16"},{"1":"Defensa(CESEDEN)","2":"16","_rn_":"19"},{"1":"Idioma","2":"6","_rn_":"21"},{"1":"Inglés","2":"6","_rn_":"22"},{"1":"Inspector","2":"9","_rn_":"24"},{"1":"Hacienda","2":"8","_rn_":"26"},{"1":"Estado","2":"6","_rn_":"28"},{"1":"Miembro","2":"7","_rn_":"30"},{"1":"Instituto","2":"9","_rn_":"32"},{"1":"Censores","2":"8","_rn_":"34"},{"1":"Jurados","2":"7","_rn_":"35"},{"1":"Cuentas","2":"7","_rn_":"37"},{"1":"Graduada","2":"8","_rn_":"38"},{"1":"Social","2":"6","_rn_":"39"},{"1":"Diplomada","2":"9","_rn_":"40"},{"1":"Licenciado","2":"10","_rn_":"41"},{"1":"Derecho","2":"7","_rn_":"43"},{"1":"Universidad","2":"11","_rn_":"46"},{"1":"Málaga","2":"6","_rn_":"48"},{"1":"Procurador","2":"10","_rn_":"49"},{"1":"Tribunales","2":"10","_rn_":"52"},{"1":"ostentado","2":"9","_rn_":"54"},{"1":"cargo","2":"5","_rn_":"56"},{"1":"Vicedecano","2":"10","_rn_":"58"},{"1":"Ilustre","2":"7","_rn_":"60"},{"1":"Colegio","2":"7","_rn_":"61"},{"1":"Procuradores","2":"12","_rn_":"63"},{"1":"Málaga","2":"6","_rn_":"65"},{"1":"donde","2":"5","_rn_":"67"},{"1":"profesor","2":"8","_rn_":"70"},{"1":"Curso","2":"5","_rn_":"72"},{"1":"prácticas","2":"9","_rn_":"74"},{"1":"Jurídicas","2":"9","_rn_":"75"},{"1":"Bachelor","2":"8","_rn_":"76"},{"1":"Design","2":"6","_rn_":"80"},{"1":"Southampton","2":"11","_rn_":"81"},{"1":"University","2":"10","_rn_":"82"},{"1":"Grado","2":"5","_rn_":"84"},{"1":"diseño","2":"6","_rn_":"86"},{"1":"ELISAVA","2":"7","_rn_":"87"},{"1":"Universitat","2":"11","_rn_":"88"},{"1":"Pompeu","2":"6","_rn_":"89"},{"1":"Fabra","2":"5","_rn_":"90"},{"1":"Concejal","2":"8","_rn_":"92"},{"1":"Ayuntamiento","2":"12","_rn_":"94"},{"1":"Llagostera","2":"10","_rn_":"96"},{"1":"Secretario","2":"10","_rn_":"101"},{"1":"General","2":"7","_rn_":"102"},{"1":"Joventut","2":"8","_rn_":"105"},{"1":"Nacionalista","2":"12","_rn_":"106"},{"1":"Catalunya","2":"9","_rn_":"108"},{"1":"Vinculado","2":"9","_rn_":"110"},{"1":"mundo","2":"5","_rn_":"112"},{"1":"juvenil","2":"7","_rn_":"115"},{"1":"esplais","2":"7","_rn_":"119"},{"1":"Casado","2":"6","_rn_":"120"},{"1":"hijas","2":"5","_rn_":"122"},{"1":"Licenciado","2":"10","_rn_":"123"},{"1":"Derecho","2":"7","_rn_":"125"},{"1":"Diplomado","2":"9","_rn_":"126"},{"1":"tercer","2":"6","_rn_":"128"},{"1":"grado","2":"5","_rn_":"129"},{"1":"Derecho","2":"7","_rn_":"131"},{"1":"Público","2":"7","_rn_":"132"},{"1":"Máster","2":"6","_rn_":"133"},{"1":"Seguridad","2":"9","_rn_":"135"},{"1":"Política","2":"8","_rn_":"137"},{"1":"Exterior","2":"8","_rn_":"138"},{"1":"Programa","2":"8","_rn_":"139"},{"1":"Gestión","2":"7","_rn_":"141"},{"1":"Pública","2":"7","_rn_":"142"},{"1":"Programa","2":"8","_rn_":"145"},{"1":"gestión","2":"7","_rn_":"147"},{"1":"Parlamentarios","2":"14","_rn_":"149"},{"1":"Instituto","2":"9","_rn_":"152"},{"1":"Empresa","2":"7","_rn_":"154"},{"1":"School.","2":"7","_rn_":"156"},{"1":"Abogado","2":"7","_rn_":"157"},{"1":"profesor","2":"8","_rn_":"159"},{"1":"Derecho","2":"7","_rn_":"161"},{"1":"Administrativo","2":"14","_rn_":"162"},{"1":"Militante","2":"9","_rn_":"164"},{"1":"Convergència","2":"12","_rn_":"166"},{"1":"Democràtica","2":"11","_rn_":"167"},{"1":"Catalunya","2":"9","_rn_":"169"},{"1":"Presidente","2":"10","_rn_":"171"},{"1":"Secretario","2":"10","_rn_":"173"},{"1":"General","2":"7","_rn_":"174"},{"1":"juventudes","2":"10","_rn_":"177"},{"1":"Convergència","2":"12","_rn_":"179"},{"1":"998-2001).","2":"10","_rn_":"180"},{"1":"Presidente","2":"10","_rn_":"181"},{"1":"Fundació","2":"8","_rn_":"184"},{"1":"Llibertat","2":"9","_rn_":"185"},{"1":"Democràcia","2":"10","_rn_":"188"},{"1":"sección","2":"7","_rn_":"189"},{"1":"catalana","2":"8","_rn_":"190"},{"1":"Internacional","2":"13","_rn_":"193"},{"1":"Liberal","2":"7","_rn_":"194"},{"1":"Vicepresidente","2":"14","_rn_":"196"},{"1":"Internacional","2":"13","_rn_":"199"},{"1":"Liberal","2":"7","_rn_":"200"},{"1":"Casado","2":"6","_rn_":"201"},{"1":"hijos","2":"5","_rn_":"203"},{"1":"Técnico","2":"7","_rn_":"205"},{"1":"especialista","2":"12","_rn_":"206"},{"1":"Dibujo","2":"6","_rn_":"208"},{"1":"Lineal","2":"6","_rn_":"209"},{"1":"Concejal","2":"8","_rn_":"211"},{"1":"Ayuntamiento","2":"12","_rn_":"213"},{"1":"Breña","2":"5","_rn_":"215"},{"1":"996-1999).","2":"10","_rn_":"217"},{"1":"Consejero","2":"9","_rn_":"219"},{"1":"Cabildo","2":"7","_rn_":"221"},{"1":"Insular","2":"7","_rn_":"222"},{"1":"Palma","2":"5","_rn_":"225"},{"1":"999-2003).","2":"10","_rn_":"226"},{"1":"Diputado","2":"8","_rn_":"228"},{"1":"Parlamento","2":"10","_rn_":"230"},{"1":"Canarias","2":"8","_rn_":"232"},{"1":"004-2007).","2":"10","_rn_":"233"},{"1":"Director","2":"8","_rn_":"235"},{"1":"General","2":"7","_rn_":"236"},{"1":"Desarrollo","2":"10","_rn_":"238"},{"1":"Rural","2":"5","_rn_":"239"},{"1":"Canarias","2":"8","_rn_":"241"},{"1":"007-2010)","2":"9","_rn_":"242"},{"1":"Licenciada","2":"10","_rn_":"243"},{"1":"Ciencias","2":"8","_rn_":"245"},{"1":"Información","2":"11","_rn_":"248"},{"1":"Universidad","2":"11","_rn_":"251"},{"1":"Navarra","2":"7","_rn_":"253"},{"1":"Doctora","2":"7","_rn_":"254"},{"1":"Ciencias","2":"8","_rn_":"256"},{"1":"Información","2":"11","_rn_":"259"},{"1":"Universidad","2":"11","_rn_":"260"},{"1":"Navarra.","2":"8","_rn_":"262"},{"1":"Catedrática","2":"11","_rn_":"263"},{"1":"Comunicación","2":"12","_rn_":"265"},{"1":"Audiovisual","2":"11","_rn_":"266"},{"1":"Publicidad","2":"10","_rn_":"268"},{"1":"Universidad","2":"11","_rn_":"269"},{"1":"Alicante.","2":"9","_rn_":"271"},{"1":"Licenciado","2":"10","_rn_":"272"},{"1":"Medicina","2":"8","_rn_":"274"},{"1":"Cirugía","2":"7","_rn_":"276"},{"1":"Especialista","2":"12","_rn_":"277"},{"1":"Digestivo","2":"9","_rn_":"278"},{"1":"Licenciada","2":"10","_rn_":"279"},{"1":"Medicina","2":"8","_rn_":"281"},{"1":"Cirugía","2":"7","_rn_":"283"},{"1":"Funcionaria","2":"11","_rn_":"284"},{"1":"carrera","2":"7","_rn_":"286"},{"1":"Cuerpo","2":"6","_rn_":"288"},{"1":"Superior","2":"8","_rn_":"289"},{"1":"Salud","2":"5","_rn_":"290"},{"1":"Pública","2":"7","_rn_":"291"},{"1":"Administración","2":"14","_rn_":"293"},{"1":"Sanitaria","2":"9","_rn_":"294"},{"1":"Especialista","2":"12","_rn_":"295"},{"1":"Medicina","2":"8","_rn_":"297"},{"1":"Familiar","2":"8","_rn_":"298"},{"1":"Comunitaria","2":"11","_rn_":"300"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
library(plyr)
(conteo <- data.frame(ddply(palabras, "V1",summarise, cuenta=length(V1) )))
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["V1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["cuenta"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"004-2007).","2":"1"},{"1":"007-2010)","2":"1"},{"1":"996-1999).","2":"1"},{"1":"998-2001).","2":"1"},{"1":"999-2003).","2":"1"},{"1":"Abogado","2":"1"},{"1":"Administración","2":"1"},{"1":"Administrativo","2":"1"},{"1":"Alicante.","2":"1"},{"1":"Altos","2":"1"},{"1":"Audiovisual","2":"1"},{"1":"Ayuntamiento","2":"2"},{"1":"Bachelor","2":"1"},{"1":"Breña","2":"1"},{"1":"Cabildo","2":"1"},{"1":"Canarias","2":"2"},{"1":"cargo","2":"1"},{"1":"carrera","2":"1"},{"1":"Casado","2":"2"},{"1":"catalana","2":"1"},{"1":"Catalunya","2":"2"},{"1":"Catedrática","2":"1"},{"1":"Censores","2":"1"},{"1":"Ciencias","2":"2"},{"1":"Cirugía","2":"2"},{"1":"Colegio","2":"1"},{"1":"Comunicación","2":"1"},{"1":"Comunitaria","2":"1"},{"1":"Concejal","2":"2"},{"1":"Consejero","2":"1"},{"1":"Convergència","2":"2"},{"1":"Cuentas","2":"1"},{"1":"Cuerpo","2":"1"},{"1":"Curso","2":"1"},{"1":"Defensa(CESEDEN)","2":"1"},{"1":"Democràcia","2":"1"},{"1":"Democràtica","2":"1"},{"1":"Derecho","2":"5"},{"1":"Desarrollo","2":"1"},{"1":"Design","2":"1"},{"1":"Dibujo","2":"1"},{"1":"Digestivo","2":"1"},{"1":"Diplomada","2":"1"},{"1":"Diplomado","2":"3"},{"1":"Diputado","2":"1"},{"1":"Director","2":"1"},{"1":"diseño","2":"1"},{"1":"Doctora","2":"1"},{"1":"donde","2":"1"},{"1":"ELISAVA","2":"1"},{"1":"Empresa","2":"1"},{"1":"especialista","2":"1"},{"1":"Especialista","2":"2"},{"1":"esplais","2":"1"},{"1":"Estado","2":"1"},{"1":"estudios","2":"1"},{"1":"Exterior","2":"1"},{"1":"Fabra","2":"1"},{"1":"Familiar","2":"1"},{"1":"Funcionaria","2":"1"},{"1":"Fundació","2":"1"},{"1":"General","2":"3"},{"1":"gestión","2":"1"},{"1":"Gestión","2":"1"},{"1":"grado","2":"1"},{"1":"Grado","2":"1"},{"1":"Graduada","2":"1"},{"1":"Hacienda","2":"1"},{"1":"hijas","2":"1"},{"1":"hijos","2":"2"},{"1":"Idioma","2":"1"},{"1":"Ilustre","2":"1"},{"1":"Información","2":"2"},{"1":"Inglés","2":"1"},{"1":"Inspector","2":"1"},{"1":"Instituto","2":"2"},{"1":"Insular","2":"1"},{"1":"Internacional","2":"2"},{"1":"Joventut","2":"1"},{"1":"Jurados","2":"1"},{"1":"Jurídicas","2":"1"},{"1":"juvenil","2":"1"},{"1":"juventudes","2":"1"},{"1":"Liberal","2":"2"},{"1":"Licenciada","2":"2"},{"1":"Licenciado","2":"4"},{"1":"Lineal","2":"1"},{"1":"Llagostera","2":"1"},{"1":"Llibertat","2":"1"},{"1":"Málaga","2":"2"},{"1":"Máster","2":"1"},{"1":"Medicina","2":"3"},{"1":"Miembro","2":"1"},{"1":"Militante","2":"1"},{"1":"mundo","2":"1"},{"1":"Nacionalista","2":"1"},{"1":"Navarra","2":"1"},{"1":"Navarra.","2":"1"},{"1":"ostentado","2":"1"},{"1":"Palma","2":"1"},{"1":"Parlamentarios","2":"1"},{"1":"Parlamento","2":"1"},{"1":"Política","2":"1"},{"1":"Pompeu","2":"1"},{"1":"prácticas","2":"1"},{"1":"Presidente","2":"2"},{"1":"Procurador","2":"1"},{"1":"Procuradores","2":"1"},{"1":"profesor","2":"2"},{"1":"Programa","2":"2"},{"1":"Pública","2":"2"},{"1":"Publicidad","2":"1"},{"1":"Público","2":"1"},{"1":"Rural","2":"1"},{"1":"Salud","2":"1"},{"1":"Sanitaria","2":"1"},{"1":"School.","2":"1"},{"1":"sección","2":"1"},{"1":"Secretario","2":"2"},{"1":"Seguridad","2":"1"},{"1":"Social","2":"2"},{"1":"Southampton","2":"1"},{"1":"Superior","2":"1"},{"1":"Técnico","2":"1"},{"1":"tercer","2":"1"},{"1":"Trabajo","2":"1"},{"1":"Tribunales","2":"1"},{"1":"Universidad","2":"4"},{"1":"Universitario","2":"1"},{"1":"Universitat","2":"1"},{"1":"University","2":"1"},{"1":"Vicedecano","2":"1"},{"1":"Vicepresidente","2":"1"},{"1":"Vinculado","2":"1"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
(conteo[order(-conteo$cuenta),])
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["V1"],"name":[1],"type":["chr"],"align":["left"]},{"label":["cuenta"],"name":[2],"type":["int"],"align":["right"]}],"data":[{"1":"Derecho","2":"5","_rn_":"38"},{"1":"Licenciado","2":"4","_rn_":"86"},{"1":"Universidad","2":"4","_rn_":"128"},{"1":"Diplomado","2":"3","_rn_":"44"},{"1":"General","2":"3","_rn_":"62"},{"1":"Medicina","2":"3","_rn_":"92"},{"1":"Ayuntamiento","2":"2","_rn_":"12"},{"1":"Canarias","2":"2","_rn_":"16"},{"1":"Casado","2":"2","_rn_":"19"},{"1":"Catalunya","2":"2","_rn_":"21"},{"1":"Ciencias","2":"2","_rn_":"24"},{"1":"Cirugía","2":"2","_rn_":"25"},{"1":"Concejal","2":"2","_rn_":"29"},{"1":"Convergència","2":"2","_rn_":"31"},{"1":"Especialista","2":"2","_rn_":"53"},{"1":"hijos","2":"2","_rn_":"70"},{"1":"Información","2":"2","_rn_":"73"},{"1":"Instituto","2":"2","_rn_":"76"},{"1":"Internacional","2":"2","_rn_":"78"},{"1":"Liberal","2":"2","_rn_":"84"},{"1":"Licenciada","2":"2","_rn_":"85"},{"1":"Málaga","2":"2","_rn_":"90"},{"1":"Presidente","2":"2","_rn_":"106"},{"1":"profesor","2":"2","_rn_":"109"},{"1":"Programa","2":"2","_rn_":"110"},{"1":"Pública","2":"2","_rn_":"111"},{"1":"Secretario","2":"2","_rn_":"119"},{"1":"Social","2":"2","_rn_":"121"},{"1":"004-2007).","2":"1","_rn_":"1"},{"1":"007-2010)","2":"1","_rn_":"2"},{"1":"996-1999).","2":"1","_rn_":"3"},{"1":"998-2001).","2":"1","_rn_":"4"},{"1":"999-2003).","2":"1","_rn_":"5"},{"1":"Abogado","2":"1","_rn_":"6"},{"1":"Administración","2":"1","_rn_":"7"},{"1":"Administrativo","2":"1","_rn_":"8"},{"1":"Alicante.","2":"1","_rn_":"9"},{"1":"Altos","2":"1","_rn_":"10"},{"1":"Audiovisual","2":"1","_rn_":"11"},{"1":"Bachelor","2":"1","_rn_":"13"},{"1":"Breña","2":"1","_rn_":"14"},{"1":"Cabildo","2":"1","_rn_":"15"},{"1":"cargo","2":"1","_rn_":"17"},{"1":"carrera","2":"1","_rn_":"18"},{"1":"catalana","2":"1","_rn_":"20"},{"1":"Catedrática","2":"1","_rn_":"22"},{"1":"Censores","2":"1","_rn_":"23"},{"1":"Colegio","2":"1","_rn_":"26"},{"1":"Comunicación","2":"1","_rn_":"27"},{"1":"Comunitaria","2":"1","_rn_":"28"},{"1":"Consejero","2":"1","_rn_":"30"},{"1":"Cuentas","2":"1","_rn_":"32"},{"1":"Cuerpo","2":"1","_rn_":"33"},{"1":"Curso","2":"1","_rn_":"34"},{"1":"Defensa(CESEDEN)","2":"1","_rn_":"35"},{"1":"Democràcia","2":"1","_rn_":"36"},{"1":"Democràtica","2":"1","_rn_":"37"},{"1":"Desarrollo","2":"1","_rn_":"39"},{"1":"Design","2":"1","_rn_":"40"},{"1":"Dibujo","2":"1","_rn_":"41"},{"1":"Digestivo","2":"1","_rn_":"42"},{"1":"Diplomada","2":"1","_rn_":"43"},{"1":"Diputado","2":"1","_rn_":"45"},{"1":"Director","2":"1","_rn_":"46"},{"1":"diseño","2":"1","_rn_":"47"},{"1":"Doctora","2":"1","_rn_":"48"},{"1":"donde","2":"1","_rn_":"49"},{"1":"ELISAVA","2":"1","_rn_":"50"},{"1":"Empresa","2":"1","_rn_":"51"},{"1":"especialista","2":"1","_rn_":"52"},{"1":"esplais","2":"1","_rn_":"54"},{"1":"Estado","2":"1","_rn_":"55"},{"1":"estudios","2":"1","_rn_":"56"},{"1":"Exterior","2":"1","_rn_":"57"},{"1":"Fabra","2":"1","_rn_":"58"},{"1":"Familiar","2":"1","_rn_":"59"},{"1":"Funcionaria","2":"1","_rn_":"60"},{"1":"Fundació","2":"1","_rn_":"61"},{"1":"gestión","2":"1","_rn_":"63"},{"1":"Gestión","2":"1","_rn_":"64"},{"1":"grado","2":"1","_rn_":"65"},{"1":"Grado","2":"1","_rn_":"66"},{"1":"Graduada","2":"1","_rn_":"67"},{"1":"Hacienda","2":"1","_rn_":"68"},{"1":"hijas","2":"1","_rn_":"69"},{"1":"Idioma","2":"1","_rn_":"71"},{"1":"Ilustre","2":"1","_rn_":"72"},{"1":"Inglés","2":"1","_rn_":"74"},{"1":"Inspector","2":"1","_rn_":"75"},{"1":"Insular","2":"1","_rn_":"77"},{"1":"Joventut","2":"1","_rn_":"79"},{"1":"Jurados","2":"1","_rn_":"80"},{"1":"Jurídicas","2":"1","_rn_":"81"},{"1":"juvenil","2":"1","_rn_":"82"},{"1":"juventudes","2":"1","_rn_":"83"},{"1":"Lineal","2":"1","_rn_":"87"},{"1":"Llagostera","2":"1","_rn_":"88"},{"1":"Llibertat","2":"1","_rn_":"89"},{"1":"Máster","2":"1","_rn_":"91"},{"1":"Miembro","2":"1","_rn_":"93"},{"1":"Militante","2":"1","_rn_":"94"},{"1":"mundo","2":"1","_rn_":"95"},{"1":"Nacionalista","2":"1","_rn_":"96"},{"1":"Navarra","2":"1","_rn_":"97"},{"1":"Navarra.","2":"1","_rn_":"98"},{"1":"ostentado","2":"1","_rn_":"99"},{"1":"Palma","2":"1","_rn_":"100"},{"1":"Parlamentarios","2":"1","_rn_":"101"},{"1":"Parlamento","2":"1","_rn_":"102"},{"1":"Política","2":"1","_rn_":"103"},{"1":"Pompeu","2":"1","_rn_":"104"},{"1":"prácticas","2":"1","_rn_":"105"},{"1":"Procurador","2":"1","_rn_":"107"},{"1":"Procuradores","2":"1","_rn_":"108"},{"1":"Publicidad","2":"1","_rn_":"112"},{"1":"Público","2":"1","_rn_":"113"},{"1":"Rural","2":"1","_rn_":"114"},{"1":"Salud","2":"1","_rn_":"115"},{"1":"Sanitaria","2":"1","_rn_":"116"},{"1":"School.","2":"1","_rn_":"117"},{"1":"sección","2":"1","_rn_":"118"},{"1":"Seguridad","2":"1","_rn_":"120"},{"1":"Southampton","2":"1","_rn_":"122"},{"1":"Superior","2":"1","_rn_":"123"},{"1":"Técnico","2":"1","_rn_":"124"},{"1":"tercer","2":"1","_rn_":"125"},{"1":"Trabajo","2":"1","_rn_":"126"},{"1":"Tribunales","2":"1","_rn_":"127"},{"1":"Universitario","2":"1","_rn_":"129"},{"1":"Universitat","2":"1","_rn_":"130"},{"1":"University","2":"1","_rn_":"131"},{"1":"Vicedecano","2":"1","_rn_":"132"},{"1":"Vicepresidente","2":"1","_rn_":"133"},{"1":"Vinculado","2":"1","_rn_":"134"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>




```r
require(wordcloud2)
wordcloud2(conteo,size=1,color='random-dark',gridSize = 10)
```

<!--html_preserve--><div id="htmlwidget-aa0cb9829c7e0b413211" style="width:768px;height:480px;" class="wordcloud2 html-widget"></div>
<script type="application/json" data-for="htmlwidget-aa0cb9829c7e0b413211">{"x":{"word":["004-2007).","007-2010)","996-1999).","998-2001).","999-2003).","Abogado","Administración","Administrativo","Alicante.","Altos","Audiovisual","Ayuntamiento","Bachelor","Breña","Cabildo","Canarias","cargo","carrera","Casado","catalana","Catalunya","Catedrática","Censores","Ciencias","Cirugía","Colegio","Comunicación","Comunitaria","Concejal","Consejero","Convergència","Cuentas","Cuerpo","Curso","Defensa(CESEDEN)","Democràcia","Democràtica","Derecho","Desarrollo","Design","Dibujo","Digestivo","Diplomada","Diplomado","Diputado","Director","diseño","Doctora","donde","ELISAVA","Empresa","especialista","Especialista","esplais","Estado","estudios","Exterior","Fabra","Familiar","Funcionaria","Fundació","General","gestión","Gestión","grado","Grado","Graduada","Hacienda","hijas","hijos","Idioma","Ilustre","Información","Inglés","Inspector","Instituto","Insular","Internacional","Joventut","Jurados","Jurídicas","juvenil","juventudes","Liberal","Licenciada","Licenciado","Lineal","Llagostera","Llibertat","Málaga","Máster","Medicina","Miembro","Militante","mundo","Nacionalista","Navarra","Navarra.","ostentado","Palma","Parlamentarios","Parlamento","Política","Pompeu","prácticas","Presidente","Procurador","Procuradores","profesor","Programa","Pública","Publicidad","Público","Rural","Salud","Sanitaria","School.","sección","Secretario","Seguridad","Social","Southampton","Superior","Técnico","tercer","Trabajo","Tribunales","Universidad","Universitario","Universitat","University","Vicedecano","Vicepresidente","Vinculado"],"freq":[1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,2,1,1,2,1,2,1,1,2,2,1,1,1,2,1,2,1,1,1,1,1,1,5,1,1,1,1,1,3,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,2,1,1,2,1,1,2,1,2,1,1,1,1,1,2,2,4,1,1,1,2,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,2,2,2,1,1,1,1,1,1,1,2,1,2,1,1,1,1,1,1,4,1,1,1,1,1,1],"fontFamily":"Segoe UI","fontWeight":"bold","color":"random-dark","minSize":0,"weightFactor":36,"backgroundColor":"white","gridSize":10,"minRotation":-0.785398163397448,"maxRotation":0.785398163397448,"shuffle":true,"rotateRatio":0.4,"shape":"circle","ellipticity":0.65,"figBase64":null,"hover":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## <a href="../EAFIT.html" class="btn" role="button">Regresar</a>



