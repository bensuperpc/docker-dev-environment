#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2022                                            //
#//  Created: 14, April, 2022                                //
#//  Modified: 18, April, 2022                               //
#//  file: -                                                 //
#//  -                                                       //
#//  Source: https://github.com/crosstool-ng/crosstool-ng                                               //
#//          https://www.docker.com/blog/getting-started-with-docker-for-arm-on-linux/
#//          https://schinckel.net/2021/02/12/docker-%2B-makefile/
#//          https://www.padok.fr/en/blog/multi-architectures-docker-iot
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

SUBDIRS := debian alpine ubuntu archlinux fedora

DOCKER := docker


.PHONY: all clean qemu $(SUBDIRS)

all: $(SUBDIRS)

clean: $(SUBDIRS)
	$(DOCKER) images --filter=reference='bensuperpc/*' --format='{{.Repository}}:{{.Tag}}' | xargs -r $(DOCKER) rmi -f

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

qemu:
	export DOCKER_CLI_EXPERIMENTAL=enabled
	$(DOCKER) run --rm --privileged multiarch/qemu-user-static --reset -p yes
	$(DOCKER) buildx create --name qemu_builder --driver docker-container \
		--driver-opt env.BUILDKIT_STEP_LOG_MAX_SIZE=100000000,env.BUILDKIT_STEP_LOG_MAX_SPEED=100000000 --use 
	$(DOCKER) buildx inspect --bootstrap
