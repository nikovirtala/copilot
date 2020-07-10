# copilot

The AWS Copilot CLI was announced at the time of [AWS Cloud Containers Conference 2020](https://awscloudcontainersconference.splashthat.com). Read more about the release from AWS blog https://aws.amazon.com/blogs/containers/introducing-aws-copilot/ or check the documentation on https://github.com/aws/copilot-cli/wiki.

> The AWS Copilot CLI is a tool for developers to build, release and operate production ready containerized applications on Amazon ECS and AWS Fargate.

## Unofficial AWS Copilot Docker Image

This is my personal side project and has nothing to do with copilot or AWS.

## How to run?

+ Set up a function:

```sh
copilot() {
  docker run --rm -it \
  -v "${HOME}/.aws:/copilot/.aws" \
  nikovirtala/copilot \
  $@
}
```

+ Run the dockerized `copilot`:

```sh
copilot help
```