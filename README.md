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

## Setup

```bash
curl -s https://raw.githubusercontent.com/timrspratt/aero-docker/master/install.sh | bash
```

A global `aero` command is registered. This command should be called from within directories which are/wish to be Aero store projects.

## Available Commands

- `aero up -d`: Create and start the containers
- `aero down`: Stops and removes the containers
- `aero pause`: Pause the services
- `aero unpause`: Unpause the services
- `aero restart`: Restart the services
- `aero install`: Install an Aero store in the current directory
- `aero theme:install`: Install a theme to the current Aero store
- `aero catalog:seed`: Seed the sample catalog to the current Aero store
- `aero bash`: Create a bash prompt in the main app container to execute commands
- `aero php`: Execute a PHP command within the main app container
- `aero artisan`: Execute an artisan command within the main app container
- `aero composer`: Execute a Composer command within the main app container
- `aero version`: Output the current version of Aero Docker
- `aero self-update`: Update to the latest version of Aero Docker

## License

[MIT](https://opensource.org/licenses/MIT)
