# Use the toplprotocol/topl-btc-bridge:latest image as the base image
FROM toplprotocol/topl-btc-bridge:latest

## install sudo
#RUN apt-get update && apt-get install -y sudo
#
## Change the owner of the /wallet directory to the user that the Docker container is running as
#RUN sudo chown -R demiourgos728:root /wallet
#
## Change the permissions of the /wallet directory
#RUN sudo chmod -R 755 /wallet