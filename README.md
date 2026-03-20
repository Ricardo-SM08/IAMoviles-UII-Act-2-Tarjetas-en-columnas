# myapp

### Ejemplo :
<img width="793" height="420" alt="image" src="https://github.com/user-attachments/assets/4bf82b7a-7a4f-46fd-8728-dd65f10a2b3f" />

<img width="1037" height="470" alt="image" src="https://github.com/user-attachments/assets/862701ec-e95d-45b7-b041-a1bd1d491dee" />

## Mi Prompt a IA (Ejemplo)
Una pantalla de aplicación móvil sencilla con una estética morado pastel. Barra de navegación superior (App bar) con un fondo morado claro (#CE93D8). Debajo de la barra, una lista vertical que contiene exactamente 3 tarjetas rectangulares grandes. Cada tarjeta tiene un fondo morado pastel suave (#E1BEE7), esquinas redondeadas y una ligera sombra exterior. Dentro de cada tarjeta: en el lado izquierdo, un espacio (placeholder) para una imagen con las esquinas izquierdas redondeadas. En el lado derecho de la tarjeta, una columna con 2 filas de texto: la primera fila es un Título en negrita color morado oscuro, y la segunda fila es un Subtítulo más pequeño en color morado medio. Asegura un espaciado igual y uniforme entre las 3 tarjetas.

## Diseño Ejemplo:

<img width="853" height="655" alt="image" src="https://github.com/user-attachments/assets/bb5f213d-ca61-4c8f-aa64-06578bb7dc51" />
<img width="336" height="578" alt="image" src="https://github.com/user-attachments/assets/c82e10c4-252c-4d49-9e22-587920b427d1" />




## Mi Prompt a IA (Negocio):


Actúa como un desarrollador experto en Flutter. Necesito recrear la interfaz principal (PantallaInicio) basándome en un boceto *wireframe*. 

Genera el código para el `body` del `Scaffold` utilizando un `SingleChildScrollView`. Dentro de este, la estructura debe ser una `Column` principal que contenga lo siguiente en orden vertical:

1. Un `Container` superior simulando una barra de búsqueda, con borde negro y un texto alineado a la izquierda.
2. Un widget `Row` (Fila 1) que contenga dos widgets `Expanded`. Dentro de cada `Expanded`, diseña una tarjeta usando un `Container` con un borde de color `Colors.deepPurple` de ancho 2. 
3. El contenido interno de cada tarjeta debe ser una `Column` que agrupe: un `Image.network` centrado en la parte superior, seguido de tres widgets `Row` pequeños debajo. Cada uno de estos `Row` pequeños debe contener un icono simulando una viñeta y un widget `Text`.
4. Debajo de la primera gran `Row`, coloca un widget `Center` que contenga un botón de texto con la palabra "Mas...". El botón debe estar envuelto en un `Container` con borde perimetral color `Colors.deepPurple`.
5. Un segundo widget `Row` (Fila 2) con exactamente la misma estructura interna que la Fila 1 (dos tarjetas envueltas en `Expanded` con diseño en `Column`), pero destinadas a mostrar imágenes de refacciones.
6. Asegúrate de usar `SizedBox` para mantener un espaciado uniforme entre las filas, las columnas internas y el botón.
<img width="509" height="711" alt="image" src="https://github.com/user-attachments/assets/7163e756-037f-4dc0-be13-8ebb5288be83" />
<img width="377" height="549" alt="image" src="https://github.com/user-attachments/assets/f1bb5d29-246f-4bc7-a10a-910888a3ed2f" />

