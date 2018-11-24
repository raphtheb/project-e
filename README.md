Project-E

# Project Specifications

1. Create a Jenkins Docker and run locally or on a server of your choice.
2. Within your Jenkins docker, create a Jenkins file to pull from a GitHub repo of an nginx
hello world docker.
3. Create a Jenkins project to do the build.
4. Have Jenkins deploy Docker image (to local computer or remote server of your
choice) using any technique you prefer.

# Usage
How to use this project?

```
docker-compose build
docker-compose up
Use your favourite browser to hit localhost:8080
default credentials are admin/admin
```

# Project notes
For clarity and posterity, i will be keeping notes of the project's workflow and decision-making in this README.

## Run locally or on a remote server?
I intend to build this project for a local build. I do not have a spare remote server to deploy this to.

## Base Jenkins image?
I will be pulling the Alpine-based pre-existing Jenkins image (jenkinsci/jenkins:lts-alpine) to start this project. There's a few decisions to unpack in there:

* Why alpine?

Smallest image footprint (221MB), smallest attack surface (way less packages), and more importantly, we expect no need for OS-level configurations for Jenkins. We already know it runs well as a container.

* Why use a public image?

To be perfectly honest, we shouldn't. What i should be doing here is forking the Jenkins repository to a private git server and maintain my own docker images in order to maintain the proverbial "chain of custody" between docker images. I should also be signing those images with my own crypto keys for authenticity.

However, since the purpose of this exercise is to show that i can use docker/jenkins/nginx, i am consciously taking the risk of using a public image. This significantly reduces the amount of time i will be spending on ancillary tasks and lets me focus on the core "product".

Note: In a real-world context, this detail would become a backlog story.

## Why not use executors?
Executors (or as often poorly named, "slaves") are a great way to spread the load across multiple nodes instead of encumbering the "master" Jenkins with actual compilation/fetching duties.

For simplicity's sake i have chosen to omit using those. It would be the first thing to implement to scale this up.

## Where's the setup wizard gone?
The setup wizard is useful when you want a single, central, SPOF Jenkins server. Since we want this project to be fully "docker-ized", it must be stateless, and therefore fully functioning without manual intervention, such as filling forms / wizards.

## What about the registry?
To make things simple, i chose to merely pull down the default registry image and store in-memory. 
