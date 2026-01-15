<p align="left">VOICE DENOISING USING FIR/IIR FILTERING TECHNIQUES IN MATLAB</p>

📝 Overview
This project demonstrates a digital signal processing (DSP) approach to removing background noise from real-world audio recordings. By analyzing the spectral content of a noisy sample, a 4th-order Butterworth bandpass filter was designed to isolate voice frequencies and suppress unwanted noise from sources like fans or environmental hum.
+4

🚀 Features

* Spectral Analysis: Utilizes FFT to identify that dominant noise energy lies below 700 Hz.
* Bandpass Filtering: Implements a Butterworth filter to preserve the voice range between 800 Hz and 3200 Hz.
* Zero-Phase Distortion: Employs the filtfilt() function in MATLAB to maintain signal integrity.
* Performance Evaluation: Provides a quantitative improvement in the Signal-to-Noise Ratio (SNR).

📊 Technical Specifications

* Filter Type: IIR Butterworth Bandpass.
* Filter Order: 4.
* Cutoff Frequencies: 800 Hz (Lower) and 3200 Hz (Upper).
* SNR Improvement: From -13 dB (Before) to -9.16 dB (After).

🛠 Prerequisites
To run the code for this project, you will need:

* MATLAB (R2021a or later recommended).
* Signal Processing Toolbox.

💻 Installation & Usage

* Clone the repository:
  
      git clone https://github.com/yourusername/voice-denoising-matlab.git
* Prepare Audio: Place your file noisy_recording.wav in the project directory.
* Execute: Run the MATLAB script to generate time-domain and frequency-domain plots for comparison.

👤 Author Details
* Name: K.P.K.H. Jayaweera
* GitHub: hirushan083
