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



# CMD 
# Build an image 
    # docker build -t myapp .  # -t for tagname(myapp) and . is the DIR

# view all images 
    # docker images

# run an image in a container 
    # docker run --name moviesjsontest_c moviesjsontest  #name for container running image 
    # Port is not accessible to the localhost as we need exposed port from container 
        # docker run --name app_c -p 9000:9000 --> right one is container exposed port and left is the port we want to map in the computer
    # detach in terminal (for not stucking in terminal)
        # docker run --name app_c -p 9000:9000 -d moviesjsontest

# docker processes
    # docker ps   --> gives all running processes
    # docker ps -a --> all processes

# stop container 
    #docker stop moviesjsontest_c

# rerun container 
    # docker start mociesjsontest_c
