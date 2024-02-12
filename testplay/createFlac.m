% set-up parameters
fs = 44100; % samplingfrequency 
stim_dur = .20; % duration of puretone in seconds
soa = 1; % sound onset asincrony in seconds
tot = 2; % total duration
ramp_dur = .005; % ramp duration in seconds
f = 880;  % sound frequency (la4)
amp = 0.8; % sound amplitude

out = zeros(1,floor(tot*fs));
trig = zeros(1,floor(tot*fs));

%create bip

ts=0:1/fs:stim_dur-1/fs;
xt=sin(2*pi*f*ts) * amp;

%setup ramp
rampSamps = floor(fs*ramp_dur);
window=hanning(2*rampSamps)'; %hanning window is cosine^2 this will change depending on the kind of ramp you want
w1=window(1:ceil((length(window))/2)); %use the first half of hanning function for onramp
w2=window(ceil((length(window))/2)+1:end); %use second half of hanning function of off ramp
w_on_xt = [w1 ones(1,length(xt)-length(w1))];
w_off_xt = [ones(1,length(xt)-length(w2)) w2];
la = xt.*w_on_xt.*w_off_xt; 
len = size(la,2);

onset = soa*fs-1;
out(1,onset:onset+len-1) = la;
trig(1,onset:onset+len-1) = amp;

% play the sound
sound(out,fs);

% create muliple channels audio data
mono = [out'];
stereo = [out' out'];
monoT = [out' trig'];
stereoT = [out' out' trig'];

% save muliple channels audio data
audiowrite('soundM.flac', mono, fs, 'BitsPerSample',16); % mono
audiowrite('soundS.flac', stereo, fs, 'BitsPerSample',16); % stereo sound on both channels
audiowrite('soundMT.flac', monoT, fs, 'BitsPerSample',16); % sound on ch1, trigger (square wave) on ch2
audiowrite('soundST.flac', stereoT, fs, 'BitsPerSample',16); % stereo on ch1 and ch2, trigger (square wave) on ch3
