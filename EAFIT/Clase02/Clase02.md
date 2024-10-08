---
title: "Estructuras de datos en R"
author: "Cristian Santa"
output:
  rmdformats::readthedown:
    df_print: paged
    code_folding: show
    highlight: tango
    keep_md: yes
---



## Funciones útiles en R

* `str()`: muestra la estructura interna de cualquier objeto.
* `names()`: muestra los nombres de los elementos de un objeto.
* `class()`: clase interna de un objeto R.
* `mode()` y `typeof()`: tipo de almacenamiento.
* `print()`: imprimir en consola cualquier objeto.
* `help()`: sistema de ayuda en R
* `lenght()`: dimensión de vectores o listas.
* `dim()`: dimensión de arreglos o matrices.
* `ls()`: lista de objetos guardados en memoria.
* `rm()`: remover objetos almacenados.
* `attach()`: guarda en la memoria los nombres de las variables de una base de datos para llamarlas directamente.
* `detach()`: elimina de la memoria los nombres de las variables de una base de datos.
* `sessionInfo()`: información del R y paquetes cargados.

## Tipo y clases atómicos

* Numéricos (`numeric`)
* Enteros (`integer`)
* Complejos (`complex`)
* lógicos (`logical`)
* Carácter (`character`)
* Factor (`factor`)
* Valor ausente (`NA`)
* valor no definido (`NaN`)
* Vectores (`vector`)
* Matrices (`matrix`)
* Arreglo (`array`)
* Listas (`list`)
* Base de datos (`data.frame`)

### Ejemplo


```r
# Numéricos
x <- 10.5      # Asigna un número con punto decimal.
x              # Muestra el contenido del objeto x.
class(x)       # Muestra la clase del objeto x.
typeof(x)      # Tipo genérico interno del R.
storage.mode(x) # Modo de almacenamientos específico para exportar de R.

y <- 10        # En general los números son reales.
y
class(y)
typeof(y)
storage.mode(y)
is.integer(y)

# Enteros
y <- as.integer(3) 
y              
class(y)  
typeof(y)
storage.mode(y)

w <- 4L
w              
class(w)  
typeof(w)
storage.mode(w)

# verificación y coerción
is.integer(y)  
as.integer(3.14)
as.integer("5.27")
as.integer("Joe")
as.integer(TRUE)
as.integer(FALSE)

# Complejos
z <- 1 + 2i 
z          
class(z)   
typeof(z)

sqrt(-4) 
sqrt(-4+0i)
sqrt(as.complex(-4)) 

# Lógicos (booleanos)
x <- 1; y <- 2   
z <- x > y      
z
class(z)
typeof(z)

u <- TRUE; v <- FALSE 
u & v
u | v
!u
help("&")

# verificación y remoción en memoria
ls()
rm(z)
ls()
rm(x,w)
ls()
```

## Vectores y matrices

* `c()`: concatenar valores.
* `matrix()`: construir matrices.
* `array()`: construir arreglos multidimensionales.
* `list()`: construir una lista de objetos.
* `vector()`: contruir objetos vacíos.
* `cbind()`: combinar matrices por columna.
* `rbind()`: combinar matrices por fila.

### Operaciones con vectores y matrices

* Suma vectorial y matricial uno a uno (`+`,`-`)
* Multiplicación y división uno a uno (`*`, `/`)
* Producto punto o producto entre matrices (`%*%`)
* Producto exterior(`%o%`)
* Produto Kronecker o tensor (`%x%`)
* `t()`: Transpuesta de una matriz
* `solve()`: inversa de una matriz
* `solve(m,n)`: solución lineal `m*x=n`
* `diag()`: construir matrices diagonales
* `colSums()`: suma las columnas de una matriz
* `rowSums()`: suma las filas de una matriz
* `colMeans()`: promedio de las columnas de una matriz
* `rowMeans()`: promedio de las filas de una matriz
* `ncol()`: número de columnas de una matriz o `data.frame`
* `nrow()`: numero de filas de una matriz o `data.frame`

### Coerción de objetos

En algunas ocasiones se tiene mezclas de tipos de datos en una matriz o vector, o cambiar el objeto de un tipo a otro. Este tipo de cambios se puede realizar si redefinir el objeto, simplemente coercionando los valores a lo que se necesita.

