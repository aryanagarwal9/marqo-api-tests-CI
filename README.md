# API test suite for Marqo

## Prerequisites
- Have Docker installed
- Be able to run docker [without sudo](https://github.com/sindresorhus/guides/blob/main/docker-without-sudo.md). 
You may need to run `newgrp docker` after the instructions in the link
if you are getting still getting a `permission denied` error.
- Have git clone access to the Marqo repo (everyone should as it's public)
- Have Python3.8 installed
- Have pip installed 

## Set up

1. Clone this repo
2. Make a copy of `conf_sample` called `conf` in the same directory. 
Fill in the environment variables/credentials in `conf` as appropriate. 
The `conf` file will be read by the startup scripts in order to populate environment variables.

## Run tests
 
`cd` into the api testing repo home directory and run `tox`, to test all environments. 

To run a specific environment do `tox -e <TOX ENVIRONMENT NAME>`
#### Arm64 Machines
Install QEMU (this allows you to emulate the x86 instruction set on the ARM processor, needed for marqo-os). 

Run the following  if you are on Ubuntu:
1. `sudo apt-get install -y qemu-user-static`
## Devloping
If you are going to make a new test environment, make sure you set the `TESTING_CONFIGURATION` environment variable so
that the test suite knows if whether or not to modify certain tests for the current configuration 

You do this by creating a `setenv` section in `tox.ini`:
```tox
setenv =
  TESTING_CONFIGURATION = YOUR_TEST_ENV_NAME
```
### Future work
* Have a tox var to specify the image name. This allows for remote images to be tested, in addition to local builds `marqo_image_name = marqo_docker_0`
