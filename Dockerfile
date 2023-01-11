FROM node:lts 

# Reduce npm log spam and colour during install within Docker
ENV NPM_CONFIG_LOGLEVEL=warn
ENV NPM_CONFIG_COLOR=false

# Run the app as the 'node' user, so put it in their home directories
WORKDIR /home/node/app

RUN chown -R node:node /home/node

# Copy the source code over

COPY --chown=node:node . /home/node/app/

# Install  with dependencies
RUN npm install


# Switch to the node users
USER node

# Expose port 30000
# EXPOSE 50000
EXPOSE 3000

# Start the app 
CMD ["npm", "start"]

#CMD [ "node", "server.js" ]
