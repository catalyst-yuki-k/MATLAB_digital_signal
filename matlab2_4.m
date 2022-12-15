%帯域制限された離散時間フーリエ変換の信号
n = -20:20;                       %信号の時間の範囲
wc = pi/4;                        %周波数の帯域幅
x = (wc/pi)*sinc(n*wc/pi);        %信号の計算
stem(n,x);                        %信号の図示
axis([-20 20 -0.1 0.3]); grid;
xlabel('Time n'); ylabel('x(n)');