% Erotima 1/5 Code
clc; % Clear the Command Window
% Read Source B from file 'kwords,txt'
srcb = char(fread(fopen('kwords.txt')));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial Alphabet & Symbol probabilities of Source A
abet0a = ('a':'z');
prob0a = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, ...
 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095,
...
 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02361, 0.00150, 0.01974, 0.00074];
% New Alphabet of Source A
abet1 = nchoosek(['a':'z', 'a':'z'], 2);
abet1 = char(unique(cellstr(abet1)).');
% Compute probability of each pair of Source A alphabet
prob1 = zeros(length(abet1),1);
for i = 1:length(abet1)
 ch1 = strfind(abet0a, abet1(i,1));
 ch2 = strfind(abet0a, abet1(i,2));
 prob1(i,1) = prob0a(1,ch1) * prob0a(1,ch2);
end
% Convert Uppercase letters to Lowercase and remove extra characters of Source B
srcb1 = lower(fscanf(fopen('kwords.txt'),'%s'));
srcb1(regexp(srcb1,'[''/.-]'))=[];
srcb1 = cellstr(reshape(srcb1,2,[])');
% Begin Huffman decoding of Source B with probabilities of Erotima 1/4
abet1 = cellstr(abet1);
set(0,'RecursionLimit',1000);
[dict1, len1] = my_hdict(abet1, prob1);
enco1 = my_henco(srcb1, dict1);
deco1 = my_hdeco(enco1, dict1);
% Print success / failure message onscreen
if (isequal(srcb1,deco1))
 fprintf(1, 'Huffman decoding of Source B was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len1);
else
 fprintf(1, 'Huffman decoding of Source B was not successful!\n');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find initial alphabet of Source B
abet0b = unique(srcb).';
% Compute initial probability of each alphabet symbol of Source B
i = 1;
prob0b = zeros(1, length(abet0b));
for j = 1:length(abet0b)
 ch = strfind(srcb.', abet0b(j));
 prob0b(i) = length(ch)/length(srcb);
 i = i+1;
end
% New Alphabet of Source B
abet2 = nchoosek([abet0b, abet0b], 2);
abet2 = char(unique(cellstr(abet2)));
% Split Source B in 2-char cells & find new alphabet
%srcb2 = cellstr(reshape(srcb,2,[])');
%abet2 = char(unique(srcb2));
% Compute new probability of each pair of symbols of Source B
prob2 = zeros(length(abet2),1);
for i = 1:length(abet2)
 ch3 = strfind(abet0b, abet2(i,1));
 ch4 = strfind(abet0b, abet2(i,2));
 prob2(i,1) = prob0b(1,ch3) * prob0b(1,ch4);
end
% Begin Huffman decoding of Source B with probabilities of Erotima 1/5
abet2 = cellstr(abet2);
srcb2 = cellstr(srcb2);
[dict2, len2] = my_hdict(abet2, prob2);
enco2 = my_henco(srcb2, dict2);
deco2 = my_hdeco(enco2, dict2);
% Print success / failure message onscreen
if (isequal(srcb2,deco2))
 fprintf(1, 'Huffman decoding of Source B was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len2);
else
 fprintf(1, 'Huffman decoding of Source B was not successful!\n');
end
