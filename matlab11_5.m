%周波数変換による高域，帯域，帯域阻止ディジタルフィルタの設計
%プロトタイプフィルタ
b = 0.0976*[1 2 1];                         %分子係数
a = [1 -0.9428 0.3333];                     %分母係数
thetac = 0.25*pi;                           %遮断周波数
theta = 0:0.01:pi;                          %周波数の範囲
subplot(2,2,1);
Hl = freqz(b,a,theta);                      %周波数応答
plot(theta,20*log10(abs(Hl)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \theta [rad]'); ylabel('|H(e^{j\theta})| [dB]');
%高域フィルタの設計
wc = 0.6*pi;                                %高域フィルタの遮断周波数
[Bh,Ah] = freqztrans(b,a,'hp',thetac,wc)    %低域‐高域の周波数変換
w = 0:0.01:pi; 
Hh = freqz(Bh,Ah,w);                        %高域フィルタの周波数応答
subplot(2,2,2);
plot(w,20*log10(abs(Hh)+eps));   
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H_{h}(e^{j\omega})| [dB]');
%帯域フィルタの設計
wc = [0.25*pi 0.5*pi];                      %帯域フィルタの遮断周波数
[Bbp,Abp] = freqztrans(b,a,'bp',thetac,wc)  %低域‐帯域の周波数変換
Hbp = freqz(Bbp,Abp,w);                     %帯域フィルタの周波数応答
subplot(2,2,3);
plot(w,20*log10(abs(Hbp)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('H_{bp}(e^{j\omega})| [dB]');
%帯域阻止フィルタの設計
wc = [0.25*pi 0.5*pi];                      %帯域阻止フィルタの遮断周波数
[Bbs,Abs] = freqztrans(b,a,'bs',thetac,wc)  %低域‐帯域阻止の周波数変換
Hbs = freqz(Bbs,Abs,w);                     %帯域阻止フィルタの周波数応答
subplot(2,2,4);
plot(w,20*log10(abs(Hbs)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H_{bs}(e^{j\omega})| [dB]');