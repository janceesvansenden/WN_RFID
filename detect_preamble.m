function [ length_0, i ] = detect_preamble( signal, i , average)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

length_0 = 0;
while(signal(i)>average && i< length(signal))
    length_0 = length_0+1;
    i=i+1;
end

while(signal(i)<average && i< length(signal))
   i=i+1; 
end

%%%Get past callibration R->T, T->R
while(signal(i)>average && i< length(signal))
   i=i+1; 
end

while(signal(i)<average && i< length(signal))
   i=i+1; 
end

end

