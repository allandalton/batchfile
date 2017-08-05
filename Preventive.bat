@echo off 
title Preventiva
color 1f
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set date=%%a-%%b-%%c
for /f "tokens=1 delims=," %%a in ("%time%") do set tempo=%%a
echo Realizando Preventiva
IF not exist "%systemdrive%\Preventiva" ( mkdir %systemdrive%\Preventiva ) ELSE ( echo Pasta Preventiva Ja Existe )

:: Tarefas que serao executadas.
echo Log Iniciado  -  %tempo%h > %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ************************************************** >> %systemdrive%\Preventiva\%date%.txt
echo ******** TAREFAS QUE SERAO EXECUTADAS ************ >> %systemdrive%\Preventiva\%date%.txt
echo ************************************************** >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

echo Verif Sistema Operacional... >> %systemdrive%\Preventiva\%date%.txt
echo Verif Processador... >> %systemdrive%\Preventiva\%date%.txt
echo Verif Disco... >> %systemdrive%\Preventiva\%date%.txt
echo Verif Memoria... >> %systemdrive%\Preventiva\%date%.txt
echo Verif Programas Instalados... >> %systemdrive%\Preventiva\%date%.txt


echo Verif AntiVirus em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Ccleaner em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Usuario Local ti em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Cleaner Do Windows em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Firewall em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Ponto Rest em espera... >> %systemdrive%\Preventiva\%date%.txt
echo Defrag em espera... >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt


echo ************************************************** >> %systemdrive%\Preventiva\%date%.txt
echo ******** INICIANDO PREVENTIVA ******************** >> %systemdrive%\Preventiva\%date%.txt
echo ************************************************** >> %systemdrive%\Preventiva\%date%.txt

:: Verifica Sistema Operacional
echo. >> %systemdrive%\Preventiva\%date%.txt
echo Verificando Sistema Operacional... >> %systemdrive%\Preventiva\%date%.txt
wmic os get OSArchitecture, Caption /format:htable  >> %systemdrive%\Preventiva\OS.html 
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Verifica Processador
echo. >> %systemdrive%\Preventiva\%date%.txt
echo Verificando Processador... >> %systemdrive%\Preventiva\%date%.txt
wmic cpu get name,caption,maxclockspeed,systemname /format:htable  >> %systemdrive%\Preventiva\Processador.html
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Verifica Disco
echo. >> %systemdrive%\Preventiva\%date%.txt
echo Verificando Disco... >> %systemdrive%\Preventiva\%date%.txt
wmic logicaldisk where drivetype=3 get name, freespace, systemname, filesystem, size, volumeserialnumber /format:htable  >> %systemdrive%\Preventiva\Disco.html
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Verifica Memoria
echo. >> %systemdrive%\Preventiva\%date%.txt
echo Verificando Memoria... >> %systemdrive%\Preventiva\%date%.txt
wmic ComputerSystem get TotalPhysicalMemory /format:htable  >> %systemdrive%\Preventiva\MemoriaTotal.html
wmic OS get FreePhysicalMemory, TotalVirtualMemorySize, TotalVisibleMemorySize /format:htable >> %systemdrive%\Preventiva\Memoria.html
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Verifica Programas
echo. >> %systemdrive%\Preventiva\%date%.txt
echo Verificando Programas... >> %systemdrive%\Preventiva\%date%.txt
wmic product get name,version /format:htable  >> %systemdrive%\Preventiva\Programas.html
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Verificar AntiVirus

echo Verificando AntiVirus Instalado... >> %systemdrive%\Preventiva\%date%.txt

set TRUE=0
:: Sistema Operacional x86
IF exist "%ProgramFiles%\Trend Micro" set TRUE=1
IF exist "%ProgramFiles%\Panda Security" set TRUE=2 
IF exist "%ProgramFiles%\Avira" set TRUE=3
IF exist "%ProgramFiles%\Symantec" set TRUE=4 
IF exist "%ProgramFiles%\Symantec.cloud" set TRUE=5 
:: Sistema Operacional x64 	
IF exist "%ProgramFiles(x86)%\Trend Micro" set TRUE=1
IF exist "%ProgramFiles(x86)%\Panda Security" set TRUE=2 
IF exist "%ProgramFiles(x86)%\Avira" set TRUE=3
IF exist "%ProgramFiles(x86)%\Symantec" set TRUE=4 
IF exist "%ProgramFiles(x86)%\Symantec.cloud" set TRUE=5 

IF %TRUE%==1 (goto 01) 
IF %TRUE%==2 (goto 02)
IF %TRUE%==3 (goto 03)
IF %TRUE%==4 (goto 04)
IF %TRUE%==5 (goto 05)
IF %TRUE%==0 (goto 06)

:01
echo Possui Trend AntiVirus  >> %systemdrive%\Preventiva\%date%.txt
goto 07

:02
echo Possui Panda AntiVirus >> %systemdrive%\Preventiva\%date%.txt
goto 07

:03
echo Possui Avira Free AntiVirus >> %systemdrive%\Preventiva\%date%.txt
goto 07

:04
echo Possui Symantec EndPoint AntiVirus >> %systemdrive%\Preventiva\%date%.txt
goto 07

