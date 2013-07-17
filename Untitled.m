%Read in the sound 
[data Fs] = wavread('cagefighter.wav');   
%Analyze the frequency components.  
y=2*abs(fft(data))/length(data);   
%Remove non-relevant data. 
y = y(1:end/2);  
%Calculate the maximum frequency that can be perceived. 
f_nyquist = Fs/2;  
%Generate the frequency vector that corresponds with y 
x=linspace(0,f_nyquist,length(y));  
%Find strongest magnitude 
[y_max index] = max(y);  
%Look up the frequency that corresponds with the strongest magnitude 
f_principle = x(index);  
%Plot frequency versus frequency componant magnitude, circle f_max 
figure 
plot(x,y,f_principle,y_max,'o')  
xlabel('Frequency (Hz)') 
ylabel('Normalized Magnitude (0-1)') 
title('Frequency Domain Plot of Sound') 