# IOTA full node with static neighbors

Hey everyone, this is a dockerized setup for iota full node. You'll just need some neighbors to add in a specific file.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Install the last version of docker there : https://docs.docker.com/install/#docker-cloud

### Find some neighbors

In order to start your node you need to fill the NEIGHBORS value inside /src/iota.ini :
```
NEIGHBORS = <fill there>
```
Now let’s find some neighbors to add. Don’t panic it’s not that hard, you just need to ask for neighbors on discord (not longer slack): https://discord.gg/GMVXSvM.
Once you are on the discord, go in #rank-yourself and write the command !rank fullnode. You’ll join fullnode.
You’ll see a new text channel named #nodesharing. Ask for neighbors there, there is a lot of people asking for neighbors there every day. Then add them like this :
```
NEIGHBORS = udp://ip_neighbors1:14600 tcp://ip_neighbors2:14600 udp://ip_neighbors3:14600
```

### Start your node 

After modify your NEIGHBORS's list, start your node like this :
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

* Thanks to **Nicolas BARRANGER** - [Linkedin](https://www.linkedin.com/in/nicolas-barranger-962a70a6/)

### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
