%IIRフィルタの極と零点の配置
b = [1 0 1];              %分子係数
a = [1 -0.9 0.81];        %分母係数
zr = roots(b)             %零点の計算
pl = roots(a)             %極の計算
zplane(b,a);              %極零点の図示
legend('zeros','poles');  %凡例