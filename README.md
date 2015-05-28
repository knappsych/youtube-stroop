#PSY 441 Capstone Project Example Using Real Data

###William H. Knapp III

##Introduction

This repository contains a demonstration for what I'm looking for in my students'
Senior capstone projects. If you're one of my students, please take a close look
at this repository noting the way I've structured my folders and the files that
are included. Your files will be different as you've performed different
experiments, but this should give you a great idea of what I want.

Remember, if you're wondering how I did something in the repository, take a look
at the code.

The data, analyses, images, and presentations all represent a reproducible real
world example. The data come from my
[YouTube Stroop Experiment](https://www.youtube.com/watch?v=djUgM2GjudE). They
were processed and analyzed in R. Results of these analyses were written up
in a poster that was presented at the 2015 Annual Convention for the Association
for Psychological Science.

##Guide to the Repository Contents
* **data**: a folder containing the following.
    * data files
        * 440Winter2015.csv: Data from my Winter 2015 capstone course.
        * Spring2015.csv: Data from my Spring 2015 courses.
        * rawdat.csv: The compiled data with information about other variables suitable
        for analysis.
    * code books that explain the data in the data files.
    * analysis files
        * preprocessing.R: The file I used to combine data from Winter and Spring quarters
        and create the rawdat.csv file.
        * analysis.Rmd: An R Markdown file that walks through my data analyses and creates
        the figure I used in my poster.
        * analysis.R: An R script that does everything analysis.Rmd does without the
        markdown. Choose your poison.
    * fig1.png: The figure I created for the presentation
* **materials**: a folder containing materials used in the experiments. To minimize
the size of this repository, many files used to create the videos are missing, but
the end products can be found in the above link to the experiment.
    * IRB Approval.pdf: an edited version of IRB approval for this project with my
    primary email blurred out.
    * WLMP files: The Movie Maker files I used to create the consent and experimental
    conditions.
    * A blend file: The Blender file I used to create the debriefing.
    * pptx presentation files: The PowerPoint files I used to create stimuli for the
    experimental conditions and debriefing.
* **presentation**: A folder containing the presentation materials that includes:
    * APS 2015.pdf: A pdf of the poster used for printing and distribution.
    * APS 2015.ppts: A presentation file used to create the poster.
    * README.md: A markdown file linked to a 
    [video walkthrough](https://www.youtube.com/watch?v=QD49sR2k3AQ) of the presentation.

Cheers,

[William](http://wknapp.com)