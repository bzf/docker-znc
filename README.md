omgbzf/znc
==========

A container for running a `znc` server inside Docker based off of `debian:8`.

## Running the container
The container expects `znc` configuration files in the `/var/znc` directory on
the host. Remember to mount a directory on the host if you want to save the
users and logs when running the container.

Example configurations can be found in the `znc/` directory. The credentials
for the default admin account is `admin:admin` and the server listens to the
port `4769`.

To start the container with the example configurations and binding the port to
the host you can run:
```sh
docker run -v `pwd`/znc:/var/znc -p 4769:4769 -it omgbzf/znc
```

## Running with a data container
Another way of running the container and have persistent data is to run it with
a data container.

To create a data container you run:
```sh
docker create -v /var/znc --name znc-data omgbzf/znc /bin/true
```

Then to run `znc` with the data container:
```sh
docker run --volumes-from=znc-data -p 4769:4769 -it omgbzf/znc
```

Then you can access the container for going to `http://host:4769/`
