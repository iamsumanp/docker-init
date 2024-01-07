# parent image 
# use node of version 17 and use alpine as linux distro
# when this runs it will pull the node from docker hub only if we dont have it installed.
# does not matter if we have latest or other version of node as it specific here
FROM node:17-alpine

#Specify working DIR so that we dont have to worry about the directory later on  
WORKDIR /app

# copy all of our source code in this image
# NOTE - docker has its own file directory that we can specify
#       - if we want to copy everything "." would be root dir. ./app . now we can store files in "app" 
# here first dot represent our codebase dir . we have app.ts in the same file as dockerfile and second dot represet in which dir of docker folder do we want to keep our files. 
#       -Since we have workdir in /app. we cann just keep '.' and it will keep our files in "./app"
COPY . . 

# At build time of image 
# We install all our necessary dependencies at build time from package.json
RUN npm install

# Even if we have port as 4000 in app.ts port is handled in container as we are using it.
EXPOSE 9000

# Now run the code 
# Cannot run code at build time . we need to run the code at runtime when the container begins to run 
CMD ["node", "app.ts"]

