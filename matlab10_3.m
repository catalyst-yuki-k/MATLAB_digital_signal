%インパルス不変変換法によるディジタルフィルタの設計
Wc = pi/8                          %遮断周波数
[bs,as] = butter(2,Wc,'s')         %2次プロトタイプフィルタの分子･分母多項式
[bz,az] = impinvar(bs,as,1)        %インパルス不変変換法による設計
w = 0:0.01:pi;
Ha = freqs(bs,as,w);               %プロトタイプフィルタの周波数応答
Hz = freqz(bz,az,w);               %ディジタルフィルタの周波数応答
maxHz = max(abs(Hz));
subplot(2,2,1);
plot(w,20*log10(abs(Ha)),':', ...
     w,20*log10(abs(Hz)/maxHz));   %周波数応答の図示
axis([0 pi -40 5]); grid; 
xlabel('Frequency \Omega, \omega'); 
ylabel('|H_a(j\Omega)|,  |H(e^{j\omega})|');
legend('H_a(j\Omega)','H(e^{j\omega})');
%単位インパルス応答の比較
tend = 25; t = 0:0.1:25;           %時間の範囲
alpha = Wc/sqrt(2);
ha = 2*alpha*exp(-alpha*t).*sin(alpha*t); %プロトタイプのインパルス応答
subplot(2,2,2);
plot(t,ha);                        %インパルス応答の図示
axis([0 tend -0.05 0.2]); grid;
xlabel('Time t, n'); ylabel('h_a(t), h(n)');
hold on;                           %画面の保持
n = 0:tend;                        %時間の範囲
x = zeros(1,tend+1); x(1) = 1;     %単位インパルス入力
h = filter(bz,az,x);               %ディジタルフィルタのインパルス応答
stem(n,h);                         %インパルス応答の図示
legend('h_a(t)','h(n)');           
hold off;                          %画面保持の解除