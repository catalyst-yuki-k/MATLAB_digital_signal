%直接法によるディジタル低域フィルタの設計
wc = 0.25*pi;               %遮断周波数
ws = 0.75*pi;               %阻止域端周波数
As = 30;                    %阻止域減衰量
[b,a,N] = direct(wc,ws,As)  %直接設計(分子，分母，次数）
zr = roots(b)               %零点
pl = roots(a)               %極
subplot(2,2,1);
zplane(b,a);                %極零点配置
legend('zeros','poles');
w = 0:0.01:pi;
H = freqz(b,a,w);           %周波数応答の計算
subplot(2,2,2); 
plot(w,20*log10(abs(H)));   %振幅特性の図示
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');