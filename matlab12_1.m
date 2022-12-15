%2�����A����ԐM���̗�
[t1,t2] = meshgrid(-20:20,-20:20);              %�i�q�_���`
X = exp(-0.01*(abs(t1).^2+abs(t2.^1.8)))...     %2�����A���M��������
    + 0.5*exp(-0.03*((t1-13).^2+(t2+10).^2))...
    + 0.3*exp(-0.03*((t1+15).^2+(t2).^2));  
colormap(gray);                                 %�Z�W�}�����w��
subplot(2,2,1);
surfl(t1,t2,X), shading interp;                 %X�𗧑̐}��
xlabel('t_1'); ylabel('t_2'); 
subplot(2,2,2);
pcolor(t1,t2,X), shading interp;                %X�𕽖ʏ�ɔZ�W�}��
xlabel('t_1'); ylabel('t_2');