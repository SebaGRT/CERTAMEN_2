@echo off
REM CERTAMEN 2 - Setup Script (Windows)
REM Script de configuración rápida del proyecto

echo ==========================================
echo   CERTAMEN 2 - Shopping Trends Dashboard
echo ==========================================
echo.

REM Paso 1: Activar entorno virtual
echo [1/5] Activando entorno virtual...
if exist "..\mienv\Scripts\activate.bat" (
    call ..\mienv\Scripts\activate.bat
    echo [OK] Entorno virtual activado
) else (
    echo [!] No se encontró el entorno virtual en ..\mienv\
    echo Creando nuevo entorno virtual...
    python -m venv ..\mienv
    call ..\mienv\Scripts\activate.bat
    echo [OK] Entorno virtual creado y activado
)

REM Paso 2: Instalar dependencias
echo.
echo [2/5] Instalando dependencias...
pip install -q django pandas
echo [OK] Dependencias instaladas

REM Paso 3: Aplicar migraciones
echo.
echo [3/5] Aplicando migraciones...
python manage.py makemigrations
python manage.py migrate
echo [OK] Migraciones aplicadas

REM Paso 4: Crear superusuario (opcional)
echo.
echo [4/5] Creacion de superusuario...
set /p response="Deseas crear un superusuario ahora? (s/n): "
if /i "%response%"=="s" (
    python manage.py createsuperuser
) else (
    echo [!] Puedes crear el superusuario despues con: python manage.py createsuperuser
)

REM Paso 5: Información final
echo.
echo [5/5] Configuracion completada
echo.
echo ==========================================
echo [OK] Todo listo!
echo ==========================================
echo.
echo Para iniciar el servidor, ejecuta:
echo   python manage.py runserver
echo.
echo Luego accede a:
echo   Dashboard: http://127.0.0.1:8000/
echo   Admin:     http://127.0.0.1:8000/admin/
echo.
echo Para cargar datos desde CSV:
echo   1. Accede a http://127.0.0.1:8000/csv-upload/
echo   2. Selecciona el archivo shopping_trends.csv
echo   3. Haz clic en 'Iniciar Carga'
echo.
echo ==========================================
pause
