%周波数変換によるディジタルフィルタの設計
%プロトタイプフィルタ
b = 0.0976*[1 2 1];                     %プロトタイプフィルタの分子係数
a = [1 -0.9428 0.3333];                 %プロトタイプフィルタの分母係数
thetac = 0.25*pi;                       %プロトタイプフィルタの遮断周波数
%フィルタの設計
wc = 0.75*pi;                           %所望のフィルタの遮断周波数
[B,A] = freqztrans(b,a,'lp',thetac,wc)  %低域‐低域の周波数変換
zr = roots(B)                           %設計されたフィルタの零点 
pl = roots(A)                           %設計されたフィルタの極
subplot(2,2,1);
zplane(B,A);                            %設計されたフィルタの極零点配置
w = 0:0.01:pi;
subplot(2,2,2);
HZ = freqz(B,A,w);                      %設計されたフィルタの周波数応答
plot(w,20*log10(abs(HZ))); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');