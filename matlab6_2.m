%z変換X(z)=N(z)/D(z)の極と零点の配置
Nz = [1 2 1];             %分子係数
Dz = [1 -1 0.75];         %分母係数
zr = roots(Nz)            %零点の計算（N(z)=0を解く）
pl = roots(Dz)            %極の計算  （D(z)=0を解く）
zplane(Nz,Dz);            %極零点の図示
legend('zeros','poles');  %凡例