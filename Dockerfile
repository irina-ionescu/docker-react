#builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
#copy all source code because there are no more changes being made in production 
COPY . .
RUN npm run build


#run phase; second FROM statement signal a new phase
FROM nginx
EXPOSE 80
#copy something(/app/build) from the builder phase to the nginx folder see dockerhib nginex documentation
#only relevant stuff copied, no npm or alpine stuff from previous phase
COPY --from=builder /app/build /usr/share/nginx/html