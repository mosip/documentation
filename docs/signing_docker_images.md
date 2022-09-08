# SIGNING DOCKER IMAGES THROUGH IMAGESIGNER

## Overview
This documents helps in understanding the function of the two scripts that are required in signing of docker images.

The two scripts are: 
1. imagesigner.sh
2. dockerInit.sh

## Functionality

1. __Imagesigner.sh__

* This script is used for signing images of any repository, if that repository’s previous or older images have already been signed.
* For example, let’s say `print`. It’s older images 1.1.4 and 1.1.5 are already signed, now if we wish to sign new images like 1.2.0 or 1.2.0.1 we will have to make the following changes:
  1. Change the user to root (sudo su)
  2. Add the name of the repo (e.g. print) to the file repo-name.txt
  3. Add the version/tag of the image in the file `all.properties`
  4. After these simple steps, we can run` imagesigner.sh` with cmd
   `./imagesigner.sh` and it will sign the respective image of the respective repository.
  5. The signature can be checked by the command:
  `docker trust inspect repository/image:tag(optional)`

e.g. docker trust inspect mosipid/print:1.1.5

2. __dockerInit.sh__

* This script is used very carefully. It is used when we want to introduce a new module or repository. 
* For example, let’s say PMP-UI_. It’s a new module of which no images have been signed, hence first we need to initialize Docker signing for the same and then sign it.
This initialize Docker signing part is covered by `dockerInit.sh`. This initialization has important steps as adding our root and target keys to the repository, rotating trust keys and publishing the same, all of these are taken care of by the script. 

Steps to follow:
 1. Change the user to root (sudo su)
 2. Add the name of the repository to `repo-name.txt`  and run the command `./dockerInit.sh`.
 3. Provide username and password and choose ONLY OPTION 4(to be noted).

__Option 4__ is basically using the existing key set up and completes the initialization.
Once it is completed, we can start with `imagesigner.sh` as explained above to sign all images of the repository.


