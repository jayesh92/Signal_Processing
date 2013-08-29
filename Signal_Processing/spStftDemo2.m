% Spectrogram
function spStftDemo2
 [x, fs] = wavread('test');
 x=x(:,1);
 frame_overlap = 10;
 frame_length  = 20;
 window = 'rectwin';

 nfft = round(frame_length  * fs / 1000);
 noverlap = round(frame_overlap * fs / 1000);
 window   = eval(sprintf('%s(nfft)', window));

 [S, F, T, P] = spectrogram(x, window, noverlap, nfft, fs);
 spectrogram(x, window, noverlap, nfft, fs, 'yaxis');