%2次元連続空間信号の例
[t1,t2] = meshgrid(-20:20,-20:20);              %格子点を定義
X = exp(-0.01*(abs(t1).^2+abs(t2.^1.8)))...     %2次元連続信号をつくる
    + 0.5*exp(-0.03*((t1-13).^2+(t2+10).^2))...
    + 0.3*exp(-0.03*((t1+15).^2+(t2).^2));  
colormap(gray);                                 %濃淡図示を指定
subplot(2,2,1);
surfl(t1,t2,X), shading interp;                 %Xを立体図示
xlabel('t_1'); ylabel('t_2'); 
subplot(2,2,2);
pcolor(t1,t2,X), shading interp;                %Xを平面上に濃淡図示
xlabel('t_1'); ylabel('t_2');