# IOTA full node with static neighbors

Hey everyone, this is a dockerized setup for iota full node. You'll just need some neighbors to add in a specific file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Install the last version of docker there : https://docs.docker.com/install/#docker-cloud

### Start your node 

Once you downloaded or cloned this repo, you'll start a container running your node with docker :
```
docker run hystenal/iotanode_dockerized:latest
```
If you want to run it in background use -d tag :
```
docker run hystenal/iotanode_dockerized:latest -d
```

### Built With

* [Docker](https://www.docker.com/)

### Authors

* **Matthieu LANVERT** - [Linkedin](https://www.linkedin.com/in/matthieu-lanvert-491032121/)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.
Thanks to **Nicolas BARRANGER** - [Linkedin](https://www.linkedin.com/in/nicolas-barranger-962a70a6/)

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
