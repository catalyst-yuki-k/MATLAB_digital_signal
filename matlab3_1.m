%離散フーリエ変換の計算例
%信号
x = [1 1 1 1 0 0 0 0];                  %8点の信号
n = 0:length(x)-1;                      %時間のインデックス
subplot(2,2,1); 
stem(n,x);                              %信号の図示
axis([0 length(n) min(x) max(x)]);
xlabel('Time n'); ylabel('x(n)'); 
%離散時間フーリエ変換
w = -pi:0.01:pi;                        %周波数の範囲
Xejw = freqz(x,1,w);                    %離散時間フーリエ変換の計算
subplot(2,2,2); 
maxX = max(abs(Xejw));                  %|Xejw|の最大値
plot(w,abs(Xejw));                      %振幅スペクトルの図示
axis([-pi pi 0 maxX]);
xlabel('Frequency \omega [rad]'); ylabel('|X(e^{j\omega})|');
%離散フーリエ変換 DFT
k = n                                   %周波数のインデックス
X = mydft(x)                            %DFTの計算
magX = abs(X)                           %振幅スペクトル
subplot(2,2,3); 
stem(k,magX);                           %振幅スペクトルの図示
axis([0 length(k) 0 maxX]);
xlabel('Frequency k'); ylabel('|X(k)|'); 
%離散フーリエ変換のシフト図示
kshift = k-floor(length(k)/2);          %インデックスのシフト
Xshift = fftshift(X);                   %DFT X(k)のシフト
magXshift = abs(Xshift);                %シフトされた DFT の振幅スペクトル
subplot(2,2,4); 
stem(kshift,magXshift);                 %シフトされた振幅スペクトルの図示
axis([-length(k)/2 length(k)/2 0 maxX]);
xlabel('Frequency k'); ylabel('|X(k)|');