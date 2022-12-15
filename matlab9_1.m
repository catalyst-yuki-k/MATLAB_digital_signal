%���`���ɂ����FIR�t�B���^�̐݌v
%���z���t�B���^hd(n)
L = 25; n = -L:L;                   %�M���̎��Ԃ͈̔�
wc = pi/2;                          %�Ւf���g��
hd = (wc/pi)*sinc(n*wc/pi);         %���z�I�P�ʃC���p���X����
subplot(2,2,1); 
stem(n,hd); 
axis([-L L -0.2 0.6]); grid;
xlabel('Time n'); ylabel('h_d(n)');
%���֐��ɂ��݌vh(n)
M = 10; 
N = 2*M+1;                          %�^�b�v��
win = boxcar(N);                    %���`���̑I��
winz = [zeros(1,L-M) win' zeros(1,L-M)]'; %�[���Â�(hd�̐؏o�̂��߁j
h = hd.*winz';                      %���֐���������ꂽ�P�ʃC���p���X����h
subplot(2,2,2); 
stem(n,h); 
axis([-L L -0.2 0.6]); grid;
xlabel('Time n'); ylabel('h(n)');
%���g���X�y�N�g��W�Ǝ��g������H�̌v�Z�Ɛ}��
w = linspace(-pi,pi,1024);          %���g��(-�΁`�΂�1024����)
Win = freqz(win,1,w);               %���̎��g���X�y�N�g��
maxWin = max(abs(Win)); 
subplot(2,2,3); 
plot(w,20*log10(abs(Win)/maxWin)); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|W(e^{j\omega})| [dB]');
H = freqz(h,1,w);                   %�݌v���ꂽFIR�t�B���^�̎��g������
subplot(2,2,4);
plot(w,20*log10(abs(H))); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');