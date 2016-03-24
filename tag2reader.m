function [ i ] = tag2reader( signal, i, average, delimiter_th)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

tr_end=i;
while(signal(tr_end)>average && tr_end< length(signal))
    tr_end = tr_end+1;
end
tr_end = tr_end-delimiter_th; %we want to stop slightly before the delimiter


tr_high = max(signal(i:tr_end));
tr_low = min(signal(i:tr_end));

tr_average = mean(signal(i:tr_end));
%%% determine period + preamble

[ period, i ] = tag2reader_preamble( signal, tr_average, i, tr_high, tr_low);


[ string i ] = decode_receiver( signal, tr_average, i, period);
fprintf('Tag->Reader\n');
fprintf('%x', string);
fprintf('\n');


end

