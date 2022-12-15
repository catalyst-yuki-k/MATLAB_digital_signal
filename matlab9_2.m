%���֐��ɂ��FIR�t�B���^�̐݌v
%���̑I�� �i�I�����Ȃ������R�����g�A�E�g����j
N = 21;                           %���̒����i�t�B���^�̃^�b�v���j
%win = boxcar(N);                 %���`��
%win = hanning(N);                %�n�j���O��
win = hamming(N);                 %�n�~���O��
%win = blackman(N);               %�u���b�N�}����
%win = kaiser(N,2*pi);            %�J�C�U�[��
%���̎��g������
w = linspace(-pi,pi,1024);        %���g��(-�΁`�΂�1024����)
Win = freqz(win',1,w);            %���g������
maxWin = max(abs(Win));
subplot(2,2,1);
plot(w,20*log10(abs(Win)/maxWin)); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|W(e^{j\omega})| [dB]');
%���֐��ɂ��FIR�t�B���^�̐݌v
wc = pi/2;                        %�Ւf���g��
h = fir1(N-1,wc/pi,win);          %�P�ʃC���p���X�����i���֐��ɂ��݌v�j
H = freqz(h,1,w);                 %�݌v���ꂽ�t�B���^�̎��g������ 
subplot(2,2,2);
plot(w,20*log10(abs(H))); 
axis([-pi pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');