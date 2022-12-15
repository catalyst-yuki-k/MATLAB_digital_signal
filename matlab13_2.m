%2次元FIRフィルタの周波数応答
h = [1 2 1; 2 4 2; 1 2 1]/16;                 %単位インパルス応答
hh = zeros(11,11); hh(6:8,6:8) = h(1:3,1:3);  %図示のためのゼロづめ
n1 = -5:5; n2 = n1;                           %信号の区間
subplot(2,2,1);
mesh(n1,n2,hh);                               %信号の図示
axis([-5 5 -5 5 0 0.3]); 
xlabel('n_1'); ylabel('n_2'); zlabel('h(n_1,n_2)');
[H,w1,w2] = freqz2(h);                        %2次元周波数応答
subplot(2,2,2);
mesh(w1*pi,w2*pi,abs(H));                     %振幅特性の図示
axis([-pi pi -pi pi 0 1]); 
xlabel('\omega_1 [rad]'); ylabel('\omega_2 [rad]'); 
zlabel('|H(e^{j\omega_1},e^{j\omega_2})|');