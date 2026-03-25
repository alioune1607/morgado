# 1. Heredamos de tu imagen con ciberseguridad y SSH (Capa 1)
FROM alioune/ubbase

# 2. Instalamos Node.js 20.x (Capa 2 - Herencia de Node para que Next/Nest funcionen bien)
RUN apt-get update && apt-get install -y curl gnupg software-properties-common
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# 3. Comprobamos que se instaló correctamente
RUN node --version && npm --version