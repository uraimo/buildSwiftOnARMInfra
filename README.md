<p align="center" style="margin-bottom:60px;">
<img src="https://raw.githubusercontent.com/uraimo/buildSwiftOnARMInfra/master/logo.svg?sanitize=true" width="476"/>
</p>

This repository contains a set of Dockerfiles used to setup an infrastructure to build the latest Swift for various distributions on variants of the ARM architecture with [buildSwiftOnARM](https://github.com/uraimo/buildSwiftOnARM).

With these Dockerfiles you'll be able to recreate the same set of Linux Swift binaries available on buildSwiftOnARM (for both ARMv6 and ARMv7) using a single Raspberry Pi 3 or 4 with Docker installed. There are no particular requirements other than the recommendation of using an external usb drive (pen, ssd or hard disk) to store the docker data-root directory (see [here](https://blog.adriel.co.nz/2018/01/25/change-docker-data-directory-in-debian-jessie/)).

## Usage

Build your image using one of the Dockerfile provided (grouped by architecture):

```
    docker build . --file armv7/Dockerfile.armv7.debian.buster --tag myswiftimage
```

The Dockerfiles are named following the format: `Dockerfile.<architecture>.<distro>.<version>`.

Once the build phase completes, the resulting image will contain the Swift repository and all the dependencies needed to build the compiler and all the related projects.

To complete the process, create an interactive container:

```
docker run -i -t myswiftimage /bin/bash
```

And then run `./updateCheckout.sh` to checkout the latest supported Swift release, followed by `./build.sh` to start building Swift.

## Supported distributions

At the moment, the architecture/distribution pairs supported are those used to build binaries for the [main project](https://github.com/uraimo/buildSwiftOnARM):

* ARMv6: Debian (Raspbian) Stretch/Buster
* ARMV7: Debian Stretch/Buster, Ubuntu 16.04, 18.04 

