In this exercise, we will create a tidy data base containing the averages of preselected variables from the initial data base, calculated for subject and performed activity.

According to the lectures of the course, our tidy data will satisfy the following properties:

- Each variable forms a column
- Each observation forms a row
- Each table/file stores data about a kind of informaiton

##ORIGINAL DATA SET

- Observed data are provided initially in two separated sets (training and test) with 70% and the reamining 30% of the observations respectively:

"X_train.txt": nº observ.: 7.352, nº variables: 571.

"X_test.txt":  nº observ.: 2.947, nº variables: 571.

- The names of the variables above-referenced are listed in the second column of the "features"-file:

"features.txt": nº row: 571, nºcol:2 

- The same variable names were used for training and testing.

- The identification of the subject of each observation is made through separated files splitted according to the purpose of training or testing:

"subject_train.txt": nº observ: 7.352, nºvariables: 1.

"subject_test.txt":  nº observ: 2.947, nºvariables: 1.

(Each variable value gives out the subject of the observation identified by the corresponding row number)

- The same princip follows the identification of the activity performed by the subject of each observation:

"Y_train.txt": nº observ: 7.352, nºvariables: 1.

"Y_test.txt":  nº observ: 2.947, nºvariables: 1.

- The activity labels are originally to find in the "activiy_labels" file without any reference to the observations.

##DATA PROCESSING

- Training and testing observations will be merged in the delivering data table together.

- The data table to be delivered will consist of the average of the mean and standard desviation variables provided within the initial data sets and they will be calculated for subject and activity.

The selection of the original variables, which the avergage measures will be calculated on, is made by means of their variable names according to the following criterias:

"mean" variables ->    Variables from the features-file which names contain the expression "mean"; nºmatches=46.

"standar" variables -> Same criteria as above but containing the expression "std"; nºmatches=33.

- The name of the new variables will be derived from the initial ones according to the following conversion rules:

"_" character will be substiuted by "."; "()" expression will be substituted by an empty space;

Each new variable will begin with the expression "Avg_".

- The variable "Activity" will be considered in the resulting data table as a factor

- All variables of the delivering data table are reported in the "Code Book" documentation.

## THE RESULTING DATA TABLE

According to the facts exposed above as well as there are 30 subjects in the initial data base and that each of them performs all six activities, the delivered data table will consist of 180 rows and 81 variables.

The observed values correspond to average values of the initial data sets.