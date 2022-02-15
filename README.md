<h1 align="center">timrspratt/aero-docker</h1>

<div align="center">
  <p>Docker Environment for Aero Commerce Stores</p>
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Alternative Setup](#alternative-setup)
  - [Existing project](#existing-project)
- [Available Commands](#available-commands)
- [License](#license)

## Usage

This configuration is intended to be used as a Docker-based development environment for Aero Commerce stores.

## Prerequisites

This setup assumes you are running Docker on a computer (the host machine). [Download & Install Docker Desktop](https://www.docker.com/products/docker-desktop).

This configuration has been tested on Mac & Linux. Windows is supported through the use of Docker on WSL.

The setup requires `git` to be installed.
On macOS, this will automatically be installed upon running the setup command below.
[Download & Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Setup

From command line, run the following command to register a global `aero` command:

```bash
curl -s https://raw.githubusercontent.com/timrspratt/aero-docker/master/install.sh | bash
```

Next, create a directory for the store project and `cd` into it.
The example below creates an empty directory named `aero-store` in the logged in user's home directory.
The name of this directory is used as the name of the Docker "app", and will also be used as the Aero store name.
Feel free to name this more suitably based on the website/domain/store.

```bash
mkdir ~/aero-store
```

```bash
cd ~/aero-store
```

> **The default container configuration uses ports `80`, `3306` and `9200`.**
> 
> If there are services on your host machine already using these ports, you can configure alternatives using `aero env:defaults`.
> Should you wish to use a custom configuration for the project, run `aero env:project`.

Run the `aero install` command within this directory to boot the application containers and start the install process.
During the install process, you'll need to provide project credentials, which can be obtained from
[Agora](https://agora.aerocommerce.com/projects).

```bash
aero install
```

Once the installation is complete, run the following command to seed the sample product catalog (if needed):

```bash
aero catalog:seed
```

**🎉 You're all set!**

## Alternative Setup

### Existing project

There may be a time where you need to configure an existing project to run with Aero Docker.
For example pulling a repository from GitHub to run locally.

> **You will need to stop any containers running from other projects to ensure the port bindings do not clash.**
> 
> Alternatively, you can run `aero env:project` to publish and adjust the container configuration for this project.

Run the `aero setup` command from within the root directory of the project.

```bash
aero setup
```

## Available Commands

- `aero start`: Create and start the containers
- `aero stop`: Stops and removes the containers. Add the `-v` flag to also remove the data volumes
- `aero pause`: Pause the services
- `aero unpause`: Unpause the services
- `aero restart`: Restart the services
- `aero install`: Install an Aero store in the current directory
- `aero setup`: Setup the current project to run through Aero Docker
- `aero theme:install [name]`: Install a theme to the current Aero store
- `aero catalog:seed`: Seed the sample catalog to the current Aero store
- `aero bash`: Create a bash prompt in the main app container to execute commands
- `aero db`: Open an interactive database shell connection
- `aero php`: Execute a PHP command within the main app container
- `aero artisan`: Execute an artisan command within the main app container
- `aero composer`: Execute a Composer command within the main app container
- `aero env:defaults`: Edit the container configuration defaults
- `aero env:project`: Publish the `.env` for the project and edit the container configuration
- `aero version`: Output the current version of Aero Docker
- `aero self-update`: Update to the latest version of Aero Docker

## License

[MIT License](https://opensource.org/licenses/MIT)
