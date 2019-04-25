setwd(choose.dir())
require(mvtnorm)
A11 <- rmvnorm(4380,mean=c(11,854),sigma = matrix(c(5,80,80,3000),2,2,byrow = T))
A12 <- rmvnorm(4380,mean=c(11,884),sigma = matrix(c(5,80,80,3000),2,2,byrow = T))
A13 <- rmvnorm(4380,mean=c(11,914),sigma = matrix(c(5,80,80,3000),2,2,byrow = T))
A14 <- rmvnorm(4380,mean=c(11,944),sigma = matrix(c(5,80,80,3000),2,2,byrow = T))

B11 <- rmvnorm(4380,mean=c(8,834),sigma = matrix(c(7,80,80,3000),2,2,byrow = T))
B12 <- rmvnorm(4380,mean=c(8,912),sigma = matrix(c(7,80,80,3000),2,2,byrow = T))
B13 <- rmvnorm(4380,mean=c(8,990),sigma = matrix(c(7,80,80,3000),2,2,byrow = T))
B14 <- rmvnorm(4380,mean=c(8,1068),sigma = matrix(c(7,80,80,3000),2,2,byrow = T))

C11 <- rmvnorm(4380,mean=c(13,912),sigma = matrix(c(8,80,80,3000),2,2,byrow = T))
C12 <- rmvnorm(4380,mean=c(13,995),sigma = matrix(c(8,80,80,3000),2,2,byrow = T))
C13 <- rmvnorm(4380,mean=c(13,1078),sigma = matrix(c(8,80,80,3000),2,2,byrow = T))
C14 <- rmvnorm(4380,mean=c(13,1161),sigma = matrix(c(8,80,80,3000),2,2,byrow = T))

datos <- rbind.data.frame(A11,A12,A13,A14,
                          B11,B12,B13,B14,
                          C11,C12,C13,C14)               
dimnames(datos)[[2]] <- c('PVuelos','PCosto')
datos$TPCosto <- datos$PVuelos*datos$PCosto
write.table(datos[,c(1,3)],file = "Vuelos.txt")

fechasA <- seq(from=strptime("2017-01-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),
               to=strptime("2018-12-31 23:00:00",format = "%Y-%m-%d %H:%M:%S"),
               by = "hour")
fechasC <- seq(from=strptime("2017-01-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),
               to=strptime("2018-12-31 23:00:00",format = "%Y-%m-%d %H:%M:%S"),
               by = "hour")
fechasB <- seq(from=strptime("2017-01-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),
               to=strptime("2018-12-31 23:00:00",format = "%Y-%m-%d %H:%M:%S"),
               by = "hour")
datos$Fecha <- c(fechasA,fechasB,fechasC)
datos$Aerolinea <- gl(3,17520,labels = LETTERS[1:3])
datos$semana <- factor(format(datos$Fecha,"%y-%U"))
datos$mes <- factor(format(datos$Fecha,"%y-%m"))
datos$dia <- factor(format(datos$Fecha,"%y-%m-%d"))
  
require(ggplot2)
require(lubridate)
d2 <- aggregate(TPCosto~semana+Aerolinea,datos,mean)
ggplot(d2,aes(x=as.numeric(semana),y=TPCosto,fill=Aerolinea,colour=Aerolinea))+
  geom_line(size=2)

require(plotly)
datos %>% plot_ly(x = ~PVuelos, y = ~PCosto,
                  color = ~Aerolinea, 
                  frame = ~as.numeric(dia), text = ~Aerolinea, 
                  hoverinfo = "text", type = 'scatter',
                  mode = 'markers')
