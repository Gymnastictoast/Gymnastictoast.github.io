---
layout: single
title: $\tilde{\chi}^2$ vs Histogram binning
permalink: RedChiSq
---
# Title
## secon dlevel

In my intermediate physics lab course I did an experiment in which we attempted to determine the lifetime of a Muon using a table top detector. We can detect both when Muon's enter the dectector and when they decay in the detector. So we wait for Muons to decay while inside our detector and making a histogram of decay times and fit this to an exponential decay model.


While doing this I noticed that simply chaning my historgram bin size could have a large effect on my result and so wrote some python loops to test out multiple bin sizes. In doing so I ended up coming up with a better scheme for rejecting the suspect first few bins and choosing initial guess which helped reduce the variability in the final values. Nonetheless it is important to keep in mind that histogramming necssarily distorts your data as is hinted at in the plot below. This is a plot of the $\tilde{\chi}^2$ for my fits vs the number of bins `(`inverse of bin size`)`. I went to the trouble of making this plot nice and interactive and having a website seemed the easiest solution to share it with my professor and so now I have a website.  

The python notebook used for the analysis can be seen
