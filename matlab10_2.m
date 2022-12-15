%�o�^���[�X�t�B���^�̐݌v��
Wc = pi/8;                        %�Ւf���g��
Ws = 6*pi/8;                      %�j�~��[���g��
As = 30;                          %�j�~�挸����
[N] = buttord(Wc,Ws,3,As,'s')     %�o�^���[�X�t�B���^�̎����̌���
[b,a] = butter(N,Wc,'s')          %�o�^���[�X�t�B���^�̐݌v
subplot(2,2,1);
[Ha,w] = freqs(b,a);              %���g�������̌v�Z    
plot(w,20*log10(abs(Ha)));        %�U�������̐}��
axis([0 pi -40 5]); grid; 
xlabel('Frequency \Omega [rad/sec]'); ylabel('|H_a(j\Omega)|');
subplot(2,2,2);
plot(w,unwrap(angle(Ha)));        %�ʑ������̐}��
axis([0 pi -4 0]); grid;
xlabel('Frequency \Omega [rad/sec]'); ylabel('\angle H_a(j\Omega)');