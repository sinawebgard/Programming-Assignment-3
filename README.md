##R Programming - Assignment 3
####Coursera's Data Science Specialisation


###Introduction

This repo contains the data and solutions for the final practical assignment in Coursera's R Programming course as part of Data Science Specialisation.

You don't need to download the data as each function (as a solution to a specific task) will check whether the necessary data is stored on your local computer and if required, downloads the relevant data in zip format and unzip it on fly.

The R script, FUN.R contains three stand-alone functions which download and read data before arrange it in a specific order defined by the assignment instructions. 

**Please note** that if you are doing this assignment as part of your Coursera course you are asked to save each function in a stand-alone R file. However since the format of the course has changed you do not need to upload the files one by one and instead, you answer questions in a multi choice quiz. Therefore it won't make a difference if you save all functions in a single file.

###Data

The data for this assignment come from the [Hospital Compare web site](http://hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and
information about the quality of care at over 4,000 Medicare-certi ed hospitals in the U.S. This dataset essentially covers all major U.S. hospitals.  This dataset is used for a variety of purposes, including determining
whether hospitals should be fined for not providing high quality care to patients. [Read more for some background on this particular topic](http://goo.gl/jAXFX).
The  Hospital  Compare  web  site  contains  a  lot  of  data  and  we  will  only  look  at  a  small  subset  for  this
assignment. The zip file for this assignment contains three file which you can find in the [data](/data) folder.
- outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
- hospital-data.csv: Contains information about each hospital.
- Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).