
1. docker run hello-world -> running the the docker container for hello-world msg.
2. docker images -> Used to list all the images in the local machine
3. docker ps -a -> Used to list all the containers that are stopped along with running 
4. docker build -t my-webapp . -> Used to build the image called my-webapp
5. docker stop <container-id> -> Used to stop the container
6. docker rm <container-id> -> Used to remove the container.
7. docker run --rm my-webapp -> Used to remove container automatically after container stop.
8. docker run -d --name monitoring-app my-webapp -> Used to to create and run the container called monitoring-app from the my-webapp iamge.
9. docker logs -f  <container-name> -> Used to check live logs of the specific container
10. docker exec -it <container-name> bash -> Used to get inside the running container.
11. docker run -d \ --name <container-name> \ -v local-folder:container-folder \ <image>
12. docker network create myapp-network -> Used to create docker network.

13. container1 - simulated db:
 docker run -d \
   --name my-database \
   --network myapp-network \
   -e POSTGRES_PASSWORD=secret123 \
   postgres:15

container2 your app:
 docker run -d \ 
   --name my-app \
   --network myapp-network \
   my-webapp

14. docker exec -it my-app bash
           root@7f12ec34e0ac:/app# ping my-database -c 3
	   PING my-database (172.18.0.2) 56(84) bytes of data. 
15. docker ps -> Shows only currently running containers
16. docker network ls -> Lists all docker networks
17. docker volume ls -> Lists all docker volumes
