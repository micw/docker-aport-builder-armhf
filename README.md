# Build aport packages using docker

This docker image simplifies the building of aport images for armhf. It uses the resin armhf alpine 3.8 docker image which contains a ready-to-use qemu for armhf.

Everthing required to build a package is in the image, so the host system is not modified in any way.

Usage:

* checkout aports
* change into aports directory
* run:

```
docker run -it --rm \
  -v $(pwd):/aports \
  -v $(pwd)/packages:/home/build/packages \
  --user build --workdir /aports \
  micwy/aport-builder-armhf:latest \
  testing/mypackage
```

* The package will be in the "packages" sub directory
