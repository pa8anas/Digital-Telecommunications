function [ enco ] = my_henco(src, dict)
% Erotima 1/1/(b) Code
% Check if the input is a vector
[m,n] = size(src);
if (m ~= 1 && n ~= 1)
 disp('Input source was not a vector!');
end
% Convert input source to cell array, if it wasn't already
if (~iscell(src) )
 [m,n] = size(src);
 src = mat2cell(src, ones(1,m), ones(1,n) );
end
% Find the size of the largest element in the dict & preallocate 'enco'
maxSize = 0;
dictSize = size(dict,1);
for i = 1:dictSize
 tempSize = size(dict{i,2},2);
 if (tempSize > maxSize)
 maxSize = tempSize;
 end
end
enco = zeros(1, length(src)*maxSize);
% For each given signal value, search through the dictionary to find its code
sigCode = 1;
for i = 1:length(src)
 tempCode = [];
 for j = 1:dictSize
 if (src{i} == dict{j,1})
 tempCode = dict{j,2};
 break;
 end
 end

 codeLen = length(tempCode);
 if (codeLen ~= 0)
 enco(sigCode : sigCode+codeLen-1) = tempCode;
 sigCode = sigCode + codeLen;
 end
end
enco = enco(1:sigCode-1);
% if input was a column vector, transpose the encoded signal vector
if (n == 1)
 enco = enco';
end
