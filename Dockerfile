FROM node:4.0.0 AS builder
# Environment

WORKDIR /app
#ENV NODE_ENV=production

# Dependencies

COPY . /app/
#COPY package.json /app/
#COPY yarn.lock /app/
#COPY lerna.json /app/
#COPY app.json /app/

#COPY packages/addon/package.json /app/packages/addon/
#COPY packages/addon/yarn.lock /app/packages/addon/

#COPY packages/skyplus-design-system-app/package.json /app/packages/skyplus-design-system-app/
#COPY packages/skyplus-design-system-app/yarn.lock /app/packages/skyplus-design-system-app/

RUN npm install 
#RUN npx lerna bootstrap 

# Build


#COPY packages/skyplus-design-system-app/dist packages/login/node_modules/skyplus-design-system-app/dist
#RUN cd packages/skyplus-design-system-app && yarn build
#RUN ls
#RUN pwd
RUN cd /app
RUN npm start
RUN ls
RUN pwd

# Serve
RUN heroku create
RUN git push heroku master
RUN heroku open
#FROM nginxinc/nginx-unprivileged 
#COPY --from=builder /app/index.js /usr/share/nginx/html
