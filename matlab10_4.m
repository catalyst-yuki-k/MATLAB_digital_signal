%双1次z変換法によるディジタルフィルタの設計
wc = 0.25*pi;                  %ディジタルフィルタの遮断周波数
ws = 0.75*pi;                  %ディジタルフィルタの阻止域端周波数
As = 30;                       %ディジタルフィルタの減衰量
Wc = 2*tan(wc/2)               %遮断周波数のプリワーピング
Ws = 2*tan(ws/2)               %阻止域端周波数のプリワーピング
[N] = buttord(Wc,Ws,3,As,'s')  %プロトタイプフィルタの次数
[bs,as] = butter(N,Wc,'s')     %プロトタイプフィルタの設計
[bz,az] = bilinear(bs,as,1)    %双1次z変換によるディジタルフィルタの設計
W = 0:0.01:5;        
Ha = freqs(bs,as,W);           %プロトタイプフィルタの周波数応答
subplot(2,2,1); 
plot(W,20*log10(abs(Ha)));     %振幅特性の図示
axis([0 5 -60 5]); grid;
xlabel('Frequency \Omega [rad/sec]'); ylabel('|H_a(j\Omega)| [dB]');
w = 0:0.01:pi;       
Hz = freqz(bz,az,w);           %ディジタルフィルタの周波数応答
subplot(2,2,2);
plot(w,20*log10(abs(Hz)));     %振幅特性の図示
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');