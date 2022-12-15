%画像GIRLの2次元離散フーリエ変換
%画像データの読み込みと図示
GIRL = imread('girl.tif');         %画像データの読み込み
x = double(imresize(GIRL,0.25));   %画像GIRLを1/4のサイズに変更
x = flipud(x);                     %見やすさのために画像の上下を入れ替え
[N1,N2] = size(x);                 %画像の水平・垂直方向のサイズ
n1 = 0:N1-1; n2 = 0:N2-1;          %画像の水平・垂直方向のインデックス
colormap([0 0 0]);                 %白黒図示を指定
subplot(2,2,1); mesh(n1,n2,x);     %画像の立体的図示
view(-20,66);                      %視点の設定
axis([0 N1-1 0 N2-1 0 500]); 
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)'); 
%画像の2次元DFT
X = fft2(x,N1,N2);                 %2次元離散フーリエ変換
absX = abs(X);                     %周波数スペクトルの絶対値
absX(1,1) = 0;                     %図示のため直流分を除いておく
subplot(2,2,2); mesh(n1,n2,absX);  %振幅スペクトルの立体的図示
axis([0 N1-1 0 N2-1 0 5*10^4]);
xlabel('k_1'); ylabel('k_2'); zlabel('|X(k_1,k_2)|'); 