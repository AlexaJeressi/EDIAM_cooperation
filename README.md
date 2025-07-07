# EDIAM_cooperation
Este repositorio contiene los códigos y datos utilizados para simular escenarios de cooperación internacional en políticas climáticas, basados en el modelo EDIAM (Equity and Dynamic Integrated Assessment Model). El objetivo es analizar cómo diferentes políticas climáticas impactan el bienestar económico, las emisiones, el consumo, el PIB, los subsidios y los precios de la energía, diferenciando entre países desarrollados (Norte) y en desarrollo (Sur).

El modelo está basado en el trabajo de Molina et al. (2020), donde se integra la cooperación internacional y la equidad interregional en un marco de evaluación dinámica del cambio climático:

Molina, E., Saari, R., Wagner, F., & Füssel, H.-M. (2020). Equity and climate: An integrated assessment model with interregional redistribution. Frontiers in Robotics and AI, 7, 111. https://doi.org/10.3389/frobt.2020.00111

## Estructura del repositorio
├── Main.r                        # Script principal que ejecuta el modelo completo
├── visualizaciones.r            # Script para generar gráficas y análisis visual
├── Inputs/
│   ├── Ediam_vFrontiers.r.r     # Definición del motor del modelo (dinámicas principales)
│   ├── experimental.design.csv  # Diseño experimental para correr múltiples simulaciones
│   └── harness_processing.r     # Script para automatizar y manejar experimentos
├── Harness/
│   └── output_run.csv           # Salidas individuales de simulaciones 
├── Outputs/
│   ├── prim.data.csv            # Datos consolidados de todas las simulaciones
│   └── runs.models.csv          # Resumen de los modelos corridos y sus parámetros

