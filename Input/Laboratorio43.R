# Hecho con gusto por Leislie R. Manjarrez O.

# Laboratorio 43- Mapa de calor termico con pheatmap
# DATOS GENETICOS TOMADOS DE Sahir Bhatnagar.
# PRACTICA DE CODERS

# Objetivo: Realizar un heatmap con datos geneticos 
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotetica de datos y dataframes adicionales
# 2. Realizar varios heatmaps

# Un mapa de calor es una representacion grafica de datos que utiliza un sistema de 
# codificacion de colores para representar diferentes valores


# Primero instalar la paquetería y llamar a la libreria
install.packages("pheatmap")
library(pheatmap)

# Importar datos para realizar el laboratorio. Para este caso son 3 archivos a utilizar
file.choose()

# Creamos un objeto con estructura matricial con el primer archivo
genes <- as.matrix(read.csv("C:\\Users\\leisl\\OneDrive\\Doctorado\\Semestre-3\\Temas-Selectos-1-Complejidad-Económica\\Modulo3\\Semana7-Labs-Salas-Cápsulas\\Lab43\\heatmap_data.csv", 
                            sep = ",",
                            header = T,
                            row.names = 1))

# Realizamos lo mismo con el segundo archivo, solo que no se crea como matriz el objeto
annotation_col <- read.csv ("C:\\Users\\leisl\\OneDrive\\Doctorado\\Semestre-3\\Temas-Selectos-1-Complejidad-Económica\\Modulo3\\Semana7-Labs-Salas-Cápsulas\\Lab43\\annotation_col.csv", 
                            header = T,
                            row.names = 1)

# Realizamos lo mismo con el segundo archivo, solo que no se crea como matriz el objeto
annotation_row <- read.csv ("C:\\Users\\leisl\\OneDrive\\Doctorado\\Semestre-3\\Temas-Selectos-1-Complejidad-Económica\\Modulo3\\Semana7-Labs-Salas-Cápsulas\\Lab43\\annotation_row.csv", 
                            header = T,
                            row.names = 1)
# Visualimos los objetos creados
head(annotation_col)
head(annotation_row)
head(genes)

# Generar el grafico con pheatmap. Es importante señalar que los clusters (dendrogramas) se generan de forma automática
pheatmap(genes)


# Cambiar el tamaño de la fuente
pheatmap(genes, frontsize = 6)


# Por default R clustea los renglores, en este caso los genes estan en los reglones y es lo que clustea
# Para quitar el dendrograma de los pacientes (eje de la x) utilizamos las siguientes instrucciones
pheatmap(genes, frontsize = 6, cluster_rows = T, cluster_cols = F)

# Como práctica ahora hacemos lo contrario, eliminamos los genes (eje de la y) dejando a los pacientes
pheatmap(genes, frontsize = 6, cluster_rows = F, cluster_cols = T)

# Para regresar al grafico original
pheatmap(genes, frontsize = 6, cluster_rows = T, cluster_cols = T)

# Para ver patrones subyacentes a las anotaciones de los renglones
pheatmap(genes, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row)

# Para ver patrones subyacentes a las anotaciones de los renglones y las columnas
pheatmap(genes, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, 
         annotation_col = annotation_col)

# Para quitar dendrogramas y colocar un título
pheatmap(genes, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, 
         annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética")

# Para extraer datos de forma específico (un subconjunto de la totalidad), se crea objeto con ciertas caracteristicas
sub <- genes [c(1:5, 55:60), c(1:5, 20:35, 55:60)]

# Para graficar el nuevo objeto o subconjunto de datos reciclamos el codigo y solo cambiamos genes por sub
pheatmap(sub, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, 
         annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética")

# Para aumentar el tamano de las columnas sea mayor, no aparezca la anotacion de las leyendas y desplegar los número dando un tamano
pheatmap(sub, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, 
         treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética", fontsize = 8, annotation_legend = FALSE, 
         display_numbers = TRUE, fontsize_number = 6)

# Para cambiar color llamar la paqueteria de viridis
library(viridis)

# Reciclamos codigo anterior y con viridis llamamos a la opcion plasma, magma, viridis, inferno
pheatmap(sub, frontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, 
         treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética", fontsize = 8, annotation_legend = FALSE, 
         display_numbers = TRUE, fontsize_number = 6, col = viridis_pal(option = "inferno") (6))

# Para visualizar la distancia entre los genes
dist(sub)

# Para identificar el mapa de calor de la correlacion de los datos en este caso de los pacientes
pheatmap(cor(sub))

# Generamos un objeto con la matriz transpuesta y generamos mapa genes y no pacientes
trans <- t(sub)
pheatmap(cor(trans))

