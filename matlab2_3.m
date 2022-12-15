%基本的信号の振幅スペクトル
%矩形波
w = -pi:0.01:pi;                   %周波数の範囲
rc = ones(1,8);                    %矩形波
Rc = freqz(rc,1,w);                %矩形波の離散時間フーリエ変換
subplot(2,2,1); 
plot(w,abs(Rc));                   %矩形波の振幅スペクトルの図示
axis([-pi pi 0 10]); grid;
xlabel('Frequency \omega [rad]');  
ylabel('|R_c(e^{j\omega})|');
%指数関数
n = 0:(2^12-1);                    %時刻を十分大きな値までとる
a = 0.5.^n;                        %指数関数
A = freqz(a,1,w);                  %指数関数の離散時間フーリエ変換
subplot(2,2,2); 
plot(w,abs(A));                    %指数関数の振幅スペクトルの図示
axis([-pi pi 0 3]); grid;
xlabel('Frequency \omega [rad]');
ylabel('|A(e^{j\omega})|');