%2次元の長方形の帯域制限信号
a = pi/8; b = pi/4;                              %周波数帯域
[n1,n2] = meshgrid(-25:25);                      %空間軸の範囲
x = (a/pi*sinc(a*n1/pi)).*(b/pi*sinc(b*n2/pi));  %信号の計算
subplot(2,2,1);
mesh(n1,n2,x);                                   %信号の図示
axis([-25 25 -25 25 -0.01 0.035]);
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)');