%% README %%
% Before running the program make sure you load the signal as a variable
% called signal in the MATLAB workspace

%% Init %%
clc;
delimiter_th = 20;


highest = max(signal);
lowest = min(signal);
average = (lowest+highest)/2;

%% Detect delimiter %%
%%% Track average %%%
i=2;
while(i<length(signal))
    [ i ] = reader2tag( signal, i, delimiter_th, average, highest, lowest);
    [ i ] = tag2reader( signal, i, average, delimiter_th);
end




