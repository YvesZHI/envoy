# Envoy
Customize Envoy based on the tag v1.22.5.

## Preparation
### Docker installation
```
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### Project preparation
You need to download the official project of Envoy from github and checkout to some specific tag that you need.
```
git clone https://github.com/envoyproxy/envoy
git tag -l    # list tags
git checkout tags/<tag> -b <br_name>    # switch to some verified tag and create a new branch
```
### Configuration
1. If you are behind a proxy, you need to write the config below into the file `~/.docker/config.json`.
```
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://127.0.0.1:20171",
     "httpsProxy": "http://127.0.0.1:20171"
   }
 }
}
```
You may also need to add `--network=host` for the command about building Docker image(`docker build...`) to use the proxy on the host machine.

2. The config of `./ci/run_envoy_docker.sh` may need to be modified:
- You may need to change the value of `DEFAULT_ENVOY_DOCKER_BUILD_DIR` to use a larger disk;
- You may need to add `--net=host` for the command `docker run` to use the proxy on the host machine.

## Compilation
`./compile.sh`: build binary file;<br />
`./compile.sh xx`: build binary file and do testing; (You need a 250GB disk!)<br />
`./build.sh`: build docker image.
