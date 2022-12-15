%信号のスペクトル解析
N = 64;                                       %窓の長さ（２のべき乗とせよ）
Nb = -N/4; Ne = N+N/4; n = Nb:Ne;             %信号の継続時間の設定
%信号 x(n)の生成
wa = 0.15*pi; wb = 0.25*pi; wc = 0.5*pi;      %余弦波の周波数
x = cos(wa*n)+0.8*cos(wb*n)+0.01*cos(wc*n);   %余弦波の線形結合
%信号の窓かけ
wr = boxcar(N)';                              %方形窓
wrzero = [zeros(1,-Nb) wr zeros(1,Ne+1-N)];   %方形窓にゼロづめ
xr = x.*wrzero;                               %方形窓による切り出し
wh = hamming(N)';                             %ハミング窓
whzero = [zeros(1,-Nb) wh zeros(1,Ne+1-N)];   %ハミング窓にゼロづめ
xh = x.*whzero;                               %ハミング窓による切り出し
%窓をかけられた信号の図示（原信号も図示）
subplot(2,2,1); 
stem(n,xr,'.'); hold on;                      %方形窓による信号の図示
plot(n,x,':'); hold off;                      %原信号の図示
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_r(n)');
subplot(2,2,2); 
stem(n,xh,'.'); hold on;                      %ハミング窓による信号の図示
plot(n,x,':'); hold off;                      %原信号の図示
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_h(n)');
%方形窓により得られた信号の周波数スペクトルの計算
w = linspace(-pi,pi,1024);                    %周波数(-π～πを1024等分)
Xr = freqz(xr,1,w);                           %周波数スペクトルの図示
magXr = abs(Xr); maxXr = max(magXr);
subplot(2,2,3); 
plot(w,20*log10(magXr/maxXr)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_r(e^{j\omega})| [dB]');
%ハミング窓をかけられた信号の周波数スペクトルの計算
Xh = freqz(xh,1,w);                           %周波数スペクトルの図示
magXh = abs(Xh); maxXh = max(magXh);          %正規化のための最大値
subplot(2,2,4); 
plot(w,20*log10(magXh/maxXh)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_h(e^{j\omega})| [dB]');