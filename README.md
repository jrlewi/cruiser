# cruiser

R package to help you keep track of your car's maintenance schedule

# Installation

devtools::install_github('https://github.com/jrlewi/cruiser',
                         build_opts = c("--no-resave-data", "--no-manual"))

# Attaching the package

library(cruiser)

# Vignette

The vignette guides you through creating your own maintenance report. 

vignette('cruiser_vignette', package='cruiser')
