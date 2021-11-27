function [ deco ] = my_hdeco(encod, dict)
% Erotima 1/1/(c) Code
% Check if the input is a vector
[m,n] = size(encod);
if ( m ~= 1 && n ~= 1)
 disp('Input was not a vector!');
end
i = 1;
deco = {};
while (i <= length(encod))
 tempCode = encod(i);
 foundCode = find_Code(tempCode, dict);

 while (isempty(foundCode) && i < length(encod))
 i = i+1;
 tempCode = [tempCode, encod(i)];
 foundCode = find_Code(tempCode, dict);
 end

 if( i == length(encod) && isempty(foundCode) )
 disp('Code not found in the dictionary');
 end

 deco{end+1} = foundCode;
 i=i+1;
end
% if input was a column vector, transpose the encoded signal vector
if( n == 1 )
 deco = deco';
end
% Compare the code with the dictionary entries and return the signal if it exists
function [ exists ] = find_Code(code, dict)
exists = [];
m = size(dict);
for i=1:m(1)
 if ( isequal(code, dict{i,2}) )
 exists = dict{i,1};
 return;
 end
end
