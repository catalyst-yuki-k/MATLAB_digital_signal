%信号のスペクトル解析における窓の効果
N = 64;                                   %窓の長さ（２のべき乗）
Nb = -N/4; Ne = N+N/4; n = Nb:Ne;         %信号の継続時間の設定
%信号 x(n)
alpha = pi/8;                             %余弦波の周波数
x = cos(alpha*n);                         %余弦波
subplot(2,2,1);          
stem(n,x,'.');                            %信号の図示
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
%信号の窓かけ（利用しない窓はコメントアウトせよ）
win = boxcar(N)';                         %方形窓の選択
%win = hamming(N)';                       %ハミング窓の選択
winzero = [zeros(1,-Nb) win zeros(1,Ne+1-N)];%図示のため窓の前後に零づめ
xw = x.*winzero;                          %窓による切り出し
%窓をかけられた信号の図示（原信号も図示）
subplot(2,2,2); 
stem(n,xw,'.'); hold on;                  %窓をかけられた信号
plot(n,x,':'); hold off;                  %原信号
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_w(n)');
%窓関数の周波数スペクトル
w = linspace(-pi,pi,1024);                %周波数(-π～πを1024等分)
Win = freqz(win,1,w);                     %周波数スペクトル
magWin = abs(Win); maxWin = max(magWin);  %周波数スペクトルの振幅と最大値
subplot(2,2,3); 
plot(w,20*log10(magWin/maxWin)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]');ylabel('|W(e^{j\omega})| [dB]');
%窓をかけられた信号の周波数スペクトル
Xw = freqz(xw,1,w);                       %周波数スペクトル
magXw = abs(Xw); maxXw = max(magXw);      %周波数スペクトルの振幅と最大値
subplot(2,2,4); 
plot(w,20*log10(magXw/maxXw)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_w(e^{j\omega})| [dB]');