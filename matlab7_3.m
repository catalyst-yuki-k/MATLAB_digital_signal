% FIR�t�B���^�̓`�B�֐��̋ɂƗ�_�̔z�u
h = [1 1 1 1 1]/5;        %���q�W���i�P�ʃC���p���X�����j
a = [1 0 0 0 0];          %����W��
zr = roots(h)             %��_�̌v�Z
pl = roots(a)             %�ɂ̌v�Z
zplane(h,a);              %�ɗ�_�̐}��
legend('zeros','poles');  %�}��