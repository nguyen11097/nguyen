[data, fs] = audioread('orig_input.wav'); %Doc lai file ghi am
[rows colums] = size(data);                 %Size cua ma tran data
t = 0 : 1/fs : 0.9;                         %Truc thoi gian
f1 = 410;                                   %Tan so
f2 = 2 * f1;
f3 = 3 * f1;
f4 = 4 * f1;
f5 = 5 * f1;

A1 = .3; A2 = A1/2; A3 = A1/3; A4 = A1/4; A5 = A1/5; 
w = 0;

y1 = A1 * sin( 2 * pi * f1 * t + w );
y2 = A2 * sin( 2 * pi * f2 * t + w );
y3 = A3 * sin( 2 * pi * f3 * t + w );
y4 = A4 * sin( 2 * pi * f4 * t + w );
y5 = A5 * sin( 2 * pi * f5 * t + w );

y = [y1 y4 y3 y3 y3 y5 y3 y2 y1 y4 y3 y3 y3 y5 y3 y2];
data_new = y(1:length(data));
%Tron 2 tin hieu lai voi nhau
for i = 1:colums
    for j = 1:rows
        data_new(j+i) = data(j,i) + y(i+j);
        
    end
end

audiowrite('melody.wav', data_new, fs);
[data_meloly fs_melody] = audioread('melody.wav');