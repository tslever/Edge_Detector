
# SOURCE_FILES must be in format [FILENAME][SPACE][FILENAME][SPACE][FILENAME]...
# [FILENAME] cannot be in quotes.
SOURCE_FILES = DetectEdges.cu GetFilenamesOfTrainingImages.cpp GetFilenamesOfEncodingsForTrainingImages.cpp GetInputTensorOnHost.cpp DisplayImagesInActivationOutputTensor.cpp

HEADER_FILES = GetFilenamesOfTrainingImages.h GetFilenamesOfEncodingsForTrainingImages.h GetInputTensorOnHost.h DisplayImagesInActivationOutputTensor.h

# INCLUDE_DIRECTORIES must be in format [PATH],[PATH],[PATH]...
# [PATH] may be written without quotes if [PATH] does not contain a space.
# For uniformity, I have enclosed all paths in quotes.
INCLUDE_DIRECTORIES = "C:\Users\thoma\Documents\GitHub\Tom_Levers_Git_Repository\DetectEdges","C:\opencv_4.5\build\include","C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.3\include"

# LIBRARIES_TO_LINK must be in the format [PARTIAL_PATH],[PARTIAL_PATH],[PARTIAL_PATH]...
# [PARTIAL_PATH] consists of path to directory of library and prefix of library filename.
# [PARTIAL_PATH] may be written without quotes.
# For uniformity, I have enclosed all partial paths in quotes.
# [PARTIAL_PATH] cannot have spaces.
# My workaround was to add "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.3\lib\x64" to
# Control Panel -> System and Security -> System -> Change Settings -> Advanced ->
# Environmental Variables -> System Variables -> Path -> New.
LIBRARIES_TO_LINK = "C:\opencv_4.5\build\x64\vc15\lib\opencv_world452","cudnn"

# PREFIX_OF_OUTPUT_FILE_NAME may be written without quotes.
# I do not write filenames with spaces.
PREFIX_OF_NAME_OF_OUTPUT_FILE = "DetectEdges"

# Make output file whenever a source file or a header file changes.
# Use the nvcc driver of the g++ compiler.
# Output severe, significant, production-quality, and informational compiler warnings.
# Reference include directories (i.e., directories of header files).
# Reference directories of libraries.
# Specify the prefix of the name of the output file.
makeTrainConvolutionalNeuralNetwork: $(SOURCE_FILES) $(HEADER_FILES)
	nvcc --compiler-options -W4 $(SOURCE_FILES) -I $(INCLUDE_DIRECTORIES) -l $(LIBRARIES_TO_LINK) -o $(PREFIX_OF_NAME_OF_OUTPUT_FILE)