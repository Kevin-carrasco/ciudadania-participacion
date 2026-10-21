# Respaldo de análisis

Copia del proyecto al 10 de octubre de 2026, antes de reducir el sitio principal a interés político, voto y confianza en instituciones. Incluye todos los documentos de análisis de ese momento, entre ellos los de apoyo a la democracia y satisfacción con la democracia, junto con sus tablas, figuras, modelos y el sitio renderizado (`docs/`).

- `processing/`: documentos `.qmd` tal como estaban.
- `index.qmd` y `_quarto.yml`: portada y configuración del sitio en ese momento.
- `output/`: tablas, figuras y modelos generados (los `.rds` de `output/models/` contienen microdatos y no se versionan).
- `docs/`: sitio renderizado; se puede abrir `docs/index.html` en un navegador.
- `README_proyecto_original.md`: README del proyecto en ese momento.

Esta carpeta no forma parte del render del sitio principal. Los documentos usan rutas relativas a la raíz del proyecto (`input/` y `output/`), por lo que si se vuelven a renderizar escribirían sobre las salidas del proyecto principal.
