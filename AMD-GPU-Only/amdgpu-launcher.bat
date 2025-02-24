@echo off
REM Save the current directory
pushd %~dp0

REM Install required packages first
echo Installing required packages...
python -m pip install --upgrade pip

REM Uninstall existing packages to avoid conflicts
echo Removing existing packages...
python -m pip uninstall -y torch torch-directml torchvision torchaudio opencv-python
python -m pip cache purge

REM Install specific versions known to work together
echo Installing compatible package versions...
python -m pip install --no-cache-dir torch==2.1.0
python -m pip install --no-cache-dir torch-directml==0.2.0.dev230820
python -m pip install --no-cache-dir opencv-python==4.8.0.74
python -m pip install --no-cache-dir colorama wmi gputil tabulate numpy==1.24.3

if errorlevel 1 (
    echo Error: Failed to install required packages.
    pause
    popd
    exit /b 1
)

REM Check for GPU support
echo Checking GPU support...
python check_gpu.py
if errorlevel 1 (
    echo Error: GPU check failed.
    pause
    popd
    exit /b 1
)

REM Run the main script
echo Running main.py...
python main.py
if errorlevel 1 (
    echo Error: main.py did not run successfully.
    pause
    popd
    exit /b 1
)

REM Provide success feedback
echo main.py ran successfully.

REM Return to the original directory
popd
pause