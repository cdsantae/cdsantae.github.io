---
title: "Condicionales, ciclos y secuencias"
author: "Cristian Santa"
output:
  rmdformats::readthedown:
    df_print: paged
    code_folding: show
    highlight: tango
    keep_md: yes
---



## Estructura de decisión

Normalmente, los operadores lógicos y relacionales se utilizan con sentencias de programación condicional *si* y *si no*. La sentencia `if` se puede utilizar sola o con la sentencia `else`. La forma de la sentencia `if` es:


```r
# Ejemplo 1
if( <condición verdadera> )
  entonces haga esto

# Ejemplo 2
if( <condición verdadera> ){
  entonces haga esto
}else{#si no
  entonces haga esto otro
} 
```

La condición entre paréntesis usualmente usará un operador relacional para determinar si la condición es verdadera. Cuando la instrucción `if` se usa sola y la condición entre paréntesis no es verdadera, entonces no sucede nada. Por ejemplo:


```r
x<-6; y<-2

# Si x es menor o igual que y entonces asigne z
if(x<=y) z<-x+y

# La condición no es verdadera, entonces no sucede nada
# z

# Si la relación es contraria, entonces la condición es verdadera
if(x>=y) z <- x+y
z
```

```
## [1] 8
```

```r
# También se puede asignar antes del if
z <- if(x>=y) x+y
z
```

```
## [1] 8
```

Para que algo suceda si la condición entre paréntesis no es verdadera, use `if` junto con `else` para especificar una alternativa. Tenga en cuenta que no hay una condición entre paréntesis después de la instrucción `else`. En este caso, el código que sigue a continuación se ejecutará siempre que la condición `if` no sea verdadera.


```r
if(x<y){
  z <- x+y
}else{
  z <- x*y
}
z
```

```
## [1] 12
```

```r
# El resultado se puede llevar a una variable
z <- if(x<y) {x+y} else {x*y}
z
```

```
## [1] 12
```

En la condición se puede utilizar varios operadores lógicos.


```r
a <- 3; b <- 5; c <- 1

if(a<b & b>c){ 5 }else{ 4 }
```

```
## [1] 5
```

```r
if(a<b & b<c){ 5 }else{ 4 }
```

```
## [1] 4
```

```r
if(a>b | b<c){ 5 }else{ 4 }
```

```
## [1] 4
```

```r
if(a>b | b>c & a!=c){ 5 }else{ 4 }
```

```
## [1] 5
```

```r
if((a>b | b>c) & (a!=c & b<a)){ 5 }else{ 4 }
```

```
## [1] 4
```

Si se pretende evaluar varias condiciones para obtener más de dos valores de respuestas, es posible anidar los condicionales.


```r
if(a<b & b>c){
  if(c>a){
    8
  }else{
    5
  }
}
```

```
## [1] 5
```

```r
if(a<b & b<c){
  if(c<a){
    8
  }else{
    5
  }
}else{
  if(a==c){
    7
  }else{
    4
  }
}
```

```
## [1] 4
```

En `R` existe una función útil para reemplazar valores dependiendo de un condicional.


```r
?ifelse
```


```r
(x <- 4:12)
```

```
## [1]  4  5  6  7  8  9 10 11 12
```

```r
ifelse(x!=7, 1, 0)
```

```
## [1] 1 1 1 0 1 1 1 1 1
```

```r
ifelse(x!=7, 1, x)
```

```
## [1] 1 1 1 7 1 1 1 1 1
```

```r
ifelse(x!=7, x, NA)
```

```
## [1]  4  5  6 NA  8  9 10 11 12
```

```r
# Muestre los impares
# na.omit(ifelse(x%%2, x, NA))
ifelse(x%%2, x, NA)
```

```
## [1] NA  5 NA  7 NA  9 NA 11 NA
```

```r
# Muestre los pares
# na.omit(ifelse(x%%2, NA, x))
ifelse(x%%2, NA, x)
```

```
## [1]  4 NA  6 NA  8 NA 10 NA 12
```

## Estructuras de repetición

El control por repetición, o bucle, le permite repetir el código de manera eficiente sin tener que escribir el mismo código una y otra vez. En `R` dos expresiones comunes de bucle son `for` y `while`.

