omgbzf/znc
==========

A container for running a `znc` server inside Docker.

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
