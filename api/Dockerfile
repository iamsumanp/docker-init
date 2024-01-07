# parent image 
# use node of version 17 and use alpine as linux distro
# when this runs it will pull the node from docker hub only if we dont have it installed.
# does not matter if we have latest or other version of node as it specific here
FROM node:17-alpine

# use nodemon instead of node
RUN npm install -g nodemon 

#Specify working DIR so that we dont have to worry about the directory later on  
WORKDIR /app

# For layer caching . Docker uses layers from cache if they are not changed for faster build
#  if no dependency are changed then no need to npm i 
COPY package.json .

# At build time of image 
# We install all our necessary dependencies at build time from package.json
RUN npm install



# copy all of our source code in this image
# NOTE - docker has its own file directory that we can specify
#       - if we want to copy everything "." would be root dir. ./app . now we can store files in "app" 
# here first dot represent our codebase dir . we have app.ts in the same file as dockerfile and second dot represet in which dir of docker folder do we want to keep our files. 
#       -Since we have workdir in /app. we cann just keep '.' and it will keep our files in "./app"
COPY . . 


# Even if we have port as 4000 in app.ts port is handled in container as we are using it.
EXPOSE 9000

# Now run the code 
# Cannot run code at build time . we need to run the code at runtime when the container begins to run 
CMD ["npm", "run", "dev"]



# CMD 
# Build an image 
    # docker build -t myapp .  # -t for tagname(myapp) and "." is the DIR where our docker file is 
    # --> Build image with versions
        # docker build -t myapp:v1 .

# view all images 
    # docker images

# run an image in a container 
    # docker run --name moviesjsontest_c moviesjsontest  #name for container running image 
    # Port is not accessible to the localhost as we need exposed port from container 
        # docker run --name app_c -p 9000:9000 --> right one is container exposed port and left is the port we want to map in the computer
    # detach in terminal (for not stucking in terminal)
        # docker run --name app_c -p 9000:9000 -d moviesjsontest

# docker processes (containers)
    # docker ps   --> gives all running processes
    # docker ps -a --> all processes

# stop container 
    #docker stop moviesjsontest_c

# rerun container 
    # docker start mociesjsontest_c

# volume
    # docker run --name myexpapp_c -p 4000:4000 --rm -v /home/sumanp/files/mcodes/docker-init:/app -v /node/modules myexpapp:latest
        # --rm for deleting container when we stop it later on. this is for not storing container when we dont need it .
        # -v for volumn so that in /app the dockerfile is mapped . while the nodemon watches the changes for files . this is for development and image doesnot change with this.
            # The second -v is for node modules . 

# docker compose    
# version: '3.8'
# services:
#   api:
#     build: ./api
#     container_name: frontend_c1
#     ports:
#       - '9000:9000'
#     volumes:
#       - ./api:/app
#  -------> docker-compose up -> create isolated images for images 


#stoping the docker compose containers
    # docker-compose down  or docker-compose down --rmi all -v (rmi removes images and all removes all images. added -v deletes the volumes) 