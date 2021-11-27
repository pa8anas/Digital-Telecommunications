function [y] = demapper(x,M,gray)
k = 1;
if gray == 0 %Simple encoding
 if M == 2
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 elseif x(i) == 1
 y(k) = 1;
 end
 k = k+1 ;
 end
 elseif M == 4
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 1;
 elseif x(i) == 2
 y(k) = 1;
 y(k+1) = 0;
 elseif x(i) == 3
 y(k) = 1;
 y(k+1) = 1;
 end
 k = k+2 ;
 end
 elseif M == 8
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 elseif x(i) == 2
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 elseif x(i) == 3
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 elseif x(i) == 4
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 elseif x(i) == 5
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 elseif x(i) == 6
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 elseif x(i) == 7
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 end
 k = k+3 ;
 end
 elseif M == 16
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 2
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 3
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 4
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 5
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 6
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 7
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 8
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 9
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 10
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 11
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 12
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 13 
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 14
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 15
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=1;
 end
 k = k+4 ;
 end
 end
elseif gray == 1 %Gray code
 if M == 2
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 elseif x(i) == 1
 y(k) = 1;
 end
 k = k+1 ;
 end
 elseif M == 4
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 1;
 elseif x(i) == 2
 y(k) = 1;
 y(k+1) = 1;
 elseif x(i) == 3
 y(k) = 1;
 y(k+1) = 0;
 end
 k = k+2 ;
 end
 elseif M == 8
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 elseif x(i) == 2
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 elseif x(i) == 3
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 elseif x(i) == 4
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 elseif x(i) == 5
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 elseif x(i) == 6
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 elseif x(i) == 7
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 end
 k = k+3 ;
 end
 elseif M == 16
 for i = 1:length(x)
 if x(i) == 0
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 1
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 2
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 3
 y(k) = 0;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 4
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 5
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 6
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 7
 y(k) = 0;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 8
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=0;
 elseif x(i) == 9
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 10
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 11
 y(k) = 1;
 y(k+1) = 1;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 12
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=0;
 elseif x(i) == 13
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=1;
 y(k+3)=1;
 elseif x(i) == 14
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=1;
 elseif x(i) == 15
 y(k) = 1;
 y(k+1) = 0;
 y(k+2)=0;
 y(k+3)=0;
 end
 k = k+4 ;
 end
 end
end
