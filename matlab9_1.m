%方形窓による低域FIRフィルタの設計
%理想低域フィルタhd(n)
L = 25; n = -L:L;                   %信号の時間の範囲
wc = pi/2;                          %遮断周波数
hd = (wc/pi)*sinc(n*wc/pi);         %理想的単位インパルス応答
subplot(2,2,1); 
stem(n,hd); 
axis([-L L -0.2 0.6]); grid;
xlabel('Time n'); ylabel('h_d(n)');
%窓関数による設計h(n)
M = 10; 
N = 2*M+1;                          %タップ数
win = boxcar(N);                    %方形窓の選択
winz = [zeros(1,L-M) win' zeros(1,L-M)]'; %ゼロづめ(hdの切出のため）
h = hd.*winz';                      %窓関数をかけられた単位インパルス応答h
subplot(2,2,2); 
stem(n,h); 
axis([-L L -0.2 0.6]); grid;
xlabel('Time n'); ylabel('h(n)');
%周波数スペクトルWと周波数応答Hの計算と図示
w = linspace(-pi,pi,1024);          %周波数(-π～πを1024等分)
Win = freqz(win,1,w);               %窓の周波数スペクトル
maxWin = max(abs(Win)); 
subplot(2,2,3); 
plot(w,20*log10(abs(Win)/maxWin)); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|W(e^{j\omega})| [dB]');
H = freqz(h,1,w);                   %設計されたFIRフィルタの周波数応答
subplot(2,2,4);
plot(w,20*log10(abs(H))); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');