%ディジタルフィルタの極と単位インパルス応答
%共通の準備事項
zr = [0; 0];                         %二つの零点の位置
nend = 50; n=0:nend;                 %時刻の範囲
x = [1 zeros(1,nend)];               %単位インパルスの入力
%異なる実数の極の場合
pl1 = [0.4; 0.9];                    %極の位置
[num1,den1] = zp2tf(zr,pl1,1);       %零・極から2次フィルタの分子・分母係数
h1 = filter(num1,den1,x);            %フィルタリングによる単位インパルス応答
subplot(3,1,1);
stem(n,h1); grid;                    %単位インパルス応答の図示
xlabel('Time n'); ylabel('h_1(n)');  
%重根の極の場合
pl2 = [0.9 0.9]';                    %以下同じ
[num2,den2] = zp2tf(zr,pl2,1);
h2 = filter(num2,den2,x); 
subplot(3,1,2);
stem(n,h2); grid;
xlabel('Time n'); ylabel('h_2(n)');
%複素共役の極の場合
pl3 = [0.9*exp(j*pi/6) 0.9*exp(-j*pi/6)]';
[num3,den3] = zp2tf(zr,pl3,1);
h3 = filter(num3,den3,x); 
subplot(3,1,3);
stem(n,h3); grid;
xlabel('Time n'); ylabel('h_3(n)');