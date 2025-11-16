#!/bin/bash

# CERTAMEN 2 - Setup Script
# Script de configuración rápida del proyecto

echo "=========================================="
echo "  CERTAMEN 2 - Shopping Trends Dashboard"
echo "=========================================="
echo ""

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Paso 1: Activar entorno virtual
echo -e "${BLUE}[1/5]${NC} Activando entorno virtual..."
if [ -f "../mienv/bin/activate" ]; then
    source ../mienv/bin/activate
    echo -e "${GREEN}✓${NC} Entorno virtual activado"
else
    echo -e "${YELLOW}⚠${NC} No se encontró el entorno virtual en ../mienv/"
    echo "Creando nuevo entorno virtual..."
    python3 -m venv ../mienv
    source ../mienv/bin/activate
    echo -e "${GREEN}✓${NC} Entorno virtual creado y activado"
fi

# Paso 2: Instalar dependencias
echo ""
echo -e "${BLUE}[2/5]${NC} Instalando dependencias..."
pip install -q django pandas
echo -e "${GREEN}✓${NC} Dependencias instaladas"

# Paso 3: Aplicar migraciones
echo ""
echo -e "${BLUE}[3/5]${NC} Aplicando migraciones..."
python manage.py makemigrations
python manage.py migrate
echo -e "${GREEN}✓${NC} Migraciones aplicadas"

# Paso 4: Crear superusuario (opcional)
echo ""
echo -e "${BLUE}[4/5]${NC} Creación de superusuario..."
echo "¿Deseas crear un superusuario ahora? (s/n)"
read -r response
if [[ "$response" =~ ^([sS][iI]|[sS])$ ]]; then
    python manage.py createsuperuser
else
    echo -e "${YELLOW}⚠${NC} Puedes crear el superusuario después con: python manage.py createsuperuser"
fi

# Paso 5: Información final
echo ""
echo -e "${BLUE}[5/5]${NC} Configuración completada"
echo ""
echo "=========================================="
echo -e "${GREEN}✓ ¡Todo listo!${NC}"
echo "=========================================="
echo ""
echo "Para iniciar el servidor, ejecuta:"
echo -e "${YELLOW}python manage.py runserver${NC}"
echo ""
echo "Luego accede a:"
echo "  Dashboard: http://127.0.0.1:8000/"
echo "  Admin:     http://127.0.0.1:8000/admin/"
echo ""
echo "Para cargar datos desde CSV:"
echo "  1. Accede a http://127.0.0.1:8000/csv-upload/"
echo "  2. Selecciona el archivo shopping_trends.csv"
echo "  3. Haz clic en 'Iniciar Carga'"
echo ""
echo "=========================================="
