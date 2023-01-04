# Paperless NGX Fedora CoreOS Layer

## Build the FCOS container layer

```
./scripts/fetch_containers.sh
podman build -f Containerfile -t localhost/paperless-ngx:latest .
```

## Push to registry

```
podman push localhost/paperless-ngx:latest quay.io/quickvm/paperless-ngx:latest
```

## Launch FCOS with layered container

```
bupy vm paperless-ngx.bu --port 2022 --port 8000
```


