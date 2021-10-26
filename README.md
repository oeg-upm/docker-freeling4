# docker-freeling4
Docker Image for FreeLing 4 (4.2) for all languages. 

Because life its to short to install this library. 



## Build

```
docker build . -t freeling4
```

## Excecute

### Server

```
docker run -it --rm -p 50005:50005 freeling4 analyzer -f /usr/local/share/freeling/config/en.cfg --server --port 50005 --outlv tagged
```
The cfg file configures the task of the tool (file inside the docker image). Check the folder config to see all the configuration files that are included in the docker and tool

Check also the output formats for the tool:
https://freeling-user-manual.readthedocs.io/en/v4.2/analyzer/



### Client
```
echo 'Hello world, I like pizza' >in.txt   
```



```
client/analyzer_client 50005 <in.txt >out.txt   
```

