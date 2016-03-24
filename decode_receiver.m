function [ string i ] = decode_receiver( signal, tr_average, i, period)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
j=0;
string = [];
rising_edge=1;

while(1)
    while(signal(i)*rising_edge>tr_average*rising_edge && i< length(signal))
        j=j+1;
        i=i+1;
        if(j>4*period)
            break;
        end
    end
    
    if(j>4*period || i>=length(signal))
       break;
    end
    
    if(j<0.75*period)
        string = [string 0];
        while(signal(i)*rising_edge<tr_average*rising_edge)
            i=i+1;
        end
    else
        string = [string 1];
        rising_edge = -rising_edge;
    end
    j=0;
end

end

