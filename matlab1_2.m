%�f�B�W�^���t�B���^�̒P�ʃX�e�b�v����
beta = 1.0;                               %�p�����[�^�̐ݒ�
b = [beta];                               %�t�B�[�h�t�H���[�h�W��
alpha = 0.5;                              %�p�����[�^�̐ݒ�
a = [1 -alpha];                           %�t�B�[�h�o�b�N�W��
nend = 10;                                %�I������
n = 0:nend;                               %�����͈̔�
x = ones(1,nend+1);                       %�P�ʃX�e�b�v����
y = filter(b,a,x)                         %�����������ɂ��o�͂̌v�Z
stem(n,y);                                %�o�͂̐}��
axis([0 nend 0 2.5]); grid;               %���W���͈̔͂̎w��,�i�q�̐}��
xlabel('Time n'); ylabel('Output y(n)');  %���W�����̐ݒ