%ディジタルフィルタの単位ステップ応答
nend = 10; n = 0:nend;             %時間の範囲
x = ones(1,nend+1);                %単位ステップ入力
%alpha = 0.5のときの単位インパルス応答
alpha1 = 0.5; 
h1 = alpha1.^n;                    %単位インパルス応答
y1 = conv(h1,x);                   %たたみこみ
y1 = y1(1:nend+1)                  %出力の図示範囲の制限
subplot(2,2,1);
stem(n,y1);                        %出力の図示
axis([0 nend 0 2.5]); grid;
xlabel('Time n'); ylabel('y(n)'); 
%以下同様にalpha = -0.5のとき
alpha2 = -0.5; 
h2 = alpha2.^n;   
y2 = conv(h2,x);
y2 = y2(1:nend+1)
subplot(2,2,2);
stem(n,y2); 
axis([0 nend 0 2.5]); grid;
xlabel('Time n'); ylabel('y(n)'); 