# Gabrielle Work Log

## April 19
- Created the github repo for DSS Spring 2024
- Picked datasets chosen from DSS canvas page & downloaded them into repo
	- Obesity
	- Student
	- Spotify
- Created an explore r code for each chosen dataset
- Created folders to hold datasets and exploration code

## March 22
- DSS meeting
- Copy-pasted work log from We-R-Finished into repo
- Student Exploration R Code
	- Read in dataset
	- Renamed columns
	- Went to define columns, but stopped when realizing there are a lot of inputs
	- Decided to not do student dataset (for now)
	- Included an evaluation log 
- Obesity Exploration R Code
	- Read in dataset
	- Renamed some columns
	- Turned categorical cols into factors for summary
- Spotify Exploration R Code
	- Read in dataset
	- Viewed dataset for further consideration
	- Zayne has done something similar with this, probably would need more time
	- Especially since this includes songs, maybe group into genre?
	- No, there's multiple tags in genre, this could be difficult
- Obesity will be the one I'll use for the project

## April
- Obesity explore
	- Renamed columns
	- summary of data
	- began to split train & test data
	- ran into problems with trying to do a fit
		- glm(Obesity.Lvl ~ .)
	- think at first I picked the wrong data
	- then fit wasn't converging
	- realized I couldn't do a fit with all the variables

## May 2
- Started doing fits
	- Got as far as the linears and beginnings of two predictors

## May 3
- Continued doing fits
	- Getting through the two predictors
	- Trying 15 predictor fit
	- Might just do maxfit3
	- Put together fit of the passing linear fits just to try

## May 4
- Made a plot specific script
	- libraries, read-in, and column names
	- variables
	- pie chart/histogram/scatterplot/boxplot
- Made dupe of dataset to fool around with
	- made some charts
	- renamed vars
	- some formatting

## May 5
- New script for doing the accuracy tests
	- QDA (had a bit of trouble, but managed)
	- LDA (had a bit of trouble, but managed)
	- KNN (skip, some sort of error)
	- Best subset selection (forgot to save & commit, will apear in May 7)
- Did try with insufficient weight removed
	- didn't work

## May 7
- Began slides presentation prep
	- slides template chosen from SlidesCarnival
	- starting with the basics of the dataset

## May 9
- Redid fits to find better one
	- based on best subset selection
	- Made some headway
- Worked on slides

## May 10
- Had to fix fits again
	- methods & prediction were either not working or did not produced desired results
- Worked on slides 
	- Google
	- Powerpoint
- Finished slides