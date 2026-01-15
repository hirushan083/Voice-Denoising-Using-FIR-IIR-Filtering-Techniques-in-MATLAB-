%Importing the recorded noisy audio
[noisy_audio, Fs] = audioread('C:\Users\User\Downloads\noisy_recording.wav');

size(noisy_audio) %check if the audio file is stereo
noisy_audio = noisy_audio(:,1); 

%Plotting time-domain waveform
t = (0:length(noisy_audio)-1)/Fs;
subplot(2,2,1)
plot(t, noisy_audio);
xlabel('Time');
ylabel('Amplitude');
title('Time-domain waveform of Noisy Audio');

%plotting frequency spectrum(using fft)
n = length(noisy_audio);
f = (0:n-1)*(Fs/n);  
Y = abs(fft(noisy_audio));

subplot(2,2,2)
plot(f(1:floor(n/2)), Y(1:floor(n/2))); 
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Noisy Audio');

%Using butter() built-in function
order = 4; %selecting filter order as 4
cutoff_frequency = [800 3200] / (Fs/2);
[b, a] = butter(order, cutoff_frequency, 'bandpass'); %use bandpass filter
fvtool(b, a); %Filter response visualization

%Applying filter using filtfilt()
filtered_audio = filtfilt(b, a, noisy_audio);
filtered_audio = filtered_audio / max(abs(filtered_audio));%Normalization of the filtered audio

n_filt = length(filtered_audio);       
Y_filt = fft(filtered_audio);          
f_filt = (0:n_filt-1)*(Fs/n_filt);     

% Plotting the Time-domain waveform of Filtered Audio
t = (0:length(filtered_audio)-1)/Fs;
subplot(2,2,1)
plot(t, filtered_audio);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-domain waveform of Filtered Audio');

% Plotting Frequency Spectrum of Filtered Audio
subplot(2,2,2)
plot(f_filt(1:floor(n_filt/2)), abs(Y_filt(1:floor(n_filt/2))));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Filtered Audio');

% Compute SNR before filtering and after filtering using snr() function
snr_before_filtering = snr(noisy_audio);
snr_after_filtering = snr(filtered_audio);

fprintf('SNR before Filtering: %.2f dB\n', snr_before_filtering);%SNR value of before filtering 
fprintf('SNR after Filtering: %.2f dB\n', snr_after_filtering);%SNR value of after filtering

%playing the filtered audio
sound(filtered_audio, Fs);

%Saving filtered audio to the PC
audiowrite('C:\Users\User\Downloads\Filtered Audio.wav', filtered_audio, Fs);
disp('Filtered output saved as "filtered Audio.wav"');
