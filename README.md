# Development-of-an-algorithm-for-diagnosing-hearing-impairment-in-patients-using-ABR-peak-detection

This algorithm is implemented in matlab.

# Background 

* Development of an algorithm for diagnosing hearing impairment in patients using ABR peak detection<br>
  ABR (auditory brainstorm response) observes stimulation by sound waves through EEG and is used as a diagnosis for hearing threshold or auditory nerve tumors.<br>
  Brain stimulation through sound waves can be observed through EEG, and the presence or absence of hearing loss can be determined through latency and the location of EEG peak points dependent to the stimulus intensity of sound waves.
  
  * Purpose<br>
    The purpose of this research is to develop an algorithm that helps in diagnosing hearing impairment by detect ing ABR peaks.
    
# Experimental results

* Preprocess of the data
  * Digitalization for the ABR data<br>
    First, for signal analysis, image data was digitalized into 1-dimension ABR wave.<br>
      EX) 75dB<br>
      ![image](https://user-images.githubusercontent.com/86009768/140023678-fcf0d77f-6dae-4bd0-a7d0-7935c12108d1.png)

* Candidate Peak points detection to find ABR peaks
  * Peak and valley detection <br>
    * Y Zhang et al, “An Adaptive Dual-Window Step Detection Method for a Waist-Worn Inertial Navigation System”, The Journal of Navigation, 2016<br>
      Dual window method - By shifting two windows in pairs, the position becomes a peak or valley point when the position of the largest or smallest value within each window range is the same.<br>
      Ex) Valley and peak detection of 75dB ABR signal
         1) Dual window method<br>
            ![image](https://user-images.githubusercontent.com/86009768/140025396-ec9dddeb-bc81-4c48-bb42-5fb7462d8ddc.png)<br>
         2) Valley and peak detection of 75dB ABR signal<br>
            ![image](https://user-images.githubusercontent.com/86009768/140025544-926043ca-022c-4a20-862f-70eeb4f50ac1.png)
         3) Candidate peak points detection - Candidate peaks are determined up to the 8th largest difference between valley and peak.<br>

                

      
 
