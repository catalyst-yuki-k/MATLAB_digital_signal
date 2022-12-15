%窓関数法にFIRフィルタの設計例
wp = 0.2*pi; ws = 0.3*pi;                %通過域端周波数，阻止域端周波数
trwidth = ws-wp;                         %遷移帯域幅
N = ceil(6.6*pi/trwidth)+1               %ハミング窓の長さ（タップ長）
win = hamming(N);                        %ハミング窓
%窓関数によるFIRフィルタの設計（単位インパルス応答）
wc = (wp+ws)/2;                          %遮断周波数
h = fir1(N-1,wc/pi,win);                 %設計された単位インパルス応答
n = -(N-1)/2:(N-1)/2;                    %時刻の範囲
subplot(2,2,1);
stem(n,h);                               %単位インパルス応答の図示
axis([-(N-1)/2 (N-1)/2 -0.1 0.3]); grid;
xlabel('Time n '); ylabel('h(n)'); 
%設計されたFIRフィルタの周波数応答 
dw = 0.001;                              %周波数の刻み
w = 0:dw:pi;                             %周波数の範囲
H = freqz(h,1,w);                        %周波数応答の計算 
maxH = max(abs(H));                      %周波数応答の最大値
dBH = 20*log10(abs(H)/maxH);             %振幅特性の正規化
subplot(2,2,2);
plot(w,dBH);                             %振幅特性の図示
axis([0 pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');
Rp = -min(dBH(1:ceil(wp/dw)+1))          %通過域リプルの確認
As = -max(dBH(ceil(ws/dw)+1:length(w)))  %阻止域減衰量の確認