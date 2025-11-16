# CERTAMEN 2 - Shopping Trends Dashboard

## Sistema de Gestión y Análisis de Tendencias de Compras con Django ORM

---

## 📋 Descripción del Proyecto

Este proyecto implementa un sistema completo de gestión y visualización de datos de tendencias de compras utilizando Django ORM, con capacidades de CRUD completas, importación masiva de datos desde CSV, y múltiples visualizaciones interactivas.

---

## ✅ Requisitos Implementados

### 1. **Creación de Súper Usuario** ✓
```bash
python manage.py createsuperuser
```

### 2. **Modelos ORM (models.py)** ✓
Se han creado las siguientes clases que representan las tablas:
- `Categories` - Categorías de productos
- `PaymentMethods` - Métodos de pago
- `ShippingTypes` - Tipos de envío
- `Promotions` - Promociones y códigos
- `Locations` - Ubicaciones/Estados
- `Sizes` - Tallas
- `Colors` - Colores
- `Seasons` - Temporadas
- `Customers` - Clientes (tabla principal)
- `Products` - Productos
- `Transactions` - Transacciones (relación entre clientes y productos)

### 3. **Registro en Admin.py** ✓
Todos los modelos están registrados en el admin de Django para gestión administrativa.

### 4. **Migraciones** ✓
```bash
python manage.py makemigrations
python manage.py migrate
```

### 5. **Formularios para Ingreso Manual** ✓
Formularios completos implementados en `forms.py`:
- `CustomerForm` - Para agregar/editar clientes
- `ProductForm` - Para agregar/editar productos
- `TransactionForm` - Para agregar/editar transacciones
- `CSVUploadForm` - Para carga de archivos CSV

### 6. **Carga desde CSV** ✓
**Ubicación:** `/csv-upload/`

Características:
- Lectura automática del archivo `shopping_trends.csv`
- **Control de duplicados**: El sistema detecta registros existentes y NO los vuelve a insertar
- Transacciones atómicas: Si hay error, no se guardan cambios parciales
- Mensaje detallado con estadísticas:
  - Registros creados
  - Duplicados omitidos
  - Errores encontrados

**¿Qué pasa si ejecuto la carga 2 o más veces?**
- Primera vez: Inserta todos los registros nuevos
- Segunda vez en adelante: Detecta duplicados y NO los inserta, mostrando mensaje de advertencia
- Solo se agregan registros verdaderamente nuevos

### 7. **Django Messages, Modales y Toast** ✓

#### **Django Messages**
Implementado en todas las operaciones CRUD:
```python
messages.success(request, "Cliente agregado exitosamente!")
messages.error(request, "Error al procesar el archivo")
messages.warning(request, "Todos los registros ya existían")
```

#### **Bootstrap Toast**
Función JavaScript en `base.html`:
```javascript
showToast("Acción completada", "success");
```

#### **SweetAlert2 (Modales)**
Confirmación de eliminación con modales elegantes:
```javascript
confirmDelete(url, itemName);
```

Características:
- Confirmación antes de eliminar
- Diseño moderno y responsive
- Evita eliminaciones accidentales

### 8. **SORPRÉNDEME** 🎨✨

#### **Innovaciones Implementadas:**

##### **Frontend:**
1. **Dashboard Interactivo Moderno**
   - Cards animadas con efectos hover
   - Estadísticas en tiempo real desde la base de datos
   - Gradientes y colores vibrantes
   - Iconos Bootstrap Icons
   - Diseño responsive completo

2. **Sidebar Mejorado**
   - Navegación categorizada por secciones
   - Animaciones de entrada
   - Indicador de página activa
   - Gradiente de fondo

3. **Sistema de Notificaciones Triple**
   - Django Messages (alerts persistentes)
   - Bootstrap Toast (notificaciones emergentes)
   - SweetAlert2 (confirmaciones modales)

4. **UI/UX Premium**
   - Tarjetas con sombras y efectos 3D
   - Transiciones suaves
   - Badges de estado coloridos
   - Botones con spinners de carga
   - Diseño glassmorphism en algunos elementos

