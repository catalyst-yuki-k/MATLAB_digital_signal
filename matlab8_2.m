%線形位相特性と非線形位相特性の比較
%線形位相FIRフィルタ
hlin = [1 4 6 4 1]/16;              %線形位相フィルタの単位インパルス応答
w = 0:0.01:pi;                      %周波数の範囲
Hlin = freqz(hlin,1,w);             %周波数応答の計算
figure(1)
subplot(2,2,1); plot(w,abs(Hlin));  %振幅特性の図示
axis([0 pi 0 1.2]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('|H_{l}(e^{j\omega})|');
subplot(2,2,2); plot(w,unwrap(angle(Hlin))); %位相特性の図示
axis([0 pi -10 0]); grid;          
xlabel('Frequency \omega [rad]'); ylabel('\theta_{l}(\omega)');
%線形位相フィルタリング
x = [ones(1,8) -ones(1,8) ones(1,8) -ones(1,8)]; %入力信号
n = 0:length(x)-1;                  %時刻の範囲
subplot(2,2,3); stem(n,x);          %入力の図示
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
ylin = filter(hlin,1,x);            %線形位相フィルタリング
subplot(2,2,4); stem(n,ylin);       %出力の図示
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('y_l(n)');
%非線形位相IIRフィルタリング
alpha = 0.8;                        %全域通過フィルタのパラメータ
numap = [-alpha  1];                %分子係数
denap = [1 -alpha];                 %分母係数
Hap = freqz(numap,denap,w);         %周波数応答の計算
Hnl = Hap.*Hlin;                    %縦続接続の周波数応答の計算
figure(2)
subplot(2,2,1); plot(w,abs(Hnl));   %振幅特性の図示
axis([0 pi 0 1.2]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('|H_{nl}(e^{j\omega})|');
subplot(2,2,2); plot(w,unwrap(angle(Hnl))); %位相特性の図示
axis([0 pi -10 0]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('\theta_{nl}(\omega)');
subplot(2,2,3); stem(n,x);          %入力の図示
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
ynonlin = filter(numap,denap,ylin); %非線形位相フィルタリング
subplot(2,2,4); stem(n,ynonlin);    %出力の図示
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('y_{nl}(n)');