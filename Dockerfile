FROM bitnami/scikit-learn-intel

USER root

RUN apt-get update -y &&\
  apt-get install curl -y && \
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt-get install -y nodejs

RUN pip3 install pandas openai pathlib

WORKDIR /app

COPY package*.json /app/

RUN npm i

COPY . .

RUN npm run build

CMD npm run start