##### **Backend:**
1. **Control Inteligente de Duplicados**
   - Algoritmo que verifica duplicados por combinación de campos
   - Estadísticas detalladas de importación
   - Operaciones transaccionales (todo o nada)

2. **Optimización de Consultas**
   - `select_related()` para reducir queries
   - Contadores eficientes
   - Carga optimizada de relaciones FK

3. **Validación Robusta**
   - Formularios con validación Django
   - Mensajes de error descriptivos
   - Manejo de excepciones completo

4. **Panel de Gestión de Datos**
   - Vista centralizada de estadísticas
   - Acciones rápidas
   - Navegación intuitiva

---

## 🚀 Instalación y Configuración

### Paso 1: Activar el entorno virtual
```bash
cd "Visualización de Datos/CERTAMEN_2/proyecto"
source ../mienv/bin/activate  # Linux/Mac
# o
../mienv/Scripts/activate  # Windows
```

### Paso 2: Instalar dependencias (si es necesario)
```bash
pip install django pandas
```

### Paso 3: Aplicar migraciones
```bash
python manage.py makemigrations
python manage.py migrate
```

### Paso 4: Crear superusuario
```bash
python manage.py createsuperuser
# Username: admin
# Email: admin@example.com
# Password: admin123 (o el que prefieras)
```

### Paso 5: Ejecutar el servidor
```bash
python manage.py runserver
```

### Paso 6: Acceder al sistema
- **Dashboard:** http://127.0.0.1:8000/
- **Admin Django:** http://127.0.0.1:8000/admin/

---

## 📊 Funcionalidades Principales

### Panel de Gestión de Datos
**URL:** `/data/`

Visualiza estadísticas completas:
- Total de clientes, productos, transacciones
- Datos de catálogo (categorías, ubicaciones, colores, etc.)
- Accesos rápidos a todas las funciones

### Carga desde CSV
**URL:** `/csv-upload/`

1. Click en "Carga desde CSV" en el menú
2. Seleccionar archivo `shopping_trends.csv`
3. Click en "Iniciar Carga"
4. Ver estadísticas de importación

**Archivos soportados:**
- `shopping_trends.csv` (incluido en el proyecto)

### CRUD de Clientes
**URL:** `/customers/`

- **Listar:** Ver todos los clientes con badges de estado
- **Agregar:** Formulario completo con validación
- **Editar:** Modificar datos existentes
- **Eliminar:** Confirmación con SweetAlert2

### CRUD de Productos
**URL:** `/products/`

- Gestión completa de catálogo
- Relaciones con categorías, tallas, colores, temporadas

### CRUD de Transacciones
**URL:** `/transactions/`

- Registro de ventas
- Relación con clientes y productos
- Información de pagos y envíos

### Visualizaciones
12 gráficos interactivos:
1. Histograma Poder Adquisitivo
2. Histograma Edad
3. Clientes por Género
4. Métodos de Pago
5. Frecuencia de Compras
6. Edad vs. Monto
7. Poder Adquisitivo por Género
8. Categoría vs. Monto
9. Método Pago vs. Monto
10. Temporada vs. Cantidad
11. Ubicación vs. Cantidad
12. Temporada y Método Pago

---

## 🎨 Características de UI/UX

### Diseño Responsivo
- Funciona en móviles, tablets y desktop
- Grid adaptativo de Bootstrap 5
- Sidebar colapsable

### Animaciones
- Efectos hover en tarjetas
- Transiciones suaves
- Spinners de carga

### Código de Colores
- 🔵 **Primario (Azul):** Clientes, acciones generales
- 🟢 **Success (Verde):** Productos, confirmaciones
- 🟡 **Warning (Amarillo):** Transacciones, alertas
- 🔴 **Danger (Rojo):** Eliminaciones, errores
- ⚪ **Info (Celeste):** Información, CSV

### Iconografía
Bootstrap Icons integrados en todo el sistema

---

## 🛠️ Estructura del Proyecto

