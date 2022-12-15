%数式処理による基本的信号のｚ変換
syms a n u0 z w;     %利用される変数の宣言
% 
u0 = 1;              %単位ステップ
U0 = ztrans(u0,n,z)  %単位ステップのｚ変換
%以下，同様
e = a^n;             %指数関数
E = ztrans(e,n,z)
%
r = n;               %ランプ関数
R = ztrans(r,n,z)
%
s = sin(w*n);        %正弦波
S = ztrans(s,n,z)
%
c = cos(w*n);        %余弦波
C = ztrans(c,n,z)