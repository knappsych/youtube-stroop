#Codebook for rawdat.csv

The data in raw.csv represent data my Winter and Spring 2015 students emailed me after
participating in my 
[YouTube Stroop Experiment](https://www.youtube.com/watch?v=djUgM2GjudE)
in exchange for course credit. These data
were compiled using the preprocessing.R R script and are suitable for data analysis.

It should be noted that the data contain some values that are impossible to obtain
when properly completing the experiment. The stimuli for the Stroop Task appeared
at 29.0 seconds. However, 7 participants reported response times of 29 seconds or less.

The data file includes 6 variables.

* **quarter**: A factor variable indicating the academic quarter in which the participants
participated (Winter or Spring)
* **group**: A factor variable indicating the group participants were in by virtue of their
birth month. This variable determined the order of the stroop tasks (congruent and
incongruent) and wordlists (list 1 and list 2). The months associated with the four groups
and ordering are listed below.
    1. January, May, and September
        * Incongruent List 1 followed by Congruent List 2
    2. February, June, and October
        * Congruent List 1 followed by Incongruent List 2
    3. March, July, and November
        * Incongruent List 2 followed by Congruent List 1
    4. April, August, and December
        * Congruent List 2 followed by Incongruent List 1
* **sub**: A factor variable identifying individual participants.The time in the video
that they completed the congruent Stroop task.
* **congruence**: A factor variable indicating the Stroop condition for the observation
(congruent or incongruent).
* **order**: A factor variable indicating the order of the tasks (see group, above).
* **rt**: The time in the video that they completed the incongruent Stroop task. This
should not be interpreted as the amount of time it took them to respond after the Stroop
stimuli were presented.