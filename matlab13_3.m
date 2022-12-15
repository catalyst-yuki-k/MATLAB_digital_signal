%2次元FIRフィルタによる画像処理
x = imread('girl.tif');                    %画像の読み込み
figure(1);   
imshow(x,[0 255]);                         %入力画像の図示
%平滑化と雑音除去
hs = [ 1 1 1; 1 1 1; 1 1 1]/9;             %平滑化フィルタ
y = filter2(hs,x);                         %平滑化
figure(2);
imshow(y,[0 255]);                         %平滑化された画像の図示
% 
mu = 0; sigma2 = 0.0025;                   %白色ガウス雑音の平均と分散
noisy_x = imnoise(x,'gaussian',mu,sigma2); %画像に白色ガウス雑音を加える
figure(3);
imshow(noisy_x,[0 255]);                   %雑音が入った画像の図示
y = filter2(hs,noisy_x);                   %雑音の除去
figure(4);
imshow(y,[0 255]);                         %雑音除去された画像の図示
%
%鮮鋭化
he = [ 0 -1 0; -1 5 -1; 0 -1 0];           %鮮鋭化フィルタ
y = filter2(he,x);                         %鮮鋭化
figure(5);
imshow(y,[0 255]);                         %鮮鋭化された画像の図示
%輪郭抽出
hL = [0 1 0; 1 -4 1; 0 1 0];               %ラプラシアンフィルタ
y = filter2(hL,x);                         %輪郭抽出
figure(6);
imshow(y,[0 255]);                         %輪郭抽出された画像の図示