@ECHO OFF
IF [%1]==[] ECHO Value Missing && GOTO exiting

IF %1=='cpp' GOTO cpp_start
IF %1=='neko' GOTO neko_start

:neko_start
neko bin\neko\yuras_work.n
PAUSE
GOTO exiting

:cpp_start
bin\x86\Main-debug.exe
PAUSE
GOTO exiting

:exiting
ECHO Exting, Bye!