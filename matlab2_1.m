%��{�I�ȗ��U���ԐM��
nbegin = -5; nend = 10; n = nbegin:nend; %���Ԃ͈̔�
n0 = 0;                                  %�M���̊J�n����
%�P�ʃC���p���X
delta = [(n-n0)==0];                     %����n=n0��1�C���̑���0
subplot(2,2,1);                          %��ʂ�2x2�ɕ������C�ʒu1�ɐݒ�
stem(n,delta);                           %delta��}��
xlabel('Time n'); ylabel('\delta(n)'); grid; 
%�P�ʃX�e�b�v
unitstep = [(n-n0)>=0];                  %����n>=n0��1�C���̑���0
subplot(2,2,2);                          %��ʂ�2x2�ɕ������C�ʒu2�ɐݒ�
stem(n,unitstep);                        %unitstep��}��
xlabel('Time n'); ylabel('u_0(n)'); grid;                        
%�����v�֐�
ramp = [(n-n0)>=0].*(n-n0);              %����n>=n0�Ń����v�̒l�C���̑���0
subplot(2,2,3);                          %��ʂ�2x2�ɕ������C�ʒu3�ɐݒ�
stem(n,ramp); grid;                      %ramp��}��
xlabel('Time n'); ylabel('r(n)');
%�w���֐�
alpha = 0.75; 
a = [(n-n0)>=0].*alpha.^(n-n0);          %����n>=n0�Ŏw���֐��C���̑���0
subplot(2,2,4);                          %��ʂ�2x2�ɕ������C�ʒu4�ɐݒ�
stem(n,a);                               %a��}��
xlabel('Time n'); ylabel('a(n)'); grid;