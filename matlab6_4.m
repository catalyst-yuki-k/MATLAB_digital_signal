%数式処理による逆ｚ変換
syms a z;                   %利用する変数の宣言
X = (1-a)*z/((z-1)*(z-a));  %X(z)の設定
x = iztrans(X)              %X(z)の逆ｚ変換x(n)