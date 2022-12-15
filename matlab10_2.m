%バタワースフィルタの設計例
Wc = pi/8;                        %遮断周波数
Ws = 6*pi/8;                      %阻止域端周波数
As = 30;                          %阻止域減衰量
[N] = buttord(Wc,Ws,3,As,'s')     %バタワースフィルタの次数の決定
[b,a] = butter(N,Wc,'s')          %バタワースフィルタの設計
subplot(2,2,1);
[Ha,w] = freqs(b,a);              %周波数応答の計算    
plot(w,20*log10(abs(Ha)));        %振幅特性の図示
axis([0 pi -40 5]); grid; 
xlabel('Frequency \Omega [rad/sec]'); ylabel('|H_a(j\Omega)|');
subplot(2,2,2);
plot(w,unwrap(angle(Ha)));        %位相特性の図示
axis([0 pi -4 0]); grid;
xlabel('Frequency \Omega [rad/sec]'); ylabel('\angle H_a(j\Omega)');