:05
echo Possui Symantec Cloud AntiVirus >> %systemdrive%\Preventiva\%date%.txt
goto 07

:06
echo Nao possui nenhum antivirus dentro do padrao, FALHOU. >> %systemdrive%\Preventiva\%date%.txt

:07
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Ccleaner.
echo Ccleaner Iniciado... >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
IF not exist "%ProgramFiles%\CCleaner\CCleaner.exe" (goto 1) ELSE (goto 2)
:1
cls
echo Realizando Preventiva

echo CCLEANER NAO INSTALADO, FALHOU. >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
goto 3
:2
cls
echo Realizando Preventiva

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "CcleanerPrev" /t REG_SZ /d "%systemdrive%\Program Files\CCleaner\ccleaner.exe /auto" /f
"%ProgramFiles%\CCleaner\ccleaner.exe" /auto
echo Ccleaner Concluido. >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Usuario Local ti.
:3
cls
echo Realizando Preventiva

echo Adicionando Usuario Local ti - Iniciado... >> %systemdrive%\Preventiva\%date%.txt
net user ti ti@local /add & net localgroup administradores ti /add & net user ti ti@local /active:yes
net user ti ti@local /add & net localgroup administrators ti /add & net user ti ti@local /active:yes
echo Adicionando Usuario Local ti - Concluido. >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Limpeza do Windows.
cls
echo Realizando Preventiva

echo Limpeza Do Windows Iniciado... >> %systemdrive%\Preventiva\%date%.txt
%systemdrive%\windows\SYSTEM32\cleanmgr.exe /SAGERUN:69
echo Limpeza Do Windows Concluido. >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Desativar Firewall.
cls
echo Realizando Preventiva

echo Desativar Firewall do Dominio Iniciado... >> %systemdrive%\Preventiva\%date%.txt
:: Windows 7, 8 e 10.
netsh advfirewall set domain state off
echo Desativar Firewall do Dominio Concluido. >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:: Validador Windows Xp ou Windows Superior.
for /F "tokens=3 " %%a in ('wmic os get Caption /value') do set recebe=%%a
IF %recebe%==XP (goto 5) ELSE (GOTO 4)

:4
cls
echo Realizando Preventiva

:: Criar Ponto De Restauracao Windows 7, 8 e 10.
echo Ponto Rest Iniciado... >> %systemdrive%\Preventiva\%date%.txt
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%date%", 100, 12
IF %ERRORLEVEL%==0 ( echo Ponto Rest Concluido >> %systemdrive%\Preventiva\%date%.txt ) ELSE ( echo Ponto Rest FALHOU >>  %systemdrive%\Preventiva\%date%.txt )
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

goto 6

:5
cls
echo Realizando Preventiva

:: Criar Ponto De Restauracao XP.
echo Ponto Rest Iniciado... >> %systemdrive%\Preventiva\%date%.txt
for /f "tokens=3" %%a in ('"Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%date%", 100, 12"') do set resultado=%%a
IF  %resultado%==0 ( echo Ponto Rest Concluido. >> %systemdrive%\Preventiva\%date%.txt ) ELSE ( echo Ponto Rest FALHOU >>  %systemdrive%\Preventiva\%date%.txt )
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt

:6
cls
echo Realizando Preventiva

:: Desfragmentar Disco.
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set date=%%a-%%b-%%c
for /f "tokens=1 delims=," %%a in ("%time%") do set tempo=%%a
echo Defrag Iniciado... -  %tempo%h >> %systemdrive%\Preventiva\%date%.txt
defrag %systemdrive% > %systemdrive%\Preventiva\Defrag.txt
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set date=%%a-%%b-%%c
for /f "tokens=1 delims=," %%a in ("%time%") do set tempo=%%a
echo Defrag Concluido. -  %tempo%h >> %systemdrive%\Preventiva\%date%.txt
echo Detalhes da Desfragmentacao em  %systemdrive%\Preventiva\Defrag.txt . -  %tempo%h >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo ================================================== >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
echo **************************************************  >> %systemdrive%\Preventiva\%date%.txt
:: Validador De Falhas 

for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set date=%%a-%%b-%%c
for /f "tokens=1 delims=," %%a in ("%time%") do set tempo=%%a
set resp=0
for /f "tokens=1" %%r in ('findstr "FALHOU" %systemdrive%\Preventiva\%date%.txt') do set resp=%%r 
IF %resp%==0 ( echo ***** PREVENTIVA CONCLUIDA. -  %tempo%h ********* >> %systemdrive%\Preventiva\%date%.txt ) ELSE ( echo ***** PREVENTIVA COM FALHAS. -  %tempo%h ******** >> %systemdrive%\Preventiva\%date%.txt )
echo **************************************************  >> %systemdrive%\Preventiva\%date%.txt
echo. >> %systemdrive%\Preventiva\%date%.txt
IF exist "%ProgramFiles%\Avira" ( "%PROGRAMFILES%\Avira\AntiVir Desktop\avscan.exe"  /PATH="%WINDIR%"  ) ELSE ( echo Ok )
IF exist "%ProgramFiles(x86)%\Avira" ( "%ProgramFiles(x86)%\Avira\AntiVir Desktop\avscan.exe"  /PATH="%WINDIR%"  ) ELSE ( echo Ok )



