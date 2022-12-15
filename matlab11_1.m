%���ږ@�ɂ��f�B�W�^�����t�B���^�̐݌v
wc = 0.25*pi;               %�Ւf���g��
ws = 0.75*pi;               %�j�~��[���g��
As = 30;                    %�j�~�挸����
[b,a,N] = direct(wc,ws,As)  %���ڐ݌v(���q�C����C�����j
zr = roots(b)               %��_
pl = roots(a)               %��
subplot(2,2,1);
zplane(b,a);                %�ɗ�_�z�u
legend('zeros','poles');
w = 0:0.01:pi;
H = freqz(b,a,w);           %���g�������̌v�Z
subplot(2,2,2); 
plot(w,20*log10(abs(H)));   %�U�������̐}��
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');