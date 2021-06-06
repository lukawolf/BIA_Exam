
# Protocol for counting cell nuclei in the BBBC0001 dataset
#### An applied Bio-Image Analysis exam exercise by Lukas Cakl
This pipeline is used to produce cell nuclei counts out of a dataset of fluorescent microscopy images. As the data is single-channel and clear, no preprocessing is needed. The method used for
This pipeline is:
- quantitative: It returns the number of nuclei detected in each image
- objective: There is no human input or interpretation that could lead to different results
- reliable: StarDist is released with a pre-trained and tested model exactly for this use case
- repeatable: On multiple consecutive runs this script returns the same results
- reproducible: This pipeline can be run to reproduce its results so long as the same version of StarDist and its models is used

## Used software
- [Fiji](https://imagej.net/Fiji) (ImageJ v. 1.53c)
  - Used plugins:
    - [StarDist](https://github.com/stardist/stardist) [(Plugin page)](https://imagej.net/StarDist) v. 0.3.0

### Installation instructions
The Fiji software can be downloaded from the link provided above. It should then be unpacked and run using the included executable file e.g. `ImageJ-win64.exe` on windows.
To install the required StarDist plugin run Fiji and do the following:
- select `Help > Update...` in the toolbar.
  - Fiji will prepare to update its plugins and also offer the opportunity to install more of them.
- Select `Manage upload sites`
- Make sure that the checkbox for `StarDist` is checked in the newly open window
- Click on the `Close` button
- Click on the `Apply changes` button and restart Fiji after the packages are installed and / or updated

## Workflow
- Obtain dataset
  - Download [here](https://data.broadinstitute.org/bbbc/BBBC001/BBBC001_v1_images_tif.zip)
  - Unzip into a location of own choice
- Open Fiji
- Run the pipeline
- Inspect the results
  - Each image is opened in Fiji alongside its labels
  - The nuclei counts are written into the Fiji console
  - The nuclei counts are also saved into `results.tsv` within the dataset directory

## How to run the pipeline
The pipeline is run from the Fiji software itself. After Fiji is open, select `Plugins > Macros > Run` in the toolbar menu and select the `Pipeline.ijm` file in the dialog.
Upon starting, the script will ask you to locate the folder containing the dataset. Please navigate to it and select the dataset folder. The script will then take care of the rest.

## My results
The results I obtained can be found in the file `results.tsv` and opened using either a text or table editor.
