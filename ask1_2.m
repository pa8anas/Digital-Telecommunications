% Erotima 1/2 Code
clc; % Clear the Command Window
% Alphabet & Symbol probabilities of Sources A & B
abet1 = cellstr(('a':'z')');
prob1 = [0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, ...
 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095,
...
 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02361, 0.00150, 0.01974, 0.00074];
% Create Source A (10000 random lowercase characters)
src1 = char(randsrc(10000,1,[(97:122); prob1]));
% Begin Huffman decoding of Source A
[dict1, len1] = my_hdict(abet1, prob1);
enco1 = my_henco(src1, dict1);
deco1 = char(my_hdeco(enco1, dict1));
% Print success / failure message onscreen
if (isequal(src1,deco1))
 fprintf(1, 'Huffman decoding of Source A was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len1);
else
 fprintf(1, 'Huffman decoding of Source A was not successful!\n');
end
% Read Source B from file 'kwords.txt'
% Convert Uppercase letters to Lowercase and remove extra characters
src2 = lower(fscanf(fopen('kwords.txt'),'%s'));
src2(regexp(src2,'[''/.-]'))=[];
src2 = src2.';
% Begin Huffman decoding of Source B
[dict2, len2] = my_hdict(abet1, prob1);
enco2 = my_henco(src2, dict2);
deco2 = char(my_hdeco(enco2, dict2));
% Print success / failure message onscreen
if (isequal(src2,deco2))
 fprintf(1, 'Huffman decoding of Source B was successful!\n');
 fprintf(1, 'Average codeword length of the Huffman code : %f\n', len2);
else
 fprintf(1, 'Huffman decoding of Source B was not successful!\n');
end