Los bucles `for` se utilizan para recorrer un proceso un número específico de veces. Se utiliza una variable de contador (generalmente designada por una letra minúscula `i`) para contar cuántas veces se ejecuta el bucle.


```r
for(<variable> in <comienzo>:<final>){
  ejecute la tarea
}
```

Dentro de la sentencia del `for` se tiene que especificar una secuencia de recorrido, ya sea con el operador `:` o ingresando un vector definido.


```r
for(i in 1:10){
  print(i)
}
```

```
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
## [1] 10
```

```r
# Secuencia basada en las posiciones del vector
x <- c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

```r
# Secuencia basada en el tamaño del vector
for(i in seq_along(x)){
  print(x[i])
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

```r
# Secuencia basada en los elentos del vector
for(letras in x){
  print(letras)
}
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

```r
# Se puede hacer en una sola línea
for(i in 1:4) print(x[i])
```

```
## [1] "a"
## [1] "b"
## [1] "c"
## [1] "d"
```

Los bucles `for` pueden ser anidados uno dentro de otro.


```r
(x <- matrix(1:6, 2, 3))
```

```
##      [,1] [,2] [,3]
## [1,]    1    3    5
## [2,]    2    4    6
```

```r
for(i in 1:nrow(x)){
  for(j in 1:ncol(x)){
    print(x[i,j])
  }
}
```

```
## [1] 1
## [1] 3
## [1] 5
## [1] 2
## [1] 4
## [1] 6
```

```r
# Se puede utilizar los ciclos para construir objetos
(x <- matrix(NA, 4, 4))
```

```
##      [,1] [,2] [,3] [,4]
## [1,]   NA   NA   NA   NA
## [2,]   NA   NA   NA   NA
## [3,]   NA   NA   NA   NA
## [4,]   NA   NA   NA   NA
```

```r
for(i in 1:ncol(x)){
    for(j in 1:nrow(x)){
      if(i%%2==0){
        x[j,i] <- 2*(i+j)
    }else{
        x[j,i] <- 2*(i+j)-1
    }
  }
}
x
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    3    6    7   10
## [2,]    5    8    9   12
## [3,]    7   10   11   14
## [4,]    9   12   13   16
```

El bucle `while` repite una condición mientras que la expresión entre paréntesis es verdadera y toma la forma


```r
while (<condición verdadera>) {
  ejecute la tarea
}
```

Los bucles `While` comienzan probando una condición. Si es verdad, entonces ejecutan el cuerpo del bucle. Una vez que se ejecuta el cuerpo del bucle, la condición se prueba de nuevo, y así sucesivamente, hasta que la condición es falsa, después de lo cual el bucle termina.


```r
count <- 0
while(count < 10){
  print(count)
  count <- count + 1
}
```

```
## [1] 0
## [1] 1
## [1] 2
## [1] 3
## [1] 4
## [1] 5
## [1] 6
## [1] 7
## [1] 8
## [1] 9
```

Los bucles `while` pueden dar lugar a bucles infinitos si no se escriben correctamente. ¡Usa esto con cuidado!
A veces habrá más de una condición en la prueba.


```r
z <- 5
set.seed(1) # Establecer semilla de números aleatorios

while(z >= 3 && z <= 10){
  moneda <- rbinom(1, 1, 0.5) # número aleatorio bernoulli p=1/2
  
  if(moneda == 1){  # caminata aleatoria
    z <- z + 1
  }else{
    z <- z - 1
  }
}
print(z)
```

```
## [1] 2
```

```r
# Para saber cuántas veces hace la caminata se usa un auxiliar
z <- 5
cuenta <- 1
set.seed(1)

while(z >= 3 && z <= 10){
  moneda <- rbinom(1, 1, 0.5)
  
  if(moneda == 1){
    z <- z + 1
  }else{
    z <- z - 1
  }
  cuenta <- cuenta+1
}
print(z)
```

```
## [1] 2
```

```r
print(cuenta)
```

```
## [1] 32
```

El ciclo `repeat` inicia un bucle infinito desde el principio. Estos no se utilizan comúnmente en aplicaciones estadísticas o de análisis de datos, pero tienen sus usos. La única forma de salir de un ciclo de repetición es llamar a `break`.


```r
repeat{
  ejecute tareas
}
```

Un posible paradigma podría ser un algoritmo iterativo en el que esté buscando una solución y no quiera detenerse hasta que esté lo suficientemente cerca de la solución. En este tipo de situación, a menudo no se sabe de antemano cuántas iteraciones se necesitarán para "acercarse lo suficiente" a la solución.


```r
# Número de raíces cuadradas
x0 <- 1000
tol <- 1e-08
pasos <- 1

repeat{
  x1 <- sqrt(x0)
  if(abs(x1-x0) < tol){
    break
  }else{
    x0 <- x1
  }
  pasos <- pasos+1
}
x0
```

```
## [1] 1
```

```r
pasos
```

```
## [1] 30
```

Los argumentos `next` y `break` son utilizados comúnmente cuando se quiere omitir pasos de un ciclo, o cuando se quiere parar el ciclo en un momento dado, respectivamente.


```r
x <- NULL
for(i in 1:50){
  if(i <= 20){ #omitir los primeros 20 pasos
    next
  }
  x <- c(x,i)
}
x
```

```
##  [1] 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
## [26] 46 47 48 49 50
```

```r
y <- NULL
for(j in 1:1000){
  if(j > 20){ #parar antes de 20 iteraciones
    break
  }
  y <- c(y,j)
}
y
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

## Secuencias

* `seq()` genera una secuencia regular de números
* `rep()` repite un objeto un numero definido de veces
* `seq_along()` genera una secuencia regular basado en el tamaño del objeto
* `seq_len()` genera una secuencia regular con un tamaño específico
* `sequence()` genera una secuencia concatenando los elementos
* `gl()` genera una secuencia de factores
* `:` genera una secuencia regular de números
* `expand.grid()` crea un marco con todas las posibles combinaciones de vectores o factores


```r
seq(from = 1, to = 10, by = 2)
```

```
## [1] 1 3 5 7 9
```

```r
seq(from = 5, to = 8, length.out = 10)
```

```
##  [1] 5.000000 5.333333 5.666667 6.000000 6.333333 6.666667 7.000000 7.333333
##  [9] 7.666667 8.000000
```

```r
seq(20)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

```r
seq_along(1:20)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

```r
seq_len(20)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

```r
rep(4, 5)
```

```
## [1] 4 4 4 4 4
```

```r
rep(1:4, 3)
```

```
##  [1] 1 2 3 4 1 2 3 4 1 2 3 4
```

```r
rep(c("Hola","Clase"),5)
```

```
##  [1] "Hola"  "Clase" "Hola"  "Clase" "Hola"  "Clase" "Hola"  "Clase" "Hola" 
## [10] "Clase"
```

```r
sequence(4)
```

```
## [1] 1 2 3 4
```

```r
sequence(c(2,5))
```

```
## [1] 1 2 1 2 3 4 5
```

```r
sequence(1:10)
```

```
##  [1]  1  1  2  1  2  3  1  2  3  4  1  2  3  4  5  1  2  3  4  5  6  1  2  3  4
## [26]  5  6  7  1  2  3  4  5  6  7  8  1  2  3  4  5  6  7  8  9  1  2  3  4  5
## [51]  6  7  8  9 10
```

```r
gl(n = 1,k = 6)
```

```
## [1] 1 1 1 1 1 1
## Levels: 1
```

```r
gl(5, 2, labels = c("Juliana","Carlos","Lina","Manuela","Adriana"))
```

```
##  [1] Juliana Juliana Carlos  Carlos  Lina    Lina    Manuela Manuela Adriana
## [10] Adriana
## Levels: Juliana Carlos Lina Manuela Adriana
```

```r
gl(5, 4, labels = c("Juliana","Carlos","Lina","Manuela","Adriana"),ordered = T)
```

```
##  [1] Juliana Juliana Juliana Juliana Carlos  Carlos  Carlos  Carlos  Lina   
## [10] Lina    Lina    Lina    Manuela Manuela Manuela Manuela Adriana Adriana
## [19] Adriana Adriana
## Levels: Juliana < Carlos < Lina < Manuela < Adriana
```

```r
gl(3,2,18)
```

```
##  [1] 1 1 2 2 3 3 1 1 2 2 3 3 1 1 2 2 3 3
## Levels: 1 2 3
```

```r
gl(3,4,24,labels = c("Chicles","Cigarrillos","Tinto"))
```

```
##  [1] Chicles     Chicles     Chicles     Chicles     Cigarrillos Cigarrillos
##  [7] Cigarrillos Cigarrillos Tinto       Tinto       Tinto       Tinto      
## [13] Chicles     Chicles     Chicles     Chicles     Cigarrillos Cigarrillos
## [19] Cigarrillos Cigarrillos Tinto       Tinto       Tinto       Tinto      
## Levels: Chicles Cigarrillos Tinto
```

```r
gl(3,1,24,labels = c("Chicles","Cigarrillos","Tinto"))
```

```
##  [1] Chicles     Cigarrillos Tinto       Chicles     Cigarrillos Tinto      
##  [7] Chicles     Cigarrillos Tinto       Chicles     Cigarrillos Tinto      
## [13] Chicles     Cigarrillos Tinto       Chicles     Cigarrillos Tinto      
## [19] Chicles     Cigarrillos Tinto       Chicles     Cigarrillos Tinto      
## Levels: Chicles Cigarrillos Tinto
```

```r
expand.grid(a=c(60,80), p=c(100, 300), sexo=c("Macho", "Hembra"))
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["a"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["p"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["sexo"],"name":[3],"type":["fctr"],"align":["left"]}],"data":[{"1":"60","2":"100","3":"Macho"},{"1":"80","2":"100","3":"Macho"},{"1":"60","2":"300","3":"Macho"},{"1":"80","2":"300","3":"Macho"},{"1":"60","2":"100","3":"Hembra"},{"1":"80","2":"100","3":"Hembra"},{"1":"60","2":"300","3":"Hembra"},{"1":"80","2":"300","3":"Hembra"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

```r
expand.grid(edad=seq(18,30,by=3), nota=(seq_len(5)/2)+2,
            color=gl(3,1,labels = c("Rojo","Verde","Blanco")),
            profesion=c("Ingeniero","Arquitecto"))
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["edad"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["nota"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["color"],"name":[3],"type":["fctr"],"align":["left"]},{"label":["profesion"],"name":[4],"type":["fctr"],"align":["left"]}],"data":[{"1":"18","2":"2.5","3":"Rojo","4":"Ingeniero"},{"1":"21","2":"2.5","3":"Rojo","4":"Ingeniero"},{"1":"24","2":"2.5","3":"Rojo","4":"Ingeniero"},{"1":"27","2":"2.5","3":"Rojo","4":"Ingeniero"},{"1":"30","2":"2.5","3":"Rojo","4":"Ingeniero"},{"1":"18","2":"3.0","3":"Rojo","4":"Ingeniero"},{"1":"21","2":"3.0","3":"Rojo","4":"Ingeniero"},{"1":"24","2":"3.0","3":"Rojo","4":"Ingeniero"},{"1":"27","2":"3.0","3":"Rojo","4":"Ingeniero"},{"1":"30","2":"3.0","3":"Rojo","4":"Ingeniero"},{"1":"18","2":"3.5","3":"Rojo","4":"Ingeniero"},{"1":"21","2":"3.5","3":"Rojo","4":"Ingeniero"},{"1":"24","2":"3.5","3":"Rojo","4":"Ingeniero"},{"1":"27","2":"3.5","3":"Rojo","4":"Ingeniero"},{"1":"30","2":"3.5","3":"Rojo","4":"Ingeniero"},{"1":"18","2":"4.0","3":"Rojo","4":"Ingeniero"},{"1":"21","2":"4.0","3":"Rojo","4":"Ingeniero"},{"1":"24","2":"4.0","3":"Rojo","4":"Ingeniero"},{"1":"27","2":"4.0","3":"Rojo","4":"Ingeniero"},{"1":"30","2":"4.0","3":"Rojo","4":"Ingeniero"},{"1":"18","2":"4.5","3":"Rojo","4":"Ingeniero"},{"1":"21","2":"4.5","3":"Rojo","4":"Ingeniero"},{"1":"24","2":"4.5","3":"Rojo","4":"Ingeniero"},{"1":"27","2":"4.5","3":"Rojo","4":"Ingeniero"},{"1":"30","2":"4.5","3":"Rojo","4":"Ingeniero"},{"1":"18","2":"2.5","3":"Verde","4":"Ingeniero"},{"1":"21","2":"2.5","3":"Verde","4":"Ingeniero"},{"1":"24","2":"2.5","3":"Verde","4":"Ingeniero"},{"1":"27","2":"2.5","3":"Verde","4":"Ingeniero"},{"1":"30","2":"2.5","3":"Verde","4":"Ingeniero"},{"1":"18","2":"3.0","3":"Verde","4":"Ingeniero"},{"1":"21","2":"3.0","3":"Verde","4":"Ingeniero"},{"1":"24","2":"3.0","3":"Verde","4":"Ingeniero"},{"1":"27","2":"3.0","3":"Verde","4":"Ingeniero"},{"1":"30","2":"3.0","3":"Verde","4":"Ingeniero"},{"1":"18","2":"3.5","3":"Verde","4":"Ingeniero"},{"1":"21","2":"3.5","3":"Verde","4":"Ingeniero"},{"1":"24","2":"3.5","3":"Verde","4":"Ingeniero"},{"1":"27","2":"3.5","3":"Verde","4":"Ingeniero"},{"1":"30","2":"3.5","3":"Verde","4":"Ingeniero"},{"1":"18","2":"4.0","3":"Verde","4":"Ingeniero"},{"1":"21","2":"4.0","3":"Verde","4":"Ingeniero"},{"1":"24","2":"4.0","3":"Verde","4":"Ingeniero"},{"1":"27","2":"4.0","3":"Verde","4":"Ingeniero"},{"1":"30","2":"4.0","3":"Verde","4":"Ingeniero"},{"1":"18","2":"4.5","3":"Verde","4":"Ingeniero"},{"1":"21","2":"4.5","3":"Verde","4":"Ingeniero"},{"1":"24","2":"4.5","3":"Verde","4":"Ingeniero"},{"1":"27","2":"4.5","3":"Verde","4":"Ingeniero"},{"1":"30","2":"4.5","3":"Verde","4":"Ingeniero"},{"1":"18","2":"2.5","3":"Blanco","4":"Ingeniero"},{"1":"21","2":"2.5","3":"Blanco","4":"Ingeniero"},{"1":"24","2":"2.5","3":"Blanco","4":"Ingeniero"},{"1":"27","2":"2.5","3":"Blanco","4":"Ingeniero"},{"1":"30","2":"2.5","3":"Blanco","4":"Ingeniero"},{"1":"18","2":"3.0","3":"Blanco","4":"Ingeniero"},{"1":"21","2":"3.0","3":"Blanco","4":"Ingeniero"},{"1":"24","2":"3.0","3":"Blanco","4":"Ingeniero"},{"1":"27","2":"3.0","3":"Blanco","4":"Ingeniero"},{"1":"30","2":"3.0","3":"Blanco","4":"Ingeniero"},{"1":"18","2":"3.5","3":"Blanco","4":"Ingeniero"},{"1":"21","2":"3.5","3":"Blanco","4":"Ingeniero"},{"1":"24","2":"3.5","3":"Blanco","4":"Ingeniero"},{"1":"27","2":"3.5","3":"Blanco","4":"Ingeniero"},{"1":"30","2":"3.5","3":"Blanco","4":"Ingeniero"},{"1":"18","2":"4.0","3":"Blanco","4":"Ingeniero"},{"1":"21","2":"4.0","3":"Blanco","4":"Ingeniero"},{"1":"24","2":"4.0","3":"Blanco","4":"Ingeniero"},{"1":"27","2":"4.0","3":"Blanco","4":"Ingeniero"},{"1":"30","2":"4.0","3":"Blanco","4":"Ingeniero"},{"1":"18","2":"4.5","3":"Blanco","4":"Ingeniero"},{"1":"21","2":"4.5","3":"Blanco","4":"Ingeniero"},{"1":"24","2":"4.5","3":"Blanco","4":"Ingeniero"},{"1":"27","2":"4.5","3":"Blanco","4":"Ingeniero"},{"1":"30","2":"4.5","3":"Blanco","4":"Ingeniero"},{"1":"18","2":"2.5","3":"Rojo","4":"Arquitecto"},{"1":"21","2":"2.5","3":"Rojo","4":"Arquitecto"},{"1":"24","2":"2.5","3":"Rojo","4":"Arquitecto"},{"1":"27","2":"2.5","3":"Rojo","4":"Arquitecto"},{"1":"30","2":"2.5","3":"Rojo","4":"Arquitecto"},{"1":"18","2":"3.0","3":"Rojo","4":"Arquitecto"},{"1":"21","2":"3.0","3":"Rojo","4":"Arquitecto"},{"1":"24","2":"3.0","3":"Rojo","4":"Arquitecto"},{"1":"27","2":"3.0","3":"Rojo","4":"Arquitecto"},{"1":"30","2":"3.0","3":"Rojo","4":"Arquitecto"},{"1":"18","2":"3.5","3":"Rojo","4":"Arquitecto"},{"1":"21","2":"3.5","3":"Rojo","4":"Arquitecto"},{"1":"24","2":"3.5","3":"Rojo","4":"Arquitecto"},{"1":"27","2":"3.5","3":"Rojo","4":"Arquitecto"},{"1":"30","2":"3.5","3":"Rojo","4":"Arquitecto"},{"1":"18","2":"4.0","3":"Rojo","4":"Arquitecto"},{"1":"21","2":"4.0","3":"Rojo","4":"Arquitecto"},{"1":"24","2":"4.0","3":"Rojo","4":"Arquitecto"},{"1":"27","2":"4.0","3":"Rojo","4":"Arquitecto"},{"1":"30","2":"4.0","3":"Rojo","4":"Arquitecto"},{"1":"18","2":"4.5","3":"Rojo","4":"Arquitecto"},{"1":"21","2":"4.5","3":"Rojo","4":"Arquitecto"},{"1":"24","2":"4.5","3":"Rojo","4":"Arquitecto"},{"1":"27","2":"4.5","3":"Rojo","4":"Arquitecto"},{"1":"30","2":"4.5","3":"Rojo","4":"Arquitecto"},{"1":"18","2":"2.5","3":"Verde","4":"Arquitecto"},{"1":"21","2":"2.5","3":"Verde","4":"Arquitecto"},{"1":"24","2":"2.5","3":"Verde","4":"Arquitecto"},{"1":"27","2":"2.5","3":"Verde","4":"Arquitecto"},{"1":"30","2":"2.5","3":"Verde","4":"Arquitecto"},{"1":"18","2":"3.0","3":"Verde","4":"Arquitecto"},{"1":"21","2":"3.0","3":"Verde","4":"Arquitecto"},{"1":"24","2":"3.0","3":"Verde","4":"Arquitecto"},{"1":"27","2":"3.0","3":"Verde","4":"Arquitecto"},{"1":"30","2":"3.0","3":"Verde","4":"Arquitecto"},{"1":"18","2":"3.5","3":"Verde","4":"Arquitecto"},{"1":"21","2":"3.5","3":"Verde","4":"Arquitecto"},{"1":"24","2":"3.5","3":"Verde","4":"Arquitecto"},{"1":"27","2":"3.5","3":"Verde","4":"Arquitecto"},{"1":"30","2":"3.5","3":"Verde","4":"Arquitecto"},{"1":"18","2":"4.0","3":"Verde","4":"Arquitecto"},{"1":"21","2":"4.0","3":"Verde","4":"Arquitecto"},{"1":"24","2":"4.0","3":"Verde","4":"Arquitecto"},{"1":"27","2":"4.0","3":"Verde","4":"Arquitecto"},{"1":"30","2":"4.0","3":"Verde","4":"Arquitecto"},{"1":"18","2":"4.5","3":"Verde","4":"Arquitecto"},{"1":"21","2":"4.5","3":"Verde","4":"Arquitecto"},{"1":"24","2":"4.5","3":"Verde","4":"Arquitecto"},{"1":"27","2":"4.5","3":"Verde","4":"Arquitecto"},{"1":"30","2":"4.5","3":"Verde","4":"Arquitecto"},{"1":"18","2":"2.5","3":"Blanco","4":"Arquitecto"},{"1":"21","2":"2.5","3":"Blanco","4":"Arquitecto"},{"1":"24","2":"2.5","3":"Blanco","4":"Arquitecto"},{"1":"27","2":"2.5","3":"Blanco","4":"Arquitecto"},{"1":"30","2":"2.5","3":"Blanco","4":"Arquitecto"},{"1":"18","2":"3.0","3":"Blanco","4":"Arquitecto"},{"1":"21","2":"3.0","3":"Blanco","4":"Arquitecto"},{"1":"24","2":"3.0","3":"Blanco","4":"Arquitecto"},{"1":"27","2":"3.0","3":"Blanco","4":"Arquitecto"},{"1":"30","2":"3.0","3":"Blanco","4":"Arquitecto"},{"1":"18","2":"3.5","3":"Blanco","4":"Arquitecto"},{"1":"21","2":"3.5","3":"Blanco","4":"Arquitecto"},{"1":"24","2":"3.5","3":"Blanco","4":"Arquitecto"},{"1":"27","2":"3.5","3":"Blanco","4":"Arquitecto"},{"1":"30","2":"3.5","3":"Blanco","4":"Arquitecto"},{"1":"18","2":"4.0","3":"Blanco","4":"Arquitecto"},{"1":"21","2":"4.0","3":"Blanco","4":"Arquitecto"},{"1":"24","2":"4.0","3":"Blanco","4":"Arquitecto"},{"1":"27","2":"4.0","3":"Blanco","4":"Arquitecto"},{"1":"30","2":"4.0","3":"Blanco","4":"Arquitecto"},{"1":"18","2":"4.5","3":"Blanco","4":"Arquitecto"},{"1":"21","2":"4.5","3":"Blanco","4":"Arquitecto"},{"1":"24","2":"4.5","3":"Blanco","4":"Arquitecto"},{"1":"27","2":"4.5","3":"Blanco","4":"Arquitecto"},{"1":"30","2":"4.5","3":"Blanco","4":"Arquitecto"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

## Números aleatorios

`R` posee una colección de funciones para generar números aleatorios dependiendo una probabilidad específica, o bien que pertenezcan a una distribución de probabilidad.

* `sample()` genera números aleatorios
* `rnorm(n, mean, sd)` números aleatorios de la distribución Normal
* `rexp(n, rate)` números aleatorios de la distribución Exponencial
* `rgamma(n, shape, scale)` números aleatorios de la distribución Gamma
* `rpois(n, lambda)` números aleatorios de la distribución Poisson
* `rweibull(n, shape, scale)` números aleatorios de la distribución Weibull
* `rcauchy(n, location, scale)` números aleatorios de la distribución Cauchy
* `rbeta(n, shape1, shape2)` números aleatorios de la distribución Beta
* `rt(n, df)` números aleatorios de la distribución *t-Student*
* `rf(n, df1, df2)` números aleatorios de la distribución Fisher-Snedecor (F)
* `rchisq(n, df)` números aleatorios de la distribución Pearson ($\chi^2_v$)
* `rbinom(n, size, prob)` números aleatorios de la distribución Binomial
* `rgeom(n, prob)` números aleatorios de la distribución Geométrica
* `rhyper(nn, m, n, k)` números aleatorios de la distribución Hipergeométrica
* `rlogis(n, location, scale)` números aleatorios de la distribución Logística
* `rlnorm(n, meanlog, sdlog)` números aleatorios de la distribución Log-Normal
* `rnbinom(n, size, prob)` números aleatorios de la distribución Binomial Negativa
* `runif(n, min, max)` números aleatorios de la distribución Uniforme

La posibilidad de generar datos aleatorios es bastante útil en estadística y `R` tiene la capacidad de hacer esto para un gran numero de funciones y distribuciones. Estas funciones son de la forma `rfunc(n, p1, p2, ...)`, donde `func` indica la distribución, `n` es el numero de datos generado, y `p1`, `p2`, `...` son valores que toman los parámetros de la distribución. La lista anterior muestra los detalles de cada distribución, y los posibles valores por defecto de los parámetros (si no se indica, significa que el parámetro debe ser especificado por el usuario).

Todas estas funciones se pueden usar reemplazando la letra `r` con las letras `d`, `p` o `q` para obtener, la **densidad de probabilidad** (`dfunc(x, ...)`), la **densidad de probabilidad acumulada** (`pfunc(x, ...)`), y el **valor del cuartil** (`qfunc(p, ...)`, con `0 < p < 1`) respectivamente.

## <a href="../EAFIT.html" class="btn" role="button">Regresar</a>
