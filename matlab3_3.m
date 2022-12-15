%�M���̃X�y�N�g����͂ɂ����鑋�̌���
N = 64;                                   %���̒����i�Q�ׂ̂���j
Nb = -N/4; Ne = N+N/4; n = Nb:Ne;         %�M���̌p�����Ԃ̐ݒ�
%�M�� x(n)
alpha = pi/8;                             %�]���g�̎��g��
x = cos(alpha*n);                         %�]���g
subplot(2,2,1);          
stem(n,x,'.');                            %�M���̐}��
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
%�M���̑������i���p���Ȃ����̓R�����g�A�E�g����j
win = boxcar(N)';                         %���`���̑I��
%win = hamming(N)';                       %�n�~���O���̑I��
winzero = [zeros(1,-Nb) win zeros(1,Ne+1-N)];%�}���̂��ߑ��̑O��ɗ�Â�
xw = x.*winzero;                          %���ɂ��؂�o��
%����������ꂽ�M���̐}���i���M�����}���j
subplot(2,2,2); 
stem(n,xw,'.'); hold on;                  %����������ꂽ�M��
plot(n,x,':'); hold off;                  %���M��
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_w(n)');
%���֐��̎��g���X�y�N�g��
w = linspace(-pi,pi,1024);                %���g��(-�΁`�΂�1024����)
Win = freqz(win,1,w);                     %���g���X�y�N�g��
magWin = abs(Win); maxWin = max(magWin);  %���g���X�y�N�g���̐U���ƍő�l
subplot(2,2,3); 
plot(w,20*log10(magWin/maxWin)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]');ylabel('|W(e^{j\omega})| [dB]');
%����������ꂽ�M���̎��g���X�y�N�g��
Xw = freqz(xw,1,w);                       %���g���X�y�N�g��
magXw = abs(Xw); maxXw = max(magXw);      %���g���X�y�N�g���̐U���ƍő�l
subplot(2,2,4); 
plot(w,20*log10(magXw/maxXw)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_w(e^{j\omega})| [dB]');