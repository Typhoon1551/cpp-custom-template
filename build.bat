::init
@echo off

::set compilation settings
set "execname=textedit.exe"
set "projectpath=%~dp0"

set "outputpath=%projectpath%out\"
set "srcpath=%projectpath%src\*"
set "libpath=%projectpath%lib\"
set "iclpath=%projectpath%include\"

::ensure directory existence
if not exist %outputpath% mkdir %outputpath%
if not exist %srcpath% mkdir %srcpath%
if not exist %libpath% mkdir %libpath%
if not exist %iclpath% mkdir %iclpath%

::parse args
for %%A in (%*) do (
    if "%%A" == "--run" set "runexec=true"
    if "%%A" == "-r" set "runexec=true"

    if "%%A" == "--nocompile" set "nocompile=true"
    if "%%A" == "-nc" set "nocompile=true"
)

if not defined runexec set "runexec=false"
if not defined nocompile set "nocompile=false"

::output configs
echo projectpath %projectpath%
echo execname %execname%
echo:
echo outputpath %outputpath%
echo srcpath %srcpath%
echo libpath %libpath%
echo iclpath %iclpath%
echo:
echo runexec %runexec%
echo nocompile %nocompile%
echo:

::compile code
if "%nocompile%" == "false" (
    @echo on
    g++ -o %outputpath%%execname% -I %libpath% -I %iclpath% %srcpath%
    @echo off
)

::run executable
if "%runexec%" == "true" (
    echo:
    %outputpath%%execname%
    echo: & echo:
)

::finish
echo Have a nice day!
