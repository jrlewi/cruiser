# cruiser
R package to help you keep track of your car's maintenance schedule

# Installation
if (!require("devtools")) install.packages("devtools")
devtools::install_github('https://github.com/jrlewi/cruiser', build_vignettes=TRUE)

#Attaching the package

library(cruiser)

# Vignette
The vignette guides you through creating your own maintenance report. 
vignette('Introduction', package='cruiser')
