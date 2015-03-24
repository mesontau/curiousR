
set.seed(254)

# Hacemos un data frame chorras con tres columnas, una de ellas ("fac") contiene letras A,B,C al azar
L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
d <- data.frame(x = 1, y = 1:10, fac = fac)
d[sample(1:10, size=3), ]$fac <- NA  # Metemos 3 NA al azar en la columna fac... Echa un vistazo a fac ahora

# filtramos para contar cuantas letras C tenemos
print ( d[d$fac=="C",] )  # Alucina, vecina!!!

# Claro, cuentas las filas sin mirar esto, y te salen las "C" mas los NA!
nrow ( d[d$fac=="C",])

# Forma "correcta" seg??n R para filtrar cuando tienes NA's
which( d$fac == "C")
length(which( d$fac == "C" ))

# Y yo sigo flipando... ??me cambio a Matlab!


# Bueno, vamos a ver si con el paquete dplyr lo hace bien...
if(!require(dplyr)) { install.packages("dplyr") ; library(dplyr) }

onlyCs <- filter(d, fac == "C")
print (nrow(onlyCs))  # Bien!! Esto funciona!!

# ... pero tambien creo que el paquete dplyr me ha hecho cagarla en el proyecto del getting and cleaning data
# aqui hay que saber latin!

