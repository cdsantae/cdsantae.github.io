---
title: "Funciones en R"
author: "Cristian Santa"
output:
  rmdformats::readthedown:
    df_print: paged
    code_folding: show
    highlight: tango
    keep_md: yes
---



## Funciones

Construir funciones es una las principales actividades para pasar de ser usuarios a programadores en el lenguaje `R`. Las funciones se utilizan a menudo para encapsular una secuencia de expresiones que deben ejecutarse varias veces, quizás en condiciones ligeramente diferentes. Las funciones también suelen escribirse cuando el código debe compartirse con otros o con el público.

La escritura de una función permite a un desarrollador crear una interfaz para el código, que se especifica explícitamente con un conjunto de parámetros. Esta interfaz proporciona una abstracción del código a los usuarios potenciales. Esta abstracción simplifica la vida de los usuarios porque les libera de tener que saber cada detalle de cómo funciona el código. Además, la creación de una interfaz permite al desarrollador comunicar al usuario los aspectos del código que son importantes o más relevantes.


```r
NombreFuncion <- function(<argumentos>){
  Cálculos con los argumentos de la función.
  Series de instrucciones en R.
  Desarrollo del cuerpo de la función.
}
```

### Elementos de una función.

Todas las funciones en `R` tienen las siguientes partes:

* **El Cuerpo:** Es el código propio de la función `body()`.
* **Parámetros Formales:** Lista de argumentos de la función `formals()`, `formalsArgs()` o `args()`.
* **Entorno:** Mapa donde se localizan las variables de la función `environment()`.


```r
FuncionEjemplo <- function(){
  # Esta función no hace nada, pero no es un error
}
FuncionEjemplo
```



```r
CuadradoNumero <- function(n){
  n*n #Halle el cuadrado del número
}
CuadradoNumero(8)
```

```
## [1] 64
```

```r
formals(CuadradoNumero)
```

```
## $n
```

```r
body(CuadradoNumero)
```

```
## {
##     n * n
## }
```

```r
environment(CuadradoNumero)
```

```
## <environment: R_GlobalEnv>
```

```r
a <- 20
m <- CuadradoNumero(a)
m
```

```
## [1] 400
```

### Entrega de resultados

La instrucción `return()` finaliza la función, y se recomienda usar al final de la función.


```r
promedio <- function(x){
  n <- length(x)
  suma <- sum(x)
  pro <- suma/n
  return(pro)
}

set.seed(2019)
(y <- sample(x = 10,size = 8))
```

```
## [1]  9  5 10  1  8  4  3  2
```

```r
promedio(y)
```

```
## [1] 5.25
```

```r
# Entrega incorrecta de resultados
funMala <- function(a,b){
  w <- a/b
  x <- a+b
  y <- a^b
  z <- b*a
}
r1 <- funMala(5,7)
r1
```

```
## [1] 35
```

```r
# Entrega correcta de resultados
funBuena <- function(a,b){
  w <- a/b
  x <- a+b
  y <- a^b
  z <- b*a
  return(c(w,x,y,z))
}
r2 <- funBuena(5,7)
r2
```

```
## [1] 7.142857e-01 1.200000e+01 7.812500e+04 3.500000e+01
```

Si se quiere entregar resultados más complejos se recomienda devolverlo en forma de lista con la función `list()`.


```r
MiFuncion1 <- function(x,y){
  z <- sqrt((x-0)^2+(y-0)^2)
  coord <- expand.grid(punto=c(x,y),origen=c(0,0))
  list(z,coord)
}
MiFuncion1(14.2,-5.8)
```

```
## [[1]]
## [1] 15.33884
## 
## [[2]]
##   punto origen
## 1  14.2      0
## 2  -5.8      0
## 3  14.2      0
## 4  -5.8      0
```

```r
MiFuncion1(14.2,-5.8)[[1]]
```

```
## [1] 15.33884
```

```r
MiFuncion1(14.2,-5.8)[[2]]
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["punto"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["origen"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"14.2","2":"0"},{"1":"-5.8","2":"0"},{"1":"14.2","2":"0"},{"1":"-5.8","2":"0"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
MiFuncion1(14.2,-5.8)$coord
```

```
## NULL
```

```r
MiFuncion2 <- function(x,y){
  z <- sqrt((x-0)^2+(y-0)^2)
  coord <- expand.grid(punto=c(x,y),origen=c(0,0))
  list(distancia=z,coordenadas=coord)
}
MiFuncion2(14.2,-5.8)
```

