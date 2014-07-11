# Oracle Java JDK

This image contains Oracle Java JDK, it's main purpose is to be used a base for
other images that depend upon Java.

## Installation

To install this image: 

```bash
$ docker pull joaodubas/oracle-jdk:latest
```

## Building

To build this repo:

```bash
$ docker build --rm --tag $(cat REPOSITORY):$(cat TAG) .
$ docker tag $(cat REPOSITORY):$(cat TAG) $(cat REPOSITORY):latest
```
