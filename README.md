
# Comparison of an Average Digit Classifier to a Neural Network Digit Classifier

The following code provides the user with a few scripts to generate the datasets we used along with the code to run the tests of each classifier. We provide the datasets that we used for classification, but the user is free to overwrite them. We warn that the accuracies of each classifier may not be the same if the datasets get overwritten with different digits.

## Creating the Datasets
In order to create each of the datasets, we have designed it so that
only the `genDatasets.m` script needs to be run. By default we have
commented out the calls to generate the `mnistData.mat` and
`fontGenData.mat` files as they can take a long time. We instead provide
those two datasets with this project repository. If one would like to
create each dataset on their own, we detail the steps below.

### The following is used to create the `HWData.mat` file:
1.  Run the `genDataFromMnist.m` file, it should have produced the
    `mnistData.mat` file. Load this file for the next step.

2.  Then call `genTrainTestSets` while passing it the `mnistInputMat`
    and `mnistTargetMat` from `mnistData.mat`. We also pass the percent
    amount of digits to use for training and for testing (we used 90%
    for training and 10% for testing). This function will output four
    matrices, the first two are the input and target matrices for
    training, while the last two are the input and target matrices for
    testing.

3.  Name the input matrices as `trainHW` and `testHW`. Name the target
    matrices as `trainHWTargets` and `testHWTargets`. From here we can
    save all four matrices into the file `HWData.mat`.

### The following is used to create the `FGData.mat` file:

1.  Run the `genTextDigitDataset.m` function by passing it a desired
    font name. We used the *Courier* font, and the function should
    produce the `fontGenData.mat` file. Load this file for the next
    step.

2.  Then call `genTrainTestSets` while passing it the `fontGenInputMat`
    and `fontGenTargetMat` from `fontGenData.mat`. We also pass the
    percent amount of digits to use for training and for testing (we
    used 90% for training and 10% for testing). This function will
    output four matrices, the first two are the input and target
    matrices for training, while the last two are the input and target
    matrices for testing.

3.  Name the input matrices as `trainFG` and `testFG`. Name the target
    matrices as `trainFGTargets` and `testFGTargets`. From here we can
    save all four matrices into the file `FGData.mat`.
    
### The following is used to create the `HWFGData.mat` file:

1.  Create the `mnistData.mat` and `fontGenData.mat` files as in the
    previous steps.

2.  Call `genTrainTestSets` while passing it the `mnistInputMat` and
    `mnistTargetMat` from the `mnistData.mat` file. We also pass the
    percent amount of digits to use for training and for testing (we
    used 27% for training and 5% for testing). This function will output
    four matrices, the first two are the input and target matrices for
    training, while the last two are the input and target matrices for
    testing. Name the input matrices as `trainHW` and `testHW`. Name the
    target matrices as `trainHWTargets` and `testHWTargets`.

3.  Call `genTrainTestSets` while passing it the `fontGenInputMat` and
    `fontGenTargetMat` from `fontGenData.mat`. We also pass the percent
    amount of digits to use for training and for testing (we used 63%
    for training and 5% for testing). This function will output four
    matrices, the first two are the input and target matrices for
    training, while the last two are the input and target matrices for
    testing. Name the input matrices as `trainFG` and `testFG`. Name the
    target matrices as `trainFGTargets` and `testFGTargets`.

4.  After creating all the matrices, we should have eight of them. We
    then join (column-wise) the `trainHW` and `trainFG` into one matrix
    called `trainHWFG`. We do the same for the `testHW` and `testFG`
    into `testHWFG`; similarly we create `trainHWFGTargets` and
    `testHWFGTargets`. This results in four matrices, the training and
    test sets with their targets.

5.  Save the resulting four matrices into `HWFGData.mat`.


## Running the Classifiers
If you would like to run both of the classifiers without any setup, run the `main.m` file after uncommenting the two run calls inside of it. If you would like to run the classifiers individually, you can follow the steps below.


### Running the AVGC
In order to use the average digit classifier, run the
`runTestsForAvrgCl.m` file after having generated all of the datasets.
The result of running the script should produce nine confusion matrices
which detail the precision, recall, and accuracy of the AVGC for each
possible combination of training and test set.

### Running the NNC
In order to create, train, and test the neural networks, simply run the \texttt{runTestForNNCl.m} file after having generated all of the datasets. This script will create each of the three neural networks, then perform tests on each. The results from each test will appear as a confusion matrix, there should be a total of nine confusion matrices which detail the precision, recall, and accuracy of the NNC for each possible combination of training and test set.

We note that all of these steps can also be found in our resulting project paper.