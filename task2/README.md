# Task 2

> **_NOTE:_** The solution is not perfect but should work.
> The files are copied in the container with the `COPY` command. One could of course also mount a volume (`volume` entry in the composer file). It was not completly clear what was preferred here.

## Build, run, stop, etc

There is a `makefile` allowing to use the `make` command for performing some common actions. Use `make list` to get a list of possible commands.

The `make` command has an optional argument (`PORT`) which allows to set the port you want to expose at runtime. If this argument is not provided the default value `8080` will be used. I am not completely happy with the `make` command interface but it allows to perform the requested actions.

Some example commands.

- Build: `make build PORT=3333`
- Start: `make start PORT=3333`
- Restart (also allows to change port): `make restart PORT=3334`
- Stop: `make stop`

## Logs

There is also a log command available for the nginx logs: `make logs`.
