function [dict,avglen] = my_hdict(abet, prob)
% Erotima 1/1/(a) Code
% Preallocation
ROUND_OFF_ERROR = 1e-6;
n_ary = 2;
variance = 'max';
% Check if any of the elements of probability vector is negative
if length(find(prob < 0))~=0,
 disp('There are negative values in the probability vector!')
end
% Check if the sum of the elements of probability vector is equal to 1
if abs(sum(prob)-1)>10e-10,
 disp('The probability vector elements do not add up to 1!')
end
% Create tree nodes with the signals and the corresponding probabilities
huff_tree = struct('signal', [], 'probability', [], 'child', [], 'code', [],
'origOrder', -1);
for i=1:length(abet)
 huff_tree(i).signal = abet{i};
 huff_tree(i).probability = prob(i);
 huff_tree(i).origOrder = i;
end
% Sort the signal and probability vectors based on ascending order of probability
[s, i] = sort(prob);
huff_tree = huff_tree(i);
huff_tree = create_tree(huff_tree, n_ary, variance); % create a Huffman tree
[huff_tree,dict,avglen] = create_dict(huff_tree,{},0, n_ary); % create the codebook
% Sort the dictionary
[dictsort,dictsortorder] = sort([dict{:,4}]);
lenDict = length(dictsortorder);
finaldict = cell(lenDict, 2);
for i=1:length(dictsortorder)
 finaldict{i,1} = dict{dictsortorder(i), 1};
 finaldict{i,2} = dict{dictsortorder(i), 2};
end
dict = finaldict;
% Recursive function to create the Huffman Code Tree
function huff_tree = create_tree(huff_tree, n_ary, variance)
% If tree length = 1, terminate loop (last node)
if( length(huff_tree) <= 1)
 return;
end
% Combine first 2 nodes under new parent, remove them from list, add new parent
temp = struct('signal', [], 'probability', 0, 'child', [], 'code', []);
for i=1:n_ary
 if isempty(huff_tree), break; end
 temp.probability = temp.probability + huff_tree(1).probability; % Order: ASC
 temp.child{i} = huff_tree(1);
 temp.origOrder = -1;
 huff_tree(1) = [];
end
if( strcmpi(variance, 'min') == 1 )
 huff_tree = insertMinVar(huff_tree, temp);
else
 huff_tree = insertMaxVar(huff_tree, temp);
end
% Create Huffman tree from the reduced number of free nodes
huff_tree = create_tree(huff_tree, n_ary, variance);
return;
% Recursive function to scan tree to create the codes for each leaf node.
function [huff_tree,dict,total_wted_len] = create_dict(huff_tree,dict,total_wted_len,
n_ary)
% Check if node is leaf->add signal on this node and its corresponding code to dict
if isempty(huff_tree.child)
 dict{end+1,1} = huff_tree.signal;
 dict{end, 2} = huff_tree.code;
 dict{end, 3} = length(huff_tree.code);
 dict{end, 4} = huff_tree.origOrder;
 total_wted_len = total_wted_len + length(huff_tree.code)*huff_tree.probability;
 return;
end
num_childrens = length(huff_tree.child);
for i = 1:num_childrens
 huff_tree.child{i}.code = [huff_tree(end).code, (num_childrens-i)];
 [huff_tree.child{i}, dict, total_wted_len] = create_dict(huff_tree.child{i}, dict,
total_wted_len, n_ary);
end
% Add node in sorted list to convert to ASC. If node with same prob exists
% place new, after it
function huff_tree = insertMaxVar(huff_tree, newNode)
i = 1;
while i <= length(huff_tree) && newNode.probability > huff_tree(i).probability
 i = i+1;
end
huff_tree = [huff_tree(1:i-1) newNode huff_tree(i:end)];
% Add node in sorted list to convert to ASC. If node with same prob exists
% place new, before it
function huff_tree = insertMinVar(huff_tree, newNode)
i = 1;
while i <= length(huff_tree) && newNode.probability >= huff_tree(i).probability
 i = i+1;
end
huff_tree = [huff_tree(1:i-1) newNode huff_tree(i:end)];
