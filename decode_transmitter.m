function [ string i ] = decode_transmitter( signal, average, i, length_0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
j=0;
string = [];
while(1)
    while(signal(i)>average && i< length(signal))
        j=j+1;
        i=i+1;
        if(j>5*length_0)
            break;
        end
    end

    if(j<length_0*1.5)
       string = [string 0]; 
    elseif (j<length_0*5)
       string = [string 1]; 
    else
       break;
    end
    
    while(signal(i)<average && i< length(signal))
        i=i+1; 
    end

    j=0;
end

i=i-4*length_0;
end

