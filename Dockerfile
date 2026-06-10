#---------------------------------------------------------------------------------
# Crea un contenedor con las utilidades necesarias para compilar Alpine
#
# Se crea el usuario sin privilegios 'builder' (password 'builder') y el 
# contenedor se arranca con ese usuario
#---------------------------------------------------------------------------------
FROM alpine:latest

# Instalamos las herramientas para compilación
RUN apk update && \
    apk add alpine-sdk && \
    apk add sudo && \
    apk add util-linux-login && \
    adduser -D builder && \
    echo "builder:builder" | chpasswd && \
    addgroup builder wheel && \
     echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

USER builder

#RUN apk add build-base
