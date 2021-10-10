% This script loads an audio signal and corrupts it with white Gaussian
% noise. It uses the wdenoise command to denoise it, and also loads a 
% denoised signal created with the waveletAnalyzer app. The user can 
% listen to these signals and compare them.

clear all, close all;
% Reading the clean audio signal from the directory
[y, Fs] = audioread('input.mp3');
% Uncomment the following command in order to listen to the clean audio 
% signal
%sound(y, Fs);

% Calculating the time of the signal in seconds in order to display the 
% clean, noise and denoised signals in the time domain
time = linspace(0, length(y) / Fs, length(y));

% Generating a random white noise signal, with the same size as the clean 
% audio signal, from a Gaussian Distribution N(0,0.01)
noise = normrnd(0, 0.01, size(y));
% Adding the noise signal to the clean audio signal 
y_noise = y + noise;
% Uncomment the following command in order to listen to the noise audio 
% signal
%sound(y_noise, Fs);

% Using the wdenoise command to denoise the noise signal
y_wdenoise = wdenoise(y_noise, 8, 'DenoisingMethod', 'BlockJS',... 
'Wavelet', 'sym8');
% Uncomment the following command in order to listen to the denoised audio
% signal created with the wdenoise command
%sound(y_wdenoise, Fs);

% Loading the denoised signal created with the waveletAnalyzer app.
% The following parameters were selected:
% Wavelet: sym8
% Level: 3
% Threshold: Soft
% Level 1 Threshold: left channel: 0.4, right channel: 0.27
% Level 2 Threshold: both channels: 0.4
% Level 3 Threshold: both channels: 0.35
load('DenoisedL.mat');
load('DenoisedR.mat');
y_app_denoised = [DenoisedL' DenoisedR'];
% Uncomment the following command in order to listen to the denoised audio
% signal created with the waveletAnalyzer app
% sound(y_app_denoised, Fs);

% Displaying the figure in fullscreen
figure('units', 'normalized', 'outerposition', [0 0 1 1]);
% Displaying the clean, noise and denoised signals
% Clean Signal
subplot(2,2,1), plot(time, y), title('Original Signal');
xlabel('time(s)'), yticks([-1 -0.5 0 0.5 1]);
% Noise Signal
subplot(2,2,2), plot(time, y_noise), title('Noise Signal');
xlabel('time(s)'), yticks([-1 -0.5 0 0.5 1]);
% Denoised signal created by wdenoise
subplot(2,2,3), plot(time, y_wdenoise);
title('Denoised Signal using the wdenoise command');
xlabel('time(s)'), ylim([-1 1]), yticks([-1 -0.5 0 0.5 1]);
% Denoised signal created by waveletAnalyzer
subplot(2,2,4), plot(time, y_app_denoised);
title('Denoised Signal using the waveletAnalyzer app');
ylim([-1 1]), yticks([-1 -0.5 0 0.5 1]), xlabel('time(s)');
