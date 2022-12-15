%複素指数関数の実部（正弦波）と虚部（余弦波）の図示
nend = 63; n = 0:nend;                       %時間の範囲
w = pi/8;                                    %周波数
ejwn = exp(j*w*n);                           %複素指数関数の計算
coswn = real(ejwn);                          %複素指数関数の実部
sinwn = imag(ejwn);                          %複素指数関数の虚部
plot3(n,coswn,sinwn,'o');                    %複素指数関数の立体的図示
view(50,30);                                 %3次元グラフの視点を指定
hold on;                                     %画面を保持
rmax = 3;                                    %実軸と虚軸の範囲
axis([0 nend -rmax rmax -rmax rmax]); grid; 
xlabel('Time n'); ylabel('Real part'); zlabel('Imaginary part');
rplane = -rmax*ones(1,length(n));            %実部を投影する面を定義	
iplane = -rplane;                            %虚部を投影する面を定義	
plot3(n,coswn,rplane,'.');                   %実部の図示
plot3(n,iplane,sinwn,'*');                   %虚部の図示
legend('e^{j\omega n}','cos \omega n','sin \omega n'); %凡例
hold off;                                    %画面保持を解除