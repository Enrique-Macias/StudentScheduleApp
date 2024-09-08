# Student Schedule App 📅

**Student Schedule App** es una aplicación desarrollada en **SwiftUI** para que los estudiantes puedan gestionar y visualizar fácilmente sus horarios de clases. La app permite crear, editar, eliminar y compartir información de cursos, brindando una solución eficaz y personalizada para organizar las actividades académicas.

## Funcionalidades principales

- **Agregar cursos personalizados**:
  - Define el nombre, ID del curso, ubicación, días de clase y horas.
  - Asigna un color distintivo a cada curso.
  
- **Editar y eliminar cursos**:
  - Permite editar cualquier curso ya creado con nueva información.
  - Opción para eliminar cursos que ya no son necesarios.

- **Visualización de cursos con tarjetas**:
  - Cada curso se muestra en formato de tarjeta (EventCard) que incluye todos los detalles: nombre, edificio, días y horas de clase.

- **Interfaz intuitiva**:
  - Uso de menús contextuales (Context Menu) para acciones rápidas (editar, eliminar, compartir).
  - Interacción fluida con bottom sheets y gestos swipe para una experiencia de usuario mejorada.

- **Compartir curso**:
  - Opción para compartir detalles del curso a través de las aplicaciones disponibles en el dispositivo.

## Tecnologías utilizadas

- **SwiftUI**: Framework declarativo de interfaces de usuario de Apple.
- **Xcode**: Entorno de desarrollo integrado (IDE) para construir la aplicación.
- **Gestión de estado**: Manejo de datos con `@State` y `@Binding`.
- **Menús contextuales**: Para realizar acciones rápidas sobre los cursos.

## Instalación

Sigue estos pasos para ejecutar el proyecto localmente:

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu-usuario/student-schedule-app.git
2. Abre el proyecto en Xcode:
   - Ve al directorio donde clonaste el repositorio.
   - Haz doble clic en `StudentScheduleApp.xcodeproj`.

3. Ejecuta la app:
   - Asegúrate de tener un simulador o un dispositivo conectado.
   - Pulsa el botón de "Run" (o `Cmd + R`) en Xcode para compilar y ejecutar la aplicación.

## Uso

1. **Crear un curso**:
   - Presiona el botón "+" en la parte superior derecha para abrir la vista de creación de curso.
   - Ingresa el nombre del curso, ID, ubicación, selecciona los días de la semana y el horario.
   - Asigna un color al curso y presiona "Create Course".

2. **Editar o eliminar un curso**:
   - Mantén presionado sobre una tarjeta de curso para abrir el menú contextual.
   - Selecciona "Edit Course" para modificar los detalles o "Delete Course" para eliminarlo.

3. **Compartir un curso**:
   - Mantén presionado sobre una tarjeta de curso y selecciona "Share Course" para compartir los detalles del curso.

## Capturas de pantalla

_Añade aquí algunas capturas de pantalla de la app en funcionamiento para que otros puedan ver cómo luce._

## Contribuir

Las contribuciones son bienvenidas. Si deseas mejorar esta aplicación, sigue estos pasos:

1. Haz un fork de este repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-funcionalidad`).
3. Haz commit de tus cambios (`git commit -m 'Añadir nueva funcionalidad'`).
4. Haz push de la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para más detalles.

---

¡Gracias por visitar este repositorio! Si tienes alguna pregunta o sugerencia, no dudes en abrir un [issue](https://github.com/tu-usuario/student-schedule-app/issues).
