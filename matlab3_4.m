%�M���̃X�y�N�g�����
N = 64;                                       %���̒����i�Q�ׂ̂���Ƃ���j
Nb = -N/4; Ne = N+N/4; n = Nb:Ne;             %�M���̌p�����Ԃ̐ݒ�
%�M�� x(n)�̐���
wa = 0.15*pi; wb = 0.25*pi; wc = 0.5*pi;      %�]���g�̎��g��
x = cos(wa*n)+0.8*cos(wb*n)+0.01*cos(wc*n);   %�]���g�̐��`����
%�M���̑�����
wr = boxcar(N)';                              %���`��
wrzero = [zeros(1,-Nb) wr zeros(1,Ne+1-N)];   %���`���Ƀ[���Â�
xr = x.*wrzero;                               %���`���ɂ��؂�o��
wh = hamming(N)';                             %�n�~���O��
whzero = [zeros(1,-Nb) wh zeros(1,Ne+1-N)];   %�n�~���O���Ƀ[���Â�
xh = x.*whzero;                               %�n�~���O���ɂ��؂�o��
%����������ꂽ�M���̐}���i���M�����}���j
subplot(2,2,1); 
stem(n,xr,'.'); hold on;                      %���`���ɂ��M���̐}��
plot(n,x,':'); hold off;                      %���M���̐}��
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_r(n)');
subplot(2,2,2); 
stem(n,xh,'.'); hold on;                      %�n�~���O���ɂ��M���̐}��
plot(n,x,':'); hold off;                      %���M���̐}��
axis([Nb Ne -2 2]); grid;
xlabel('Time n'); ylabel('x_h(n)');
%���`���ɂ�蓾��ꂽ�M���̎��g���X�y�N�g���̌v�Z
w = linspace(-pi,pi,1024);                    %���g��(-�΁`�΂�1024����)
Xr = freqz(xr,1,w);                           %���g���X�y�N�g���̐}��
magXr = abs(Xr); maxXr = max(magXr);
subplot(2,2,3); 
plot(w,20*log10(magXr/maxXr)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_r(e^{j\omega})| [dB]');
%�n�~���O����������ꂽ�M���̎��g���X�y�N�g���̌v�Z
Xh = freqz(xh,1,w);                           %���g���X�y�N�g���̐}��
magXh = abs(Xh); maxXh = max(magXh);          %���K���̂��߂̍ő�l
subplot(2,2,4); 
plot(w,20*log10(magXh/maxXh)); 
axis([-pi pi -60 0]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|X_h(e^{j\omega})| [dB]');