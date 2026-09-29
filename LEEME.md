# Control de Video por Cursor (192 Fotogramas)

Este proyecto convierte el video de la cafetería en fotogramas de alta resolución y permite interactuar con ellos mediante el cursor y scroll con una fluidez cinemática de 60-120 FPS.

## Instrucciones de uso rápido

1. **Método 1 (Recomendado)**: Haz doble clic en `iniciar.bat`.
   - Se abrirá automáticamente tu navegador con el visor local optimizado.
2. **Método 2**: Haz doble clic en `abrir_directo.bat` o arrastra `index.html` a cualquier navegador (Chrome, Edge, Firefox, Brave).

## Comportamiento:
- **Si bajas el cursor**: la animación avanza hacia adelante.
- **Si subes el cursor**: la animación retrocede.
- **Si te quedas quieto**: la animación se detiene exactamente en el fotograma actual.

## Modos incluidos en la interfaz:
1. **Posición del Cursor**: mapeo vertical de la ventana (arriba = inicio, abajo = fin).
2. **Velocidad del Cursor**: la velocidad de movimiento hacia abajo o arriba empuja la animación hacia adelante o atrás.
3. **Scroll / Rueda**: control estilo Apple landing page.

## Atajos de teclado:
- `Espacio`: Demo automática de ida y vuelta.
- `F`: Pantalla completa.
- `H`: Ocultar interfaz para ver solo la animación.
- `1`, `2`, `3`: Cambiar entre modos de interacción.
- `Flechas`: Avanzar / retroceder fotograma a fotograma.
