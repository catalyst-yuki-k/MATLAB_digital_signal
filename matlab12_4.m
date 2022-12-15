%2次元離散フーリエ変換の例
N1 = 16; N2 = 16;                   %信号のサイズ
[n1,n2] = meshgrid(0:N1-1,0:N2-1);  %インデックスの範囲
a1 = 0.5; a2 = 0.75;                %信号のパラメータ
x = (a1.^n1).*(a2.^n2);             %信号
X = fft2(x);                        %2次元離散フーリエ変換
subplot(2,2,1);
mesh(n1,n2,x);                      %信号の図示
axis([0 N1-1 0 N2-1 0 1]);
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)');
subplot(2,2,2);
mesh(n1,n2,abs(X));                 %振幅スペクトルの図示
axis([0 N1-1 0 N2-1 0 8]);
xlabel('k_1'); ylabel('k_2'); zlabel('|X(k_1,k_2)|');