%�ш搧�����ꂽ���U���ԃt�[���G�ϊ��̐M��
n = -20:20;                       %�M���̎��Ԃ͈̔�
wc = pi/4;                        %���g���̑ш敝
x = (wc/pi)*sinc(n*wc/pi);        %�M���̌v�Z
stem(n,x);                        %�M���̐}��
axis([-20 20 -0.1 0.3]); grid;
xlabel('Time n'); ylabel('x(n)');