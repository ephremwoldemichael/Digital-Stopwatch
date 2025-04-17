% Record a short audio clip
recObj = audiorecorder;  % Create an audiorecorder object
disp('Start speaking.');
recordblocking(recObj, 10); % Record for 10 seconds
disp('End of recording.');

% Get the recorded voice data and the sampling frequency
voiceData = getaudiodata(recObj);
fs = recObj.SampleRate;

% Perform frequency analysis
nfft = length(voiceData); % Number of FFT points
Y = fft(voiceData, nfft); % Perform FFT
f = (0:nfft-1)*(fs/nfft); % Frequency range

% Plot the unsampled signal
t = (0:(length(voiceData)-1))/fs; % Time vector
figure;
subplot(2, 2, 1);
plot(t, voiceData);
xlabel('Time (s)');
ylabel('Amplitude');
title('Unsampled Audio Signal');

% Downsample the signal (for demonstration purposes)
downsampleFactor = 4;
voiceData_downsampled = downsample(voiceData, downsampleFactor);
fs_downsampled = fs / downsampleFactor;

% Perform frequency analysis of the downsampled signal
nfft_downsampled = length(voiceData_downsampled);
Y_downsampled = fft(voiceData_downsampled, nfft_downsampled);
f_downsampled = (0:nfft_downsampled-1)*(fs_downsampled/nfft_downsampled);

% Plot the sampled signal
t_downsampled = (0:(length(voiceData_downsampled)-1))/fs_downsampled;
subplot(2, 2, 2);
plot(t_downsampled, voiceData_downsampled);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sampled Audio Signal');

% Noise filtering
cutoffFreq = 3000/(fs/2); % Set the cutoff frequency of the low-pass filter (in Hz)
[b, a] = butter(6, cutoffFreq, 'low'); % Design a Butterworth low-pass filter with a 6th order
filteredVoice = filter(b, a, voiceData);
filteredVoice_downsampled = filter(b, a, voiceData_downsampled);

% Plot the filtered unsampled signal
subplot(2, 2, 3);
plot(t, filteredVoice);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered (Analog) Audio Signal');

% Plot the filtered sampled signal
subplot(2, 2, 4);
plot(t_downsampled, filteredVoice_downsampled);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered (Sampled) Audio Signal');

% Amplify the voice signal
amplifiedVoice = 2 * filteredVoice; % Amplify the voice data by a factor of 2 (adjust as needed)

% Play back the modified audio
sound(amplifiedVoice, fs); % Play back the modified audio at the original sampling frequency