* `as.numeric()`: convertir todo a número
* `as.integer()`: convertir todo a entero
* `as.character()`: convertir todo a caracter/sarta
* `as.factor()`: convertir todo a un factor
* `as.matrix()`: convertir elementos a una matriz
* `as.list()`: convertir elementos a lista
* `as.data.frame()`: convertir elementos a un `data.frame`

### Ejemplos vectores & matrices


```r
# Vectores
v1 <- c(2, 3, 5) 
class(v1)
typeof(v1)

v2 <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
class(v2)
typeof(v2)

v3 <-  c("aa", "bb", "cc", "dd", "ee") 
class(v3)
typeof(v3)

n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
c(n, s) 

a <- c(1, 3, 5, 7) 
b <- c(1, 2, 4, 8)

5 * a
a + b 
a - b 
a * b 
a / b

u <- c(10, 20, 30) 
v <- c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
u + v

s <- c("aa", "bb", "cc", "dd", "ee") 
s[3]
s[-3] 
s[10]
s[c(2, 3)]
s[c(2, 3, 3)]
s[c(2, 1, 3)] 
s[2:4]

help(":")

L <- c(FALSE, TRUE, FALSE, TRUE, FALSE) 
s[L] 
s[c(FALSE, TRUE, FALSE, TRUE, FALSE)] 

v <- c("Ramiro", "Gladys") 
v 
names(v) <- c("Primera", "Última") 
v
v["Primera"]
v[c("Última", "Primera")]

# Funciones útiles con vectores
length(v)

# Factores
colores <- c('verde','verde','amarillo','rojo','rojo','rojo','verde')
class(colores)
typeof(colores)

factor_colores <- factor(colores)
print(factor_colores)
print(levels(factor_colores))
print(nlevels(factor_colores))

class(factor_colores)
typeof(factor_colores)

meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses)
meses
as.integer(meses)

meses <- factor(meses, levels = c("enero", "febrero", "abril"))
meses
as.integer(meses)

meses <- factor(meses, labels  = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

# ¿Porqué este código es un problema?
meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses, labels = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

# Una mejor forma
meses <- c("enero", "enero", "febrero", "abril", "abril", "abril")
meses <- factor(meses, levels = c("enero", "febrero", "abril"),
                labels = c("Enero", "Febrero", "Abril"))
meses
as.integer(meses)

# Matrices
A <- matrix(c(2, 4, 3, 1, 5, 7), nrow=2, ncol=3, byrow = TRUE)        
A
A[2, 3]
A[2, ] 
A[, 3]
dimnames(A) = list( 
     c("fila1", "fila2"),        
     c("col1", "col2", "col3"))
A
A["fila2","col3"]

B <- matrix(c(2, 4, 3, 1, 5, 7), nrow=3, ncol=2) 
B
t(B)

C <- matrix(c(7, 4, 2), nrow=3, ncol=1) 
C 
cbind(B, C)

D <- matrix(c(6, 2), nrow=1,  ncol=2) 
D 
rbind(B, D) 
c(B) 

A*B
A*5
B%*%C
t(B)%*%C
solve(cbind(B,C))
cbind(B,C)%*%solve(cbind(B,C))
A%o%B
A%x%B
B%o%A
B%x%A

# Listas
n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
b <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x <- list(n, s, b, 3)
 
x[2]
x[c(2, 4)]
x[[2]]
x[[2]] <- "ta"
x
s
v <- list(numeros=c(2, 3, 5), nombres=c("aa", "bb")) 
v 
v["numeros"]
v[c("nombres", "numeros")]
v[["numeros"]]
v$numeros

attach(v)
numeros
detach(v)


# Bases de datos (data.frames)
n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc") 
b <- c(TRUE, FALSE, TRUE) 
df <- data.frame(n, s, b)

mtcars
mtcars[1, 2]
mtcars["Mazda RX4", "cyl"]

head(mtcars) # primeras filas
tail(mtcars) # ultimas filas
mtcars[[9]]
mtcars[["am"]]
mtcars$am
mtcars[, "am"]
mtcars[1]
mtcars["mpg"]
mtcars[c("mpg", "hp")]
mtcars[24, ]
mtcars[c(3, 24), ]
mtcars["camaro Z28", ]
mtcars[c("Datsun 710", "Camaro Z28"), ]

L = mtcars$am == 0
L

mtcars[L, ]
mtcars[L, ]$mpg

# Problemas a evitar en el uso de los "data.frames"
mal <- data.frame(cbind(a = 1:2, b = c("a", "b")))
mal
str(mal)

bien1 <- data.frame(a = 1:2, b = c("a", "b"))
bien1
str(bien1)

bien2 <- data.frame(a = 1:2, b = c("a", "b"), stringsAsFactors = FALSE)
bien2
str(bien2)

# "Columnas" especiales en las bases de datos.
df <- data.frame(x = 1:3)
df$y <- list(1:2, 1:3, 1:4)
df
str(df)

# data.frame(x = 1:3, y = list(1:2, 1:3, 1:4)) # Se genera un error
dfl <- data.frame(x = 1:3, y = I(list(1:2, 1:3, 1:4)))
dfl
str(dfl)
dfl[2, "y"]

dfm <- data.frame(x = 1:3, y = I(matrix(1:9, nrow = 3)))
dfm
str(dfm)
dfm[2, "y"]
```

