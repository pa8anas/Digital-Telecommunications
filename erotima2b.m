x =
wavread('speech.wav');
xq2my = my_quantizer(y,2,-1,1);
sqnr2my = sqnr(y,xq2my,2);
xq2lloyd = Lloyd_Max(y,2,-1,1);
sqnr2lloyd = sqnr(x,xq2lloyd,2);
xq4my = my_quantizer(y,4,-1,1);
sqnr4my = sqnr(y,xq4my,4);
xq4lloyd = Lloyd_Max(y,4,-1,1);
sqnr4lloyd = sqnr(x,xq4lloyd,4);
xq6my = my_quantizer(y,6,-1,1);
sqnr6my = sqnr(y,xq6my,6);
xq6lloyd = Lloyd_Max(y,6,-1,1);
sqnr6lloyd = sqnr(y,xq6lloyd,6);
