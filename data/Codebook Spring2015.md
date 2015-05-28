#Codebook for Spring2015.csv

The data in Spring2015.csv represent data my Spring 2015 students emailed me after
participating in my \href{https://www.youtube.com/watch?v=djUgM2GjudE}{YouTube
Stroop Experiment} in exchange for course credit. These data were hand coded from the
emails in a format different from those for my Winter 2015 students. Both data sets were 
combined using the preprocessing.R R script in the rawdat.csv file that's suitable for
analysis.

The data file includes 4 variables.

* **Condition**: The condition participants participated in. The condition determined
the order of the stroop tasks that they participated in. Students were instructed
to select a condition based on their month of birth. Students reported condition by
either indicating the condition number that appeared in the informed consent video or
by reporting their month of birth.
* **T1**: The time in the video that they completed their first Stroop task.
* **T2**: The time in the video that they completed their second Stroop task.
* **Loading Problem**: Participants were instructed to indicate whether or not there
was a pause during the experiment while YouTube loaded the video. Many participants
failed to indicate whether they experienced a problem. However, only a single student
reporting for this variable indicated that they had a problem and their data is inline
with other data from that condition, so it appears this problem occurred outside of the
presentation of the critical stimuli. These data will not be analyzed further.