```
proyecto/
├── app_datos/
│   ├── models.py          # 11 modelos ORM
│   ├── views.py           # Vistas CRUD + CSV + Gráficos
│   ├── forms.py           # 11 formularios
│   ├── urls.py            # 30+ rutas
│   ├── admin.py           # Registro de modelos
│   └── templates/
│       ├── base.html      # Template base con SweetAlert2
│       ├── dashboard_home.html
│       ├── crud/          # Templates CRUD
│       │   ├── data_management.html
│       │   ├── csv_upload.html
│       │   ├── customers_list.html
│       │   ├── customer_form.html
│       │   ├── products_list.html
│       │   ├── product_form.html
│       │   ├── transactions_list.html
│       │   └── transaction_form.html
│       └── shopping/      # Templates de gráficos
├── db.sqlite3             # Base de datos SQLite
├── shopping_trends.csv    # Dataset original
└── manage.py
```

---

## 📝 Notas Técnicas

### Control de Duplicados en CSV
El sistema utiliza `get_or_create()` con campos clave para evitar duplicados:

```python
customer, created = Customers.objects.get_or_create(
    age=int(row["Age"]),
    gender=row["Gender"],
    id_location=location,
    # ... otros campos
)

if not created:
    skipped_count += 1
    continue
```

### Transacciones Atómicas
Uso de `transaction.atomic()` para garantizar integridad:

```python
with transaction.atomic():
    for row in reader:
        # Procesar cada fila
        # Si hay error, se hace rollback completo
```

### Mensajes de Django
Configurado en `settings.py` con Bootstrap:

```python
MESSAGE_TAGS = {
    messages.DEBUG: 'info',
    messages.INFO: 'info',
    messages.SUCCESS: 'success',
    messages.WARNING: 'warning',
    messages.ERROR: 'danger',
}
```

---

## 🔒 Seguridad

- CSRF tokens en todos los formularios
- Validación de datos en backend
- Confirmaciones antes de eliminar
- Transacciones atómicas
- Gestión de errores robusta

---

## 📚 Tecnologías Utilizadas

- **Backend:** Django 5.2.7
- **Base de Datos:** SQLite3
- **Frontend:** Bootstrap 5.3.3
- **JavaScript:** Vanilla JS + SweetAlert2
- **Iconos:** Bootstrap Icons 1.11.1
- **Gráficos:** Chart.js
- **Análisis:** Pandas

---

## 🎓 Aprendizajes Clave

1. **ORM de Django:** Relaciones FK, get_or_create, select_related
2. **Formularios:** ModelForms, validación, widgets personalizados
3. **CSV Processing:** Lectura, transformación, carga masiva
4. **Messages Framework:** Comunicación usuario-sistema
5. **UI/UX Moderno:** Animaciones CSS, diseño responsivo
6. **Control de Duplicados:** Lógica de negocio robusta

---

## ✨ Características Destacadas

- ✅ 11 Modelos ORM completamente relacionados
- ✅ CRUD completo para 3 entidades principales
- ✅ Carga CSV con detección inteligente de duplicados
- ✅ 3 sistemas de notificaciones diferentes
- ✅ 12 visualizaciones de datos
- ✅ Dashboard moderno y responsivo
- ✅ Validación robusta en formularios
- ✅ Confirmaciones con SweetAlert2
- ✅ Animaciones y efectos modernos
- ✅ Código limpio y documentado

---

## 🐛 Solución de Problemas

### Error: "No module named 'pandas'"
```bash
pip install pandas
```

### Error: "Table doesn't exist"
```bash
python manage.py migrate --run-syncdb
```

### CSV no carga datos
- Verificar que el archivo se llame exactamente `shopping_trends.csv`
- Verificar que esté en la raíz del proyecto
- Revisar los mensajes de error en pantalla

### Las migraciones no se aplican
```bash
python manage.py makemigrations app_datos
python manage.py migrate app_datos
```

---

## 📧 Contacto

Proyecto desarrollado para CERTAMEN 2 - Visualización de Datos
Universidad del Desarrollo (UDD)

---

## 🎯 Conclusión

Este proyecto demuestra la implementación completa de un sistema CRUD con Django ORM, incluyendo:
- Gestión eficiente de datos
- Importación masiva con control de duplicados
- Sistema de notificaciones moderno
- UI/UX de nivel profesional
- Visualizaciones interactivas

**¡Sorpresa lograda!** 🎉