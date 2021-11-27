% Erotima 1/4 Code
clc; % Clear the Command Window
% Initial Alphabet & Symbol probabilities of Source A
abet0 = ('a':'z');
prob0 = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, ...
 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095,
...
 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02361, 0.00150, 0.01974, 0.00074];
% New Alphabet of Source A
abet = nchoosek(['a':'z', 'a':'z'], 2);
abet = char(unique(cellstr(abet)).');
% Compute probability of each pair (alphabet symbol) of Source A
prob = zeros(length(abet),1);
for i = 1:length(abet)
 ch1 = strfind(abet0, abet(i,1));
 ch2 = strfind(abet0, abet(i,2));
 prob(i,1) = prob0(1,ch1) * prob0(1,ch2);
end
% Create Source A (5000 pairs of random lowercase characters)
srca1 = char(randsrc(5000,1,[(97:122); prob0]));
srca2 = char(randsrc(5000,1,[(97:122); prob0]));
srca = strcat(srca1, srca2);
% Begin Huffman decoding of Source A
abet = cellstr(abet);
srca = cellstr(srca);
set(0,'RecursionLimit',1000);
[dict, len] = my_hdict(abet, prob);
enco = my_henco(srca, dict);
deco = my_hdeco(enco, dict);
% Print success / failure message onscreen
if (isequal(srca,deco))
 fprintf(1, 'Huffman decoding of Source A was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len);
else
 fprintf(1, 'Huffman decoding of Source A was not successful!\n');
end
