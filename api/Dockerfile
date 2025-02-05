FROM keymetrics/pm2:18-alpine

# Bundle APP files
COPY script script/
COPY package.json .
COPY pm2.json .
COPY run.sh . 
COPY .env .

ENV NPM_CONFIG_LOGLEVEL warn
#RUN npm install
#RUN npm run build 

# Show current folder structure in logs
RUN ls -al -R

EXPOSE 3000

#CMD [ "pm2-runtime", "start", "pm2.json" ]
CMD ["tail", "-f", "/dev/null"]
