library(readr)
library(ggplot2)
library(labelled)

maths <- read_csv("Maths.csv")
Portuguese <- read_csv("Portuguese.csv")

    ####Introduction####

#Ces donn�es portent sur les r�sultats des �l�ves dans l'enseignement 
#secondaire de deux �coles portugaises. Les attributs des donn�es 
#comprennent les notes des �l�ves, les caract�ristiques d�mographiques, 
#sociales et scolaires, et ont �t� collect�s � l'aide de rapports et de 
#questionnaires scolaires. Deux ensembles de donn�es sont fournis concernant
#les performances dans deux mati�res distinctes : Les math�matiques (mat) et
#la langue portugaise (por). 

N1 <- nrow(maths)
N2 <- nrow(Portuguese)
#Pour la base de donnee maths, il y a 395 observations et 33 variables.
#Pour la base de donnee portuguese, il y a 649 observations et 33 variables identiques avec la 1ere bdd. 

fulldt<-bind_rows(maths, Portuguese)
nrow(fulldt)
str(fulldt)
#

    #### I. Visualisation des donnees####

#FAIRE PRESENTATION GENERALE DES VARIABLES AVEC GRAPH

    # a) Ecole
aggregate (x = maths$school,
           by = list(maths$school),
           FUN = length
)

    #b) sexe
maths_sex_n <- aggregate (x = maths$sex,
           by = list(maths$sex),
           FUN = length
)


summary(maths)
summary(Portuguese)
#Faire description des variables 

table(maths$sex)

#Savoir nombre de r�sultat par variable, ex sexe =2 (h et f)
#...

ggplot(data=maths, aes(x=sex)) + geom_bar()


table(maths$school)
table(Portuguese$school)

#PARTIE VISUALISATION
#barre, barplot, plot

table(fulldt$sex, fulldt$age)
ggplot(fulldt, aes(fulldt$age)) + 
  geom_bar()

ggplot(fulldt, aes(fulldt$sex),) + 
  geom_bar()
