function [ i ] = reader2tag( signal, i, delimiter_th, average, highest, lowest)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


j=1;
while(j<delimiter_th && i< length(signal))
    if(signal(i)<average)
        j=j+1;
    else
        j=0;
    end
    i=i+1;
end


while(signal(i)<average && i< length(signal))
   i=i+1; 
end


%% Detect preamble %%

%%% Find Tari length %%%
[ length_0, i ] = detect_preamble( signal, i , average);


%%% decode binary message %%%
[ string i ] = decode_transmitter( signal, average, i, length_0);

fprintf('Reader->Tag\n');
fprintf('%x', string);
fprintf('\n');

end

