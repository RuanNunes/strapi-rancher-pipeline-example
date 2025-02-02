FROM node:lts-alpine

WORKDIR /app

COPY ./package.json ./
COPY ./yarn.lock ./
COPY ./.env.example ./.env

RUN yarn install

COPY . .

ENV NODE_ENV production
ENV ENV_PATH /app/.env
 
RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]
