%IIR�t�B���^�̋ɂƗ�_�̔z�u
b = [1 0 1];              %���q�W��
a = [1 -0.9 0.81];        %����W��
zr = roots(b)             %��_�̌v�Z
pl = roots(a)             %�ɂ̌v�Z
zplane(b,a);              %�ɗ�_�̐}��
legend('zeros','poles');  %�}��