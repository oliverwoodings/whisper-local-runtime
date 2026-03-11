# Whisper Local Runtime

Shared local [whisper.cpp](https://github.com/ggml-org/whisper.cpp) runtime setup and service management for local tools and plugins.

This repository owns the native whisper.cpp checkout, model download, and macOS `launchd` service lifecycle. Client applications such as Obsidian plugins can point at the same local server instead of duplicating setup.

## Prerequisites

- macOS
- Node.js 18+
- Git
- CMake
- curl

## Quick start

```bash
cd ~/repos/personal/whisper-local-runtime
npm run whisper:setup
npm run whisper:start
```

Default server URL:

```text
http://127.0.0.1:8080
```

## Commands

```bash
npm run whisper:setup
npm run whisper:start
npm run whisper:stop
npm run whisper:status
npm run whisper:logs
npm run whisper:install-service
npm run whisper:uninstall
```

## Configuration

Edit `whisper/.env` to change model, paths, port, or launchd settings. The first `whisper:setup` run will create `whisper/.env` from `whisper/.env.example`.

## Repo contents

- `whisper/setup.sh`: clone/build whisper.cpp, download model, install service
- `whisper/start.sh`: start the launchd service
- `whisper/stop.sh`: stop the launchd service
- `whisper/status.sh`: print launchd status
- `whisper/logs.sh`: tail stdout/stderr logs
- `whisper/service-install.sh`: reinstall launchd plist from current config
- `whisper/uninstall.sh`: unload and remove launchd service
- `whisper/common.sh`: shared env/runtime helpers
