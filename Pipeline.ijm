// INIT
print("\\Clear");

// Get working directories
inputDir = getDirectory("Select the dataset directory");
print("Dataset directory: " + inputDir);

// Open an output csv and print out its header
outputFile = File.open(inputDir + "results.tsv");
print(outputFile, "Image\tCount\n");

// LOOP FILES
// Open the images one by one and process them
imagesToProcess = getFileList(inputDir);
for (i = 0; i < imagesToProcess.length; i++) { 
	imageToProcess = imagesToProcess[i];
	// Ignore subdirectories and the result file
	if (indexOf(imageToProcess, "/") != -1) continue;
	if (indexOf(imageToProcess, "results.tsv") != -1) continue;
    processImage(imageToProcess);        
}

// FINISH
// Close the file (also flushes out the output buffer)
File.close(outputFile);

// PROCESSING
function processImage(imageToProcess) { 
	// Processes a single image from the input and writes out its specific output
	print("Processing image: " + imageToProcess);
	imagePath = inputDir + imageToProcess;
	open(imagePath);
	run("Command From Macro", "command=[de.csbdresden.stardist.StarDist2D], args=['input':'" + imageToProcess + "', 'modelChoice':'Versatile (fluorescent nuclei)', 'normalizeInput':'true', 'percentileBottom':'1.0', 'percentileTop':'99.8', 'probThresh':'0.5', 'nmsThresh':'0.4', 'outputType':'Both', 'nTiles':'1', 'excludeBoundary':'2', 'roiPosition':'Automatic', 'verbose':'false', 'showCsbdeepProgress':'false', 'showProbAndDist':'false'], process=[false]");
	roiManager("Show All with labels");
	nucleiCount = roiManager("count");
	print("Image nuclei count: " + nucleiCount);
	print(outputFile, imageToProcess + "\t" + nucleiCount + "\n");
}