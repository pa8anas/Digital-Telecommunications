% Erotima 1/3 Code
clc; % Clear the Command Window
% Read Source B from file 'kwords,txt'
srcb = fscanf(fopen('kwords.txt'),'%s');
% Find alphabet of Source B
abet = (unique(srcb)).';
% Compute probability of each alphabet symbol of Source B
i = 1;
prob = zeros(1, length(abet));
for j = 1:length(abet)
 ch = strfind(srcb, abet(j));
 prob(i) = length(ch)/length(srcb);
 i = i+1;
end
% Begin Huffman decoding of Source B
srcb = srcb.';
abet = cellstr(abet);
[dict, len] = my_hdict(abet, prob);
enco = my_henco(srcb, dict);
deco = char(my_hdeco(enco, dict));
% Print success / failure message onscreen
if (isequal(srcb,deco))
 fprintf(1, 'Huffman decoding of Source B was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len);
else
 fprintf(1, 'Huffman decoding of Source B was not successful!\n');
end