Se debe tener mucho cuidado al utilizar estas opciones en las bases de datos porque muchas funciones asumen que cada columa de una base de datos es de tipo atómico.

## Carácter y Sartas

* Separar con una nueva línea (Enter) (`'\n'`)
* Separar con un tabulador (`'\t'`)
* Separar con un espacio (`' '`)
* `paste()`: concatenar carárcter/sarta con espacio
* `paste0()`: concatenar carácter/sarta sin espacio
* `cat()`: concatenar e imprimir carácter/sarta

### Ejemplos carácter y sartas


```r
# Carácter y sarta
x <- as.character(3.141592) 
x 

class(x)
typeof(x)

nombres <- "Leonidas Argemiro"; apellido <- "Jaramillo" 
paste(nombres, apellido)
paste0(nombres, apellido)
cat(nombres,"\n",apellido)
cat(nombres,"\t",apellido)
cat(nombres," ",apellido)
cat(nombres," (1234) ",apellido)

sprintf("%s tiene %d pesos", "Julian", 100000)
substr("Mambrú se fue a la guerra", start=3, stop=12)
# sub("Mambrú", "Jose", "Mambrú se fue a la guerra")

help("sub")
?sub

paste("x", 1:5)
paste("x", 1:5, sep = '')
paste("x", 1:5)

cat("x", 1:5)
cat("x", 1:5, sep = '')

mensaje <- paste("Ejemplo de", "un mensaje", "con 'paste()'")
mensaje

mensaje <- paste("Ejemplo de", "un mensaje", 'con "paste()"')
mensaje
print(mensaje)
cat(mensaje)

cat("Otro ejemplo:\n", "con dos renglones")
paste("Otro ejemplo:\n", "con dos renglones")

mensaje2 <- paste("Otro ejemplo:\n", "con dos renglones")
mensaje2
print(mensaje2)
cat(mensaje2)
```

### Ejemplos finales


```r
a <- c(4, 2, 3, 0)
x <- c(4, 2, 3, 3, 2, 1, 2, 3)

x
sort(x)
rev(x)
sort(x,decreasing = F)

a + x
a - x
a / x
a * x
a ^ x
a %% x
a %/% x

a <- c(4, 2, 3, 0, 1)
x <- c(4, 2, 3, 3, 2, 1, 2, 3)

a + x
a - x
a / x
a * x
a ^ x
a %% x
a %/% x

exp(1)

options()

names(options())

options()$digits

options(digits = 16)
exp(1)
pi
sin(pi/6)
options(digits = 7)

optAnt <- options()
options(digits = 20)
pi
options(optAnt)
pi

x <- 10000
(1 + 1 / x) ^ x

y <- (1 + 1 / x)^x
y

(z <- (1 + 1 / x) ^ x)

# Producto interno
a %*% a

# Producto externo
a %o% a

# Con matrices
m1 <- matrix(1:6, 2, 3)
m1
m2 <- matrix(7:12, 3, 2)
m2

# m1 + m2 # Produce un error por dimensiones no compatibles
m1 + t(m2)
t(m1) + m2
m1 %*% m2
m2 %*% m1
```

## <a href="../EAFIT.html" class="btn" role="botton">Regresar</a>
