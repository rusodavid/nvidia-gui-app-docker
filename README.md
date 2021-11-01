# nvidia-gui-app-docker
Docker image for gui apps with nvidia gpu hosts


# ARGS
NVIDIA_DRIVER_VERSION set the version of the driver to install (ex: 430.60.01). Check the driver version of your host machine and use it for the guest

To know the driver version of your host machine execute
#!/bin/bash
version="$(glxinfo | grep "OpenGL version string" | rev | cut -d" " -f1 | rev)"
