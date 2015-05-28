#Codebook for 440Winter2015.csv

The data in 440Winter2015.csv represent data my Winter 2015 students emailed me after
participating in my \href{https://www.youtube.com/watch?v=djUgM2GjudE}{YouTube
Stroop Experiment} in exchange for course credit. These data were hand coded from the 
emails in a format different from those for my Spring 2015 students. Both data sets were 
combined using the preprocessing.R R script in the rawdat.csv file that's suitable for
analysis.

The data file includes 3 variables.

* **Condition**: The condition participants participated in. The condition determined
the order of the stroop tasks that they participated in. Students were instructed
to select a condition based on their month of birth. Students reported condition by
either indicating the condition number that appeared in the informed consent video.
* **Inongruent**: The time in the video that they completed the congruent Stroop task.
* **Congruent**: The time in the video that they completed the incongruent Stroop task.