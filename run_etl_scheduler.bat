@echo off
REM ===================================================
REM Batch Pentaho Scheduler (Java 11, rutas absolutas, logging seguro)
REM ===================================================

setlocal

REM --------------------------
REM Parámetros del Job
REM --------------------------
set "ARCHIVO=transacciones.csv"
set "RUTA_ENTRADA=C:/Pentaho/Proyectos/Reto_Banco_Bogota/Entrada"
set "KJB=Job_Principal_cliente_movimientos.kjb"
set "PDI_HOME=C:\Pentaho\PDI\pdi-ce-10.2.0.0-222\data-integration"
set "JAVA_HOME=C:\Java\jdk-11.0.29.7-hotspot"
set "DIR_JOB=C:\Pentaho\Proyectos\Reto_Banco_Bogota"
set "LOG_FOLDER=%DIR_JOB%\Logs"

REM --------------------------
REM Crear carpeta de logs si no existe
REM --------------------------
if not exist "%LOG_FOLDER%" mkdir "%LOG_FOLDER%"

REM --------------------------
REM Generar nombre de log seguro para Windows
REM --------------------------
for /f "tokens=1-4 delims=:/ " %%a in ("%DATE% %TIME%") do (
    set LOG_FILE=job_%%a%%b%%c_%%d.log
)
set "LOG=%LOG_FOLDER%\%LOG_FILE%"

REM --------------------------
REM Mensajes iniciales
REM --------------------------
echo ================== INICIANDO JOB ==================
echo Archivo recibido: %ARCHIVO%
echo Ruta entrada: %RUTA_ENTRADA%
echo Ruta del Job: %DIR_JOB%\%KJB%
echo Log: %LOG%
echo ===================================================

REM --------------------------
REM Ejecutar Pentaho Kitchen
REM --------------------------
pushd "%DIR_JOB%"

"%JAVA_HOME%\bin\java.exe" -Xms1024m -Xmx2048m ^
 -Djava.library.path="%PDI_HOME%\libswt\win64;%PDI_HOME%\native-lib\win64" ^
 -DKETTLE_HOME="%PDI_HOME%" ^
 -jar "%PDI_HOME%\launcher\launcher.jar" ^
 -main org.pentaho.di.kitchen.Kitchen ^
 -initialDir "%DIR_JOB%" ^
 /file:"%DIR_JOB%\%KJB%" ^
 /param:P_NOMBRE_ARCHIVO="%ARCHIVO%" ^
 /param:P_RUTA_ENTRADA="%RUTA_ENTRADA%" ^
 /level:Basic ^
 /norep > "%LOG%" 2>&1

REM --------------------------
REM Capturar código de salida
REM --------------------------
if %ERRORLEVEL% neq 0 (
    echo ===================================================
    echo ERROR: El Job NO se ejecutó correctamente
    echo Revisar log: %LOG%
    echo ===================================================
) else (
    echo ===================================================
    echo EXITO: El Job se ejecutó correctamente
    echo Log: %LOG%
    echo ===================================================
)

popd
endlocal
