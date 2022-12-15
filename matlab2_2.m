%���f�w���֐��̎����i�����g�j�Ƌ����i�]���g�j�̐}��
nend = 63; n = 0:nend;                       %���Ԃ͈̔�
w = pi/8;                                    %���g��
ejwn = exp(j*w*n);                           %���f�w���֐��̌v�Z
coswn = real(ejwn);                          %���f�w���֐��̎���
sinwn = imag(ejwn);                          %���f�w���֐��̋���
plot3(n,coswn,sinwn,'o');                    %���f�w���֐��̗��̓I�}��
view(50,30);                                 %3�����O���t�̎��_���w��
hold on;                                     %��ʂ�ێ�
rmax = 3;                                    %�����Ƌ����͈̔�
axis([0 nend -rmax rmax -rmax rmax]); grid; 
xlabel('Time n'); ylabel('Real part'); zlabel('Imaginary part');
rplane = -rmax*ones(1,length(n));            %�����𓊉e����ʂ��`	
iplane = -rplane;                            %�����𓊉e����ʂ��`	
plot3(n,coswn,rplane,'.');                   %�����̐}��
plot3(n,iplane,sinwn,'*');                   %�����̐}��
legend('e^{j\omega n}','cos \omega n','sin \omega n'); %�}��
hold off;                                    %��ʕێ�������