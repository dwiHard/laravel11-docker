# Laravel Docker Image
It provides a flexible strategy to deploy Laravel applications with Docker.

## Quick Start
bulid docker image
```bash
docker build -t <name-image> . 
```

running Docker image
```bash
docker run --name <name-container> -d -p 8000:8000 <name-image>
```

