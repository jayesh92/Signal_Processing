% Stereo Cancellation
clc;
clear all;
close all;
[y,Fs,bits]=wavread('test');
y1=y(:,1);
y2=y(:,2);
sub=y1-y2;
sound(sub,Fs);