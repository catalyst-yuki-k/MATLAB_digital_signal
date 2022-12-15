% FIRフィルタの伝達関数の極と零点の配置
h = [1 1 1 1 1]/5;        %分子係数（単位インパルス応答）
a = [1 0 0 0 0];          %分母係数
zr = roots(h)             %零点の計算
pl = roots(a)             %極の計算
zplane(h,a);              %極零点の図示
legend('zeros','poles');  %凡例