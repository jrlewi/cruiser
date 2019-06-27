# cruiser

R package to help you keep track of your car's maintenance schedule.
The vignette gives an example of creating your maintenance report. 

# Install and view vignette

devtools::install_github('https://github.com/jrlewi/cruiser',
                         build_opts = c("--no-resave-data", "--no-manual"))

library(cruiser)

vignette('cruiser_vignette', package='cruiser')
