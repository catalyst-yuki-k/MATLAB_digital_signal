%���g���ϊ��ɂ��f�B�W�^���t�B���^�̐݌v
%�v���g�^�C�v�t�B���^
b = 0.0976*[1 2 1];                     %�v���g�^�C�v�t�B���^�̕��q�W��
a = [1 -0.9428 0.3333];                 %�v���g�^�C�v�t�B���^�̕���W��
thetac = 0.25*pi;                       %�v���g�^�C�v�t�B���^�̎Ւf���g��
%�t�B���^�̐݌v
wc = 0.75*pi;                           %���]�̃t�B���^�̎Ւf���g��
[B,A] = freqztrans(b,a,'lp',thetac,wc)  %���]���̎��g���ϊ�
zr = roots(B)                           %�݌v���ꂽ�t�B���^�̗�_ 
pl = roots(A)                           %�݌v���ꂽ�t�B���^�̋�
subplot(2,2,1);
zplane(B,A);                            %�݌v���ꂽ�t�B���^�̋ɗ�_�z�u
w = 0:0.01:pi;
subplot(2,2,2);
HZ = freqz(B,A,w);                      %�݌v���ꂽ�t�B���^�̎��g������
plot(w,20*log10(abs(HZ))); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');