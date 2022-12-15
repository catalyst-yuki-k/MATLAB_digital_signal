%��{�I�M���̐U���X�y�N�g��
%��`�g
w = -pi:0.01:pi;                   %���g���͈̔�
rc = ones(1,8);                    %��`�g
Rc = freqz(rc,1,w);                %��`�g�̗��U���ԃt�[���G�ϊ�
subplot(2,2,1); 
plot(w,abs(Rc));                   %��`�g�̐U���X�y�N�g���̐}��
axis([-pi pi 0 10]); grid;
xlabel('Frequency \omega [rad]');  
ylabel('|R_c(e^{j\omega})|');
%�w���֐�
n = 0:(2^12-1);                    %�������\���傫�Ȓl�܂łƂ�
a = 0.5.^n;                        %�w���֐�
A = freqz(a,1,w);                  %�w���֐��̗��U���ԃt�[���G�ϊ�
subplot(2,2,2); 
plot(w,abs(A));                    %�w���֐��̐U���X�y�N�g���̐}��
axis([-pi pi 0 3]); grid;
xlabel('Frequency \omega [rad]');
ylabel('|A(e^{j\omega})|');