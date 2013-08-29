% Band-Pass filter
clc;
clear all;
close all;
[y,Fs,bits]=wavread('test');
Nsamps=length(y);
t=(1/Fs)*(1:Nsamps);
y=y(:,1);
y_fft=fft(y);
f =(Fs/Nsamps)*(0:Nsamps-1);

figure(1)
plot(t,y);
xlabel('Time','FontSize',12);
ylabel('Amplitude','FontSize',12);
title('Original Signal','FontSize',12);
sound(y,Fs);

figure(2)
plot(f,abs(y_fft));
xlabel('Frequency','FontSize',12);
ylabel('|Orginal Signal(t)|','FontSize',12);
title('Single Sided Spectrum of Y(t)','FontSize',12);

min_l = (300*Nsamps)/Fs;
max_l = (1000*Nsamps)/Fs;
for k=1:length(f)
    if f(k) <= min_l
        z(k)=0;
    elseif f(k) >= max_l
        z(k)=0;
    else
        z(k)=y_fft(k);
    end
end

voi=real(ifft(z));

figure(3)
plot(t,voi);
xlabel('Time','FontSize',12);
ylabel('Amplitude','FontSize',12);
title('Only Vocals of Signals','FontSize',12);

sound(voi,Fs);