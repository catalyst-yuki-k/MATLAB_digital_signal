%周波数選択性フィルタによるフィルタリング
%二つの三角関数波の合成
wl = pi/8; wh = 7*pi/8;              %周波数の値の設定
nend = 50; n = 0:nend;               %信号の区間
s = sin(wl*n);                       %信号s
v = cos(wh*n);                       %雑音v
x = s+v;                             %信号x=s+vの合成
subplot(2,2,1);
plot(n,s,'-',n,v,':');               %sとvの図示
ymax = 1.5;  
axis([0 nend -ymax ymax]); grid;
xlabel('Time n'); ylabel('s(n) and v(n)'); 
legend('s(n)', 'v(n)'); 
subplot(2,2,2);
plot(n,x);                           %x=s+vの図示
axis([0 nend -ymax ymax]); grid;
xlabel('Time n'); ylabel('x(n)=s(n)+v(n)');
%FIRフィルタの振幅特性
h = [1 4 6 4 1]/16;                  %単位インパルス応答
w = -pi:0.01:pi;                     %周波数のきざみと範囲
H = freqz(h,1,w);                    %周波数応答
subplot(2,2,3);
plot(w,abs(H));                      %振幅特性の図示
axis([-pi pi 0 1.2]); grid; 
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
%FIRフィルタリング 
y = filter(h,1,x);                   %フィルタリング
subplot(2,2,4);
plot(n,y);                           %フィルタ出力の図示
axis([0 nend -ymax ymax]); grid; 
xlabel('Time n'); ylabel('y(n)');