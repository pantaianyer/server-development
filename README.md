# Server Deployments

Server deployment containers for different frameworks

## Support ❤️

If you find the project useful, please consider supporting, or contributing.


## Disclaimer

These container images are not "final". They serve as a base to start out and in most cases work as-is with your project for quick testing.

Please read the [Docker documentation](https://docs.docker.com/) and set up certificates before deploying these containers.

## Frameworks

> Version: lastest release of framework where the deployment was tested. It might require modifications in later versions.

|Framework|Version|Stages|Tags|
|---|---|---|---|
|[Angular](/angular)|`v13.3`|2|`angular`, `nginx`, `nodejs`, `ts`, `html`, `yarn`, `npm`, `npx`|
|[Apache](/apache)|`v2.4`|1|`apache`, `static`, `html`, `css`, `php`, `js`|
|[DotNET](/dotnet)|`v6.0`|2|`dotnet`, `c#`, `nuget`, `core`|
|[FastAPI](/fastapi)|`v3.10`|1|`python`, `python3`, `pip`, `fastapi`, `uvicorn`|
|[Go](/go)|`v1.18.2`|2|`go`, `golang`, `mux`, `alpine`|
|[Laravel](/laravel)|`v9.1.8`|1|`php`, `laravel`, `artisan`, `composer`, `npm`|
|[Nginx](/nginx)|`v1.21`|1|`nginx`, `js`, `static`, `html`, `css`|
|[NodeJS](/nodejs)|`v16.15.0 LTS`|1|`nodejs`, `js`, `yarn`, `npm`, `npx`, `pnpm`, `pm2`|
|[React](/react)|`v18.1.0`|2|`react`, `nginx`, `nodejs`, `js`, `html`, `yarn`, `npm`, `npx`|

## Contents

Each deployment has the following structure. You may not need all the files.

`/name`

- `/Dockerfile` - Commands to build a container
- `/.dockerignore` - List of files and folders not to copy into the container
- `/compose.yml` - Instructions for docker compose on how to host the container(s)

## Usage

### 1. Move to project

Move the `Dockerfile` and `.dockerignore` files into your project root.

### 2. Update ignore

Update `.dockerignore` to ignore everything you will not need for your deployment. Ideally you should ignore:

- Everything that's in your `.gitignore`
- Git folder (`.git/`)
- Build files and binaries
- Caches
- Installed packages
- Tests (and their config)
- Logs
- Readme files and licenses
- IDE specific files
- Docker specific files
- etc...

As a rule of thumb, consider every file you deploy to be accessible for attackers in a breach, so remove all secret information, even after running the application (like `.env` file with login details).

### 3. Check Dockerfile

Check if the current Dockerfile settings work with your project. Some Dockerfiles contain multiple methods for package management. Checklist:

- Exposed ports
- Package manager
- Included necessary files
- Correct entrypoint

### 4. Build container

Build container with the given name and tag. Tag can be a version or a subtype of your project, like `wip`.

> This command may require you to have administrator privileges

```bash
docker build -t <name>:<tag> .
```

### 5. Run container locally

Run the container and expose the given ports. Docker can forward those ports to another external one.

> This command may require you to have administrator privileges

```bash
docker run -p<port_ext>:<port_int> <name>:<tag>
```

Test the container to see if everything is working and it's available from your browsers.

### 6. Deploy your container

Deploy to the provider of your choice. This step may be different for each provider, so seek further instruction in their documentation.

## Compose

Each deployment also contains a docker-compose description yaml file (`compose.yml`). For local usage or quick startup you may use it like so:

Build container:

```bash
docker-compose build
```

Start container:

```bash
docker-compose up
```

Build then start each time:

```bash
docker-compose up --build
```

## LICENSE

General MIT license: [view](/[(https://raw.githubusercontent.com/pantaianyer/server-development/main/LICENSE]
