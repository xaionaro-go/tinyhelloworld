# Quick start

```sh
$ make clean
$ docker build -t build-go-tinyhelloworld . && docker run -v "$(pwd):/project" build-go-tinyhelloworld
$ stat -c %s ./tinyhelloworld
148
$ ./tinyhelloworld 
Hello, world!
```
