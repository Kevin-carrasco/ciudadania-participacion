# Educación ciudadana y participación electoral

Análisis del efecto de la asignatura de Educación Ciudadana y del Plan de Formación Ciudadana sobre la participación electoral y el interés político, con datos de la Encuesta CEP (olas 77 a 95).

La estructura de carpetas sigue el protocolo IPO (Input-Processing-Output) de análisis reproducibles del Laboratorio de Ciencia Social Abierta (LISA-COES): <https://lisa-coes.github.io/ipo/>

## Estructura

```
├── input: información de entrada
│   ├── data
│   │   ├── original : bases originales Encuesta CEP (.sav, .dta, .rds)
│   │   └── proc     : datos procesados (.rds)
│   ├── bib          : archivos de bibliografía
│   └── images       : imágenes externas
│
├── processing
│   ├── preparation.qmd : carga, exploración por ola y construcción de bases agrupadas
│   └── analysis.qmd    : modelos de voto 2021 e interés político
│
├── output: productos generados por el código
│   ├── graphs : figuras
│   ├── tables : tablas
│   └── models : muestras y modelos que usa la portada (.rds)
│
├── index.qmd     : portada del sitio
├── _quarto.yml   : configuración del proyecto Quarto
└── README.md
```

Para reproducir los resultados se renderiza el proyecto completo con `quarto render` desde la raíz; `preparation.qmd` debe ejecutarse antes que `analysis.qmd`.