```
## $distancia
## [1] 15.33884
## 
## $coordenadas
##   punto origen
## 1  14.2      0
## 2  -5.8      0
## 3  14.2      0
## 4  -5.8      0
```

```r
MiFuncion2(14.2,-5.8)$distancia
```

```
## [1] 15.33884
```

```r
MiFuncion2(14.2,-5.8)$coordenadas
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["punto"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["origen"],"name":[2],"type":["dbl"],"align":["right"]}],"data":[{"1":"14.2","2":"0"},{"1":"-5.8","2":"0"},{"1":"14.2","2":"0"},{"1":"-5.8","2":"0"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

### Tipos de argumentos

Las funciones pueden recibir cualquier clase de atómico y sus construciones particulares, ya sean vectores, matrices, listas o dataframes, siempre y cuando el cuerpo de la función y los cálculos con los argumentos lo permitan.


```r
x <- c(5, -8, 7, 10, 9)
y <- c(0.2, 7, 6.5, -9, 8)
MiFuncion2(x,y)
```

```
## $distancia
## [1]  5.003998 10.630146  9.552487 13.453624 12.041595
## 
## $coordenadas
##    punto origen
## 1    5.0      0
## 2   -8.0      0
## 3    7.0      0
## 4   10.0      0
## 5    9.0      0
## 6    0.2      0
## 7    7.0      0
## 8    6.5      0
## 9   -9.0      0
## 10   8.0      0
## 11   5.0      0
## 12  -8.0      0
## 13   7.0      0
## 14  10.0      0
## 15   9.0      0
## 16   0.2      0
## 17   7.0      0
## 18   6.5      0
## 19  -9.0      0
## 20   8.0      0
```

```r
set.seed(2019)
(x <- matrix(sample(20,9),3,3))
```

```
##      [,1] [,2] [,3]
## [1,]   10   17   18
## [2,]    5    8   12
## [3,]   13    7    3
```

```r
(y <- matrix(runif(9,-5,5),3,3))
```

```
##           [,1]      [,2]       [,3]
## [1,]  1.605425  1.947276  2.0031486
## [2,] -2.830757  1.354530 -1.2520473
## [3,] -3.049825 -4.318799 -0.3090575
```

```r
MiFuncion2(x,y)
```

```
## $distancia
##          [,1]      [,2]      [,3]
## [1,] 10.12805 17.111163 18.111118
## [2,]  5.74571  8.113862 12.065141
## [3,] 13.35296  8.225085  3.015877
## 
## $coordenadas
##         punto origen
## 1  10.0000000      0
## 2   5.0000000      0
## 3  13.0000000      0
## 4  17.0000000      0
## 5   8.0000000      0
## 6   7.0000000      0
## 7  18.0000000      0
## 8  12.0000000      0
## 9   3.0000000      0
## 10  1.6054247      0
## 11 -2.8307566      0
## 12 -3.0498250      0
## 13  1.9472759      0
## 14  1.3545297      0
## 15 -4.3187987      0
## 16  2.0031486      0
## 17 -1.2520473      0
## 18 -0.3090575      0
## 19 10.0000000      0
## 20  5.0000000      0
## 21 13.0000000      0
## 22 17.0000000      0
## 23  8.0000000      0
## 24  7.0000000      0
## 25 18.0000000      0
## 26 12.0000000      0
## 27  3.0000000      0
## 28  1.6054247      0
## 29 -2.8307566      0
## 30 -3.0498250      0
## 31  1.9472759      0
## 32  1.3545297      0
## 33 -4.3187987      0
## 34  2.0031486      0
## 35 -1.2520473      0
## 36 -0.3090575      0
```

### El argumento `...`

El argumento `...` indica un número variable de argumentos, que usualmente se pasan a otras funciones. `...` se usa para extender otra función y no se quiere copiar la lista completa de los argumentos de la función.


```r
mean
```

```
## function (x, ...) 
## UseMethod("mean")
## <bytecode: 0x000000001555b388>
## <environment: namespace:base>
```

```r
DesvMedicion <- function(x,...){
  m <- mean(x,...)
  d <- sd(x,...)
  res <- c(m-d,m,m+d)
  return(res)
}

