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
│   ├── preparation.qmd               : carga, exploración por ola y construcción de bases agrupadas
│   ├── analysis_regresiones.qmd      : regresiones de interés político y voto
│   ├── analysis_did_2x2.qmd          : diferencia en diferencias 2x2 (interés político)
│   ├── analysis_did_interes.qmd      : diferencia en diferencias escalonada (interés político)
│   ├── analysis_did_interes_ext.qmd  : olas 77 a 96 y estudio de eventos (interés político)
│   └── analysis_ponderado.qmd        : ponderación y diseño muestral
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

Para reproducir los resultados se renderiza el proyecto completo con `quarto render` desde la raíz. El orden de `_quarto.yml` respeta las dependencias: `preparation.qmd` genera las bases, `analysis_did_interes_ext.qmd` usa el modelo guardado por `analysis_did_interes.qmd` y la portada (`index.qmd`) lee los modelos guardados por los análisis.
