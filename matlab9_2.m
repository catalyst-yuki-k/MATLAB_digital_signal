%窓関数によるFIRフィルタの設計
%窓の選択 （選択しない窓をコメントアウトする）
N = 21;                           %窓の長さ（フィルタのタップ長）
%win = boxcar(N);                 %方形窓
%win = hanning(N);                %ハニング窓
win = hamming(N);                 %ハミング窓
%win = blackman(N);               %ブラックマン窓
%win = kaiser(N,2*pi);            %カイザー窓
%窓の周波数応答
w = linspace(-pi,pi,1024);        %周波数(-π～πを1024等分)
Win = freqz(win',1,w);            %周波数応答
maxWin = max(abs(Win));
subplot(2,2,1);
plot(w,20*log10(abs(Win)/maxWin)); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|W(e^{j\omega})| [dB]');
%窓関数によるFIRフィルタの設計
wc = pi/2;                        %遮断周波数
h = fir1(N-1,wc/pi,win);          %単位インパルス応答（窓関数による設計）
H = freqz(h,1,w);                 %設計されたフィルタの周波数応答 
subplot(2,2,2);
plot(w,20*log10(abs(H))); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');