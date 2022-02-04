<h1 align="center">timrspratt/aero-docker</h1>

<div align="center">
  <p>Docker Environment for Aero Commerce Stores</p>
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

## Table of Contents

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Available Commands](#available-commands)
- [License](#license)

## Usage

This configuration is intended to be used as a Docker-based development environment for Aero Commerce stores.

## Prerequisites

This setup assumes you are running Docker on a computer. [Download & Install Docker Desktop](https://www.docker.com/products/docker-desktop).

This configuration has been tested on Mac & Linux. Windows is supported through the use of Docker on WSL.

The setup requires `git` to be installed.
On macOS, this will automatically be installed upon running the setup command below.
[Download & Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Setup

From command line, run the following command to register a global `aero` command:

```bash
curl -s https://raw.githubusercontent.com/timrspratt/aero-docker/master/install.sh | bash
```

Next, create a directory for the store project and `cd` into it:

```bash
mkdir -p ~/Sites/aero-demo
```

```bash
cd ~/Sites/aero-demo
```

> **The default container configuration uses ports `80`, `3306` and `9200`.**
> 
> If there are services on your host machine already using these ports, you can configure alternatives using `aero env:defaults`.
> Should you wish to use a custom configuration for the project, run `aero env:project`.

Run the `aero start` command within this directory to boot the application containers:

```bash
aero start
```

Once the containers are up and running, run the `aero install` command.
During the install process, you'll need to provide project credentials, which can be obtained from
[Agora](https://agora.aerocommerce.com/projects).

```bash
aero install
```

Once the instalation is complete, run the following command to seed the sample product catalog:

```bash
aero catalog:seed
```

Visit your storefront in a browser:

```bash
open http://localhost
```

## Available Commands

- `aero start`: Create and start the containers
- `aero stop`: Stops and removes the containers. Add the `-v` flag to also remove the data volumes
- `aero pause`: Pause the services
- `aero unpause`: Unpause the services
- `aero restart`: Restart the services
- `aero install`: Install an Aero store in the current directory
- `aero theme:install [name]`: Install a theme to the current Aero store
- `aero catalog:seed`: Seed the sample catalog to the current Aero store
- `aero bash`: Create a bash prompt in the main app container to execute commands
- `aero php`: Execute a PHP command within the main app container
- `aero artisan`: Execute an artisan command within the main app container
- `aero composer`: Execute a Composer command within the main app container
- `aero env:defaults`: Edit the container configuration defaults
- `aero env:project`: Publish the `.env` for the project and edit the container configuration
- `aero version`: Output the current version of Aero Docker
- `aero self-update`: Update to the latest version of Aero Docker

## License

[MIT License](https://opensource.org/licenses/MIT)