set.seed(2019)
(a <- rnorm(10,mean = 5,sd = 2))
```

```
##  [1] 6.477045 3.970479 1.719637 6.832074 2.465036 6.476496 3.434754 6.018592
##  [9] 2.020122 4.361641
```

```r
DesvMedicion(a)
```

```
## [1] 2.409349 4.377588 6.345826
```

```r
b <- c(8,7.5,NA,5.4,9.2,8)
DesvMedicion(b)
```

```
## [1] NA NA NA
```

```r
DesvMedicion(b,na.rm=TRUE)
```

```
## [1] 6.230036 7.620000 9.009964
```

### Devolución de valores de tipo `function`


```r
potencia <- function(e){
  function(x){
    x^e
  }
}
potencia(2)
```

```
## function(x){
##     x^e
##   }
## <environment: 0x0000000012d25d38>
```

```r
potencia(2)(3)
```

```
## [1] 9
```

```r
cuadrado <- potencia(2)
args(cuadrado)
```

```
## function (x) 
## NULL
```

```r
cuadrado(5)
```

```
## [1] 25
```

```r
cubo <- potencia(3)
cubo(2)
```

```
## [1] 8
```

```r
cubo(8)
```

```
## [1] 512
```

```r
raiz <- potencia(0.5)
raiz(16)
```

```
## [1] 4
```

```r
inverso <- potencia(-1)
inverso(2)
```

```
## [1] 0.5
```

```r
inverso(10)
```

```
## [1] 0.1
```

```r
inverso(8)
```

```
## [1] 0.125
```

## Recomedaciones

* Realice los ejercicios de algoritmos. (Adquira un pensamiento algorítmico).
* Comente su código.
* RTFM!. (LEMM o LEPM)
* Piense antes de escribir. (Piense primero en el que y luego en el como).
* Diseñe en forma “top-down”, codifique en forma “bottom up”.
* Divida el problema en pequeñas funciones significativas.
* Evite escribir la misma rutina dos veces.
* Use nombres relevantes.
* Realice una prueba de escritorio o seguimiento. (función por función en forma “bottom up”)
* No se rinda, ¡¡quéjese!! (ayuda a listas, compañeros, etc).
* Evite iteracciones (R es vectorizado)

## Uso de librerías

Todas las funciones y conjuntos de datos de `R` están alojados en librerías o paquetes, solamente cuando los paquetes son cargados sus contenidos estarán disponibles.

Para ver cuáles paquetes están instalados en su computador, use este comando.


```r
library()
```

Si quiere cargar un paquete, por ejemplo `psych`, use este comando.


```r
library(psych)
require(psych)
```

Si aparece un error, significa que no tienes instalado o correctamente instalado el paquete que deseas usar. Para conectarse a internet e instalar o actualizar un paquete, usa estos comandos.


```r
# Instalar un paquete
install.packages("psych",dependencies = TRUE)

