FROM node:8.9 as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/
RUN npm install --production
COPY . /usr/src/app

FROM gcr.io/distroless/nodejs
COPY --from=build /usr/src/app /
EXPOSE 3000
ENV NODE_ENV production
CMD [ "npm", "start" ]
