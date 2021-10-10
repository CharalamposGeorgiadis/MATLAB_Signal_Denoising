# MATLAB_Signal_Denoising
MATLAB app that compares the denoising efficiency of the wdenoise command of MATLAB with that of the waveletAnalyzer app on a stereo signal corrupted by white gaussian noise.
The input clean signal is named "input.mp3".

As for the wdenosie command the most efficient parameters I chose are: 
Level = 8 
DenoisingMethod = 'BlockJS' 
Wavelet = 'sym8'.

As for the waveletAnalyzer app I used the SWT Denoising 1-D tool on the left and right channel separately. They are loaded and combined into a stereo track inside the program. 
The parameters I chose for the waveletAnalyzer app are: 
Wavelet = sym8 
Level = 3 
Thershold = Soft 
Level 1 Threshold = 0.4 for the left channel and 0.27 for the right channel 
Level 2 Threshold = 0.4 for both channels 
Level 3 Threshold = 0.35 for both channels

Finally, plots of the clean signal, the noise signal and the two denoised signals are displayed.
