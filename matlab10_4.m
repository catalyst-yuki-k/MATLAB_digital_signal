%�o1��z�ϊ��@�ɂ��f�B�W�^���t�B���^�̐݌v
wc = 0.25*pi;                  %�f�B�W�^���t�B���^�̎Ւf���g��
ws = 0.75*pi;                  %�f�B�W�^���t�B���^�̑j�~��[���g��
As = 30;                       %�f�B�W�^���t�B���^�̌�����
Wc = 2*tan(wc/2)               %�Ւf���g���̃v�����[�s���O
Ws = 2*tan(ws/2)               %�j�~��[���g���̃v�����[�s���O
[N] = buttord(Wc,Ws,3,As,'s')  %�v���g�^�C�v�t�B���^�̎���
[bs,as] = butter(N,Wc,'s')     %�v���g�^�C�v�t�B���^�̐݌v
[bz,az] = bilinear(bs,as,1)    %�o1��z�ϊ��ɂ��f�B�W�^���t�B���^�̐݌v
W = 0:0.01:5;        
Ha = freqs(bs,as,W);           %�v���g�^�C�v�t�B���^�̎��g������
subplot(2,2,1); 
plot(W,20*log10(abs(Ha)));     %�U�������̐}��
axis([0 5 -60 5]); grid;
xlabel('Frequency \Omega [rad/sec]'); ylabel('|H_a(j\Omega)| [dB]');
w = 0:0.01:pi;       
Hz = freqz(bz,az,w);           %�f�B�W�^���t�B���^�̎��g������
subplot(2,2,2);
plot(w,20*log10(abs(Hz)));     %�U�������̐}��
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');