# Actualizar un paquete
update.packages("psych")
```

Para ver cuales paquetes están cargados actualmente, puedes ver en la pestaña **Packages** de RStudio o utilizar los siguientes comandos.


```r
search()
sessionInfo()
sessioninfo::package_info()
```

Para utilizar paquetes dentro de las funciones se recomienda cargarlos con el comando `require`, ya que permite que el código se ejecute así no exista el paquete; utilizar el comando `library` dentro de una función puede parar la ejecución sino existe el paquete.

En algunas ocasiones no es necesario cargar el paqute para utilizar una función determinada, con el operador `::` se puede acceder al paquete y extraer la función deseada.


```r
summary(mtcars) # Resumen estadístico básico
```

```
##       mpg             cyl             disp             hp       
##  Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
##  Median :19.20   Median :6.000   Median :196.3   Median :123.0  
##  Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
##  Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
##       drat             wt             qsec             vs        
##  Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
##  1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
##  Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
##  Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
##  3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
##  Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
##        am              gear            carb      
##  Min.   :0.0000   Min.   :3.000   Min.   :1.000  
##  1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
##  Median :0.0000   Median :4.000   Median :2.000  
##  Mean   :0.4062   Mean   :3.688   Mean   :2.812  
##  3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
##  Max.   :1.0000   Max.   :5.000   Max.   :8.000
```

```r
psych::describe(mtcars) # Resumen estadístico detallado
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["vars"],"name":[1],"type":["int"],"align":["right"]},{"label":["n"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["mean"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["sd"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["median"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["trimmed"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["mad"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["min"],"name":[8],"type":["dbl"],"align":["right"]},{"label":["max"],"name":[9],"type":["dbl"],"align":["right"]},{"label":["range"],"name":[10],"type":["dbl"],"align":["right"]},{"label":["skew"],"name":[11],"type":["dbl"],"align":["right"]},{"label":["kurtosis"],"name":[12],"type":["dbl"],"align":["right"]},{"label":["se"],"name":[13],"type":["dbl"],"align":["right"]}],"data":[{"1":"1","2":"32","3":"20.090625","4":"6.0269481","5":"19.200","6":"19.6961538","7":"5.4114900","8":"10.400","9":"33.900","10":"23.500","11":"0.6106550","12":"-0.37276603","13":"1.06542396","_rn_":"mpg"},{"1":"2","2":"32","3":"6.187500","4":"1.7859216","5":"6.000","6":"6.2307692","7":"2.9652000","8":"4.000","9":"8.000","10":"4.000","11":"-0.1746119","12":"-1.76211977","13":"0.31570933","_rn_":"cyl"},{"1":"3","2":"32","3":"230.721875","4":"123.9386938","5":"196.300","6":"222.5230769","7":"140.4763500","8":"71.100","9":"472.000","10":"400.900","11":"0.3816570","12":"-1.20721195","13":"21.90947271","_rn_":"disp"},{"1":"4","2":"32","3":"146.687500","4":"68.5628685","5":"123.000","6":"141.1923077","7":"77.0952000","8":"52.000","9":"335.000","10":"283.000","11":"0.7260237","12":"-0.13555112","13":"12.12031731","_rn_":"hp"},{"1":"5","2":"32","3":"3.596563","4":"0.5346787","5":"3.695","6":"3.5792308","7":"0.7042350","8":"2.760","9":"4.930","10":"2.170","11":"0.2659039","12":"-0.71470062","13":"0.09451874","_rn_":"drat"},{"1":"6","2":"32","3":"3.217250","4":"0.9784574","5":"3.325","6":"3.1526923","7":"0.7672455","8":"1.513","9":"5.424","10":"3.911","11":"0.4231465","12":"-0.02271075","13":"0.17296847","_rn_":"wt"},{"1":"7","2":"32","3":"17.848750","4":"1.7869432","5":"17.710","6":"17.8276923","7":"1.4158830","8":"14.500","9":"22.900","10":"8.400","11":"0.3690453","12":"0.33511422","13":"0.31588992","_rn_":"qsec"},{"1":"8","2":"32","3":"0.437500","4":"0.5040161","5":"0.000","6":"0.4230769","7":"0.0000000","8":"0.000","9":"1.000","10":"1.000","11":"0.2402577","12":"-2.00193762","13":"0.08909831","_rn_":"vs"},{"1":"9","2":"32","3":"0.406250","4":"0.4989909","5":"0.000","6":"0.3846154","7":"0.0000000","8":"0.000","9":"1.000","10":"1.000","11":"0.3640159","12":"-1.92474143","13":"0.08820997","_rn_":"am"},{"1":"10","2":"32","3":"3.687500","4":"0.7378041","5":"4.000","6":"3.6153846","7":"1.4826000","8":"3.000","9":"5.000","10":"2.000","11":"0.5288545","12":"-1.06975068","13":"0.13042656","_rn_":"gear"},{"1":"11","2":"32","3":"2.812500","4":"1.6152000","5":"2.000","6":"2.6538462","7":"1.4826000","8":"1.000","9":"8.000","10":"7.000","11":"1.0508738","12":"1.25704307","13":"0.28552971","_rn_":"carb"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
psych::describeBy(iris,iris$Species) # Resumen estadístico detallado por factor
```

```
## 
##  Descriptive statistics by group 
## group: setosa
##              vars  n mean   sd median trimmed  mad min max range skew kurtosis
## Sepal.Length    1 50 5.01 0.35    5.0    5.00 0.30 4.3 5.8   1.5 0.11    -0.45
## Sepal.Width     2 50 3.43 0.38    3.4    3.42 0.37 2.3 4.4   2.1 0.04     0.60
## Petal.Length    3 50 1.46 0.17    1.5    1.46 0.15 1.0 1.9   0.9 0.10     0.65
## Petal.Width     4 50 0.25 0.11    0.2    0.24 0.00 0.1 0.6   0.5 1.18     1.26
## Species*        5 50 1.00 0.00    1.0    1.00 0.00 1.0 1.0   0.0  NaN      NaN
##                se
## Sepal.Length 0.05
## Sepal.Width  0.05
## Petal.Length 0.02
## Petal.Width  0.01
## Species*     0.00
## ------------------------------------------------------------ 
## group: versicolor
##              vars  n mean   sd median trimmed  mad min max range  skew kurtosis
## Sepal.Length    1 50 5.94 0.52   5.90    5.94 0.52 4.9 7.0   2.1  0.10    -0.69
## Sepal.Width     2 50 2.77 0.31   2.80    2.78 0.30 2.0 3.4   1.4 -0.34    -0.55
## Petal.Length    3 50 4.26 0.47   4.35    4.29 0.52 3.0 5.1   2.1 -0.57    -0.19
## Petal.Width     4 50 1.33 0.20   1.30    1.32 0.22 1.0 1.8   0.8 -0.03    -0.59
## Species*        5 50 2.00 0.00   2.00    2.00 0.00 2.0 2.0   0.0   NaN      NaN
##                se
## Sepal.Length 0.07
## Sepal.Width  0.04
## Petal.Length 0.07
## Petal.Width  0.03
## Species*     0.00
## ------------------------------------------------------------ 
## group: virginica
##              vars  n mean   sd median trimmed  mad min max range  skew kurtosis
## Sepal.Length    1 50 6.59 0.64   6.50    6.57 0.59 4.9 7.9   3.0  0.11    -0.20
## Sepal.Width     2 50 2.97 0.32   3.00    2.96 0.30 2.2 3.8   1.6  0.34     0.38
## Petal.Length    3 50 5.55 0.55   5.55    5.51 0.67 4.5 6.9   2.4  0.52    -0.37
## Petal.Width     4 50 2.03 0.27   2.00    2.03 0.30 1.4 2.5   1.1 -0.12    -0.75
## Species*        5 50 3.00 0.00   3.00    3.00 0.00 3.0 3.0   0.0   NaN      NaN
##                se
## Sepal.Length 0.09
## Sepal.Width  0.05
## Petal.Length 0.08
## Petal.Width  0.04
## Species*     0.00
```

## Ejercicios
* Lea dos números enteros y muestre su producto.
* Lea dos números y muestre su producto.
* Lea el radio de un círculo y muestre su área.
* Lea el nombre de una persona y responda con un saludo.
* Lea un número real y muestre su valor absoluto, sin utilizar estructuras y sin funciones predeterminadas.
* Lea las tres coordenadas de los vértices de un tríangulo y que muestre el área del mismo utilizando la [fórmula de Herón](https://es.wikipedia.org/wiki/Fórmula_de_Herón). Incluya una función que halle la distancia entre dos puntos dados los vértices.
* Lea un número entero y que muestre un cero (0) si el número es par y un uno (1) sin el número es impar, (Sin utilizar ni la estructura de decisión o la de repetición).
* Lea un número entero de tres cifras y muestre el mísmo número pero con los dígitos invertidos (sin utilizar el tipo sarta).
* Lea una matriz y muestre su transpuesta, si utilizar funciones predeterminadas.
* Construya una algoritmo que halle la aproximación a la raíz de un número de la siguiente manera: Lea un número al cual se le hallará la raíz, y luego lea un número cualquiera como primera aproximación a la raíz del número (se supone ser positivo mayor de cero). Halle la división del número inicial entre el número aproximado. Luego halle el promedio entre el número aproximado y el número obtenido de la división anterior. Este promedio es de nuevo un valor aproximado a la raíz. Continuar el proceso hasta que la aproximación sea correcta en el orden de las millonésimas y reporte el número de iteraciones. (No utilizar el operador exponente `^` ni la función `sqrt()`).
* Dado las dimensiones de una matriz (n filas, m columnas), mostrar los índices de la matriz en forma de zig-zag (vertical), comenzando por la posición `[1][1]`.
* Construya una función que ingrese una posición y muestre su representación en la [sucesión de Fibonacci](https://es.wikipedia.org/wiki/Sucesión_de_Fibonacci).
* Dado un número encuentre su factorial.
* Dado un número encuentre los números primos hasta ese número, puede apoyarse en la [Criba de Eratóstenes](https://es.wikipedia.org/wiki/Criba_de_Eratóstenes).

<!--
<div align="center"><b><a href="./Soluciones.html">Soluciones</a></b></div>
-->
## <a href="../EAFIT.html" class="btn" role="button">Regresar</a>
