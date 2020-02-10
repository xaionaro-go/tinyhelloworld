# Quick start

```sh
$ make clean
$ docker build -t build-go-tinyhelloworld . && docker run -v "$(pwd):/project" build-go-tinyhelloworld
$ stat -c %s ./tinyhelloworld
107
$ ./tinyhelloworld 
Hello, world!
```

# Comments

Of course this example could be improved.
But it was not relevant for my demonstration, so I decided not to waste
time on it.
