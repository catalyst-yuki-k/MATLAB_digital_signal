%循環たたみこみによる線形たたみこみの実行
h = [8 4 2 1];
x = [1 2 3 4];
hp = [h zeros(1,length(x)-1)]  %hにゼロづめ
xp = [x zeros(1,length(h)-1)]  %hにゼロづめ
ycp = circconv(hp,xp)          %循環たたみこみ