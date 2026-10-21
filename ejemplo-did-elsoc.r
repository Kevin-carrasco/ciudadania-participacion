library(car)

rm(list(ls()))

# Load the data
load("Elsoc_recode_2016-2021_wide.Rdata")
dim(el)

# Load data long
load("Elsoc_2016-2021_long.Rdata")
dim(ell)

# En Octubre de 2020 s realizó en Chile un Plebiscito Constitucional para votar a favor o en contra de la redacción de una nueva constitución.

# La relevancia y el carácter inédito de esta elección gatilla la pregunta acerca de posibles consecuencias de este proceso sobre los niveles, comparativamente altos, de desafección política que prevalecen en la sociedad chilena.

# Siguiendo a Anderson et. al (2006, *looser's Consent*), se hipotetiza que las personas que resultaron vencedores electorales en el plebiscito de octubre experimentaran un cambio positivo en los niveles de apoyo y afección hacia el sistema político.

# Para evaluar esta hipótesis, empleamos un modelo de diferencia en diferencias a datos ELSOC.

# El análisis se realizará dos veces: 1) usando la base de datos ELSOC en formato wide para los años 2019 y 2021; 2) usando la base elsoc en formato long entre los años 2016 y 2021.

#### Análisis en formato wide ####

pkg <- c("AER", "DRDID", "car", "plm", "lme4", "ggplot2", 
        "merTools", "texreg", "data.table")
lapply(pkg, require, character.only = TRUE)

#### Creación de variables e  índices ####

# ïndice de valoración del voto

el$voto_supp_w04 <- with(el, apply(cbind(VotaDebe_w04, VotoInfl_w04, VotaExpr_w04),
                                    1, mean, na.rm = TRUE))
el$voto_supp_w05 <- with(el, apply(cbind(VotaDebe_w05, VotoInfl_w05, VotaExpr_w05),
                                    1, mean, na.rm = TRUE))

# Índice de confianza política

el$polconf_w04 <- with(el, apply(cbind(confPart_w04, confCong_w04, confJudi_w04, confGob_w04),
                                    1, mean, na.rm = TRUE))
el$polconf_w05 <- with(el, apply(cbind(confPart_w05, confCong_w05, confJudi_w05, confGob_w05),
                                    1, mean, na.rm = TRUE))

# Vencedores electorales en plebiscito (Ola 5)
el$elec_winner_w05 <- 0
el$elec_winner_w05[el$recuento_voto_w05=="Apruebo"] <- 1
table(el$elec_winner_w05)

aggregate(cbind(satisdemo_w05, satisdemo_w04) ~ elec_winner_w05, data = subset(el, muestra==1),
            mean, na.rm = TRUE)

(2.073512-1.645274) - (2.051144-1.775236) # = 0.1523

## Parametrización: interacción implícita

coeftest(lm(satisdemo_w05 - satisdemo_w04 ~ elec_winner_w05, data = el, subset = muestra== 1), vcov = vcovHC)

coeftest(lm(voto_supp_w05 - voto_supp_w04 ~ elec_winner_w05, data = el, subset = muestra== 1), vcov = vcovHC)

coeftest(lm(polconf_w05 - polconf_w04 ~ elec_winner_w05, data = el, subset = muestra== 1), vcov = vcovHC)

### Análisis en formato long ####

ell <- as.data.table(ell)

## Creación de variables e índices ####

# Índice de valoración del voto

ell$voto_supp <- with(ell, apply(cbind(VotaDebe, VotoInfl, VotaExpr),
                                    1, mean, na.rm = TRUE))

# Índice de confianza política

ell$polconf <- with(ell, apply(cbind(confPart, confCong, confJudi, confGob),
                                    1, mean, na.rm = TRUE))

#wave numeric

