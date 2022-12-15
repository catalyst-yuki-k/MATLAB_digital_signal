%数式処理によるy(n) = h(n)*x(n) <--> Y(z) = H(z)X(z)の確認
syms a n x z;            %利用する記号の宣言
h = a^n;                 %指数関数h(n)
H = ztrans(h,n,z)        %hのz変換
x = 1;                   %単位ステップx(n)=u0(n)
X = ztrans(x,n,z)        %xのｚ変換
HX = H*X                 %HとXの積
y = symsum(h*x,0,n)      %hとxのたたみこみy
Y = ztrans(y,n,z)        %yのｚ変換
simple(Y) == simple(HX)  %Y=HXか？（Yesならば1，Noならば0)