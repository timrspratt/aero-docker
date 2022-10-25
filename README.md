<h1 align="center">timrspratt/aero-docker</h1>

<div align="center">
  <p>Docker Environment for Aero Commerce Stores</p>
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [Global Command Installation](#global-command-installation)
  - [Project Setup & Installation](#project-setup--installation)
- [Alternative Setup](#alternative-setup)
  - [Existing Project](#existing-project)
- [Available Commands](#available-commands)
- [License](#license)

## Usage

This configuration is intended to be used as a Docker-based development environment for Aero Commerce stores.

## Prerequisites

This setup assumes you are running Docker on a computer (the host machine). [Download & Install Docker Desktop](https://www.docker.com/products/docker-desktop).

This configuration has been tested on Mac & Linux. Windows is supported through the use of Docker on WSL.

## Setup

### Global Command Installation

From command line, run the following command to register a global `aero` command:

```bash
curl -s https://raw.githubusercontent.com/timrspratt/aero-docker/1.x/install.sh | bash
```

### Project Setup & Installation

Run the `aero new` command to start the installation.
During the installation process, you'll need to provide project credentials, which can be obtained from
[Agora](https://agora.aerocommerce.com/projects).

```bash
aero new {store_name}
```

Once the installation is complete, run the following command to seed the sample product catalog (if needed):

```bash
aero seed {industry}
```

Available values for `industry`:
- `fashion`
- `furniture`

Open your browser and navigate to `http://localhost`.

## Alternative Setup

### Existing Project

There may be a time you need to configure an existing project to run with Aero Docker.
For example pulling a repository from GitHub to run locally that has not initially been configured using Aero Docker.

Run the `aero setup` command from within the root directory of the project.

```bash
aero setup
```

## Available Commands

Run `aero help` to view a list of the available commands.

## License

[MIT License](https://opensource.org/licenses/MIT)
