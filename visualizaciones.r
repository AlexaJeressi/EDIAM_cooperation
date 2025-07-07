library(tidyverse)

# Carga el csv
df <- read.csv('Outputs/runs.models.csv')

# Gráfica 1. Concentración de C02 a lo largo del tiempo
# Comparación entre políticas a lo largo del tiempo 
df %>%
  filter(time <= 3000) %>%
  ggplot(aes(x = time, y = CO2.Concentration, color = policy.name)) +
  
  # Línea promedio por política
  stat_summary(fun = "mean", geom = "line", size = 1.2) +
  
  # Líneas punteadas de referencia
  geom_hline(yintercept = 450, linetype = "dashed", color = "darkgreen") + 
  geom_hline(yintercept = 1200, linetype = "dashed", color = "darkred") +
  
  # Títulos y leyenda
  labs(
    title = "Concentración de CO2 a lo largo del tiempo",
    subtitle = "Comparación entre políticas hasta el año 3000",
    x = "Año",
    y = "CO2 (ppm)",
    color = "Política"
  ) +
  
  # Estilo: leyenda abajo
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom")+
  guides(color = guide_legend(nrow = 2))



#Insight: Si encontramos mejor resultados con políticas cooperativas. 

# Gráfica 2: Diferencias en el PIB y el consumo entre los países desarrollados y en desarrollo. 
# Comparación entre políticas a largo del tiempo
df %>%
  filter(time <= 3000) %>%
  pivot_longer(cols = c(Y, Consumption), names_to = "variable", values_to = "value") %>%
  ggplot(aes(x = time, y = value, color = policy.name)) +
  
  # Línea promedio por política en caso de que existan varias pero solo tenemos una
  stat_summary(fun = "mean", geom = "line", size = 1.2) +
  
  # Facet por variable (Y o Consumo) y por región (N/S)
  facet_grid(variable ~ Region, scales = "free_y", 
             labeller = labeller(
               variable = c(Y = "PIB", Consumption = "Consumo"),
               Region = c(N = "Norte", S = "Sur")
             )) +
  
  # Etiquetas y estilo
  labs(
    title = "Evolución del PIB y el consumo en países desarrollados y en desarrollo",
    subtitle = "Comparación de políticas climáticas hasta el año 3000",
    x = "Año",
    y = NULL,
    color = "Política"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 2))



# Gráfica 3. Impacto climático en el bienestar económico en el sur global.
# Ver el daño climático 
df %>%
  filter(time <= 3000) %>%
  ggplot(aes(x = time, y = round(Cost.S.Damage*100,2), color = policy.name)) +
  stat_summary(fun = "mean", geom = "line", size = 1.2) +
  labs(
    title = "Impacto climático en el bienestar económico del Sur",
    subtitle = "Proporción de bienestar preservado bajo diferentes políticas (hasta el año 3000)",
    x = "Año",
    y = "% bienestar económico preservado",
    color = "Política"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "bottom",
    legend.box = "vertical"
  ) +
  guides(color = guide_legend(nrow = 2))




# Precios de la energía 
df %>%
  filter(time <= 3000) %>%
  pivot_longer(
    cols = c(Price.ce, Price.re),
    names_to = "TipoEnergia",
    names_pattern = "Price\\.(.*)",
    values_to = "Precio"
  ) %>%
  ggplot(aes(x = time, y = Precio, color = policy.name)) +
  stat_summary(fun = mean, geom = "line", size = 1.2) +
  facet_grid(TipoEnergia ~ Region, labeller = labeller(
    TipoEnergia = c("ce" = "Energía Convencional", "re" = "Energía Renovable"),
    Region = c("N" = "Norte", "S" = "Sur")
  )) +
  labs(
    title = "Índice relativo de precios de la energía a lo largo del tiempo",
    subtitle = "Comparación entre políticas climáticas por región y tipo de energía",
    x = "Año",
    y = "Índice de precio relativo",
    color = "Política"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "bottom") +
  guides(color = guide_legend(nrow = 2))

