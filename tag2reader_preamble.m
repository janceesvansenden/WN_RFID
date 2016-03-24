function [ period, i ] = tag2reader_preamble( signal, tr_average, i, tr_high, tr_low)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if(i<length(signal))
    while(signal(i)>tr_average || signal(i-1)-signal(i)<(tr_high-tr_low)/4 )
        i=i+1;
        if(i>length(signal))
            break;
        end
    end
end

period=0;
while(signal(i)<tr_average && i<length(signal))
    i=i+1;
    period=period+1;
end

rising_edge = 1;
for(j=1:6)
    while(signal(i)*rising_edge>tr_average*rising_edge && i<length(signal))
        i=i+1;
    end
    rising_edge = -rising_edge;
end


end

