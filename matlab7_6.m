%�ɂɂ��f�B�W�^���t�B���^�̈��萫����
a = [1 -0.9 0.81];     %�`�B�֐��̕���W��
pl = roots(a)          %�ɂ̌v�Z
maxpl = max(abs(pl))   %�ɂ̐�Βl�̍ő�l
if maxpl < 1           %�ɂ̐�Βl�̍ő�l��1��菬������
   disp('Stable');     %���̂Ƃ��͈���ƕ\��
else      
   disp('Unstable');   %���̑��̂Ƃ��s����ƕ\��
end