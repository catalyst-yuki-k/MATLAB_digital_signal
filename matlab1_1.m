%�A�i���O�t�B���^�̒P�ʃX�e�b�v����
RC = 1;                                   %���萔
t = 0:0.1:5;                              %0�`5�܂ł̎����͈̔�,������0.1	
y = 1-exp(-t/RC)                          %�o�͂̌v�Z
plot(t,y);                                %�o�͂̐}��
axis([0 5 0 1.5]); grid;                  %���W���͈̔͂̎w��Ɗi�q�̐}��
xlabel('Time t [sec]'); ylabel('Output y(t)');  %���W�����̐ݒ