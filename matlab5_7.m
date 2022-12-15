%3次非再帰形フィルタの周波数応答
h = [1 3 3 1]/8;             %単位インパルス応答
w = -pi:0.01:pi;             %周波数の範囲
H = freqz(h,1,w);            %周波数応答の計算
magH = abs(H);               %振幅特性
argH = angle(H);             %位相特性
subplot(2,2,1);                
plot(w,magH);                %振幅特性の図示
axis([-pi pi 0 1.5]); grid;    
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);                
plot(w,argH);                 %位相特性の図示
axis([-pi pi -pi pi]); grid;    
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');