%�C���p���X�s�ϕϊ��@�ɂ��f�B�W�^���t�B���^�̐݌v
Wc = pi/8                          %�Ւf���g��
[bs,as] = butter(2,Wc,'s')         %2���v���g�^�C�v�t�B���^�̕��q����ꑽ����
[bz,az] = impinvar(bs,as,1)        %�C���p���X�s�ϕϊ��@�ɂ��݌v
w = 0:0.01:pi;
Ha = freqs(bs,as,w);               %�v���g�^�C�v�t�B���^�̎��g������
Hz = freqz(bz,az,w);               %�f�B�W�^���t�B���^�̎��g������
maxHz = max(abs(Hz));
subplot(2,2,1);
plot(w,20*log10(abs(Ha)),':', ...
     w,20*log10(abs(Hz)/maxHz));   %���g�������̐}��
axis([0 pi -40 5]); grid; 
xlabel('Frequency \Omega, \omega'); 
ylabel('|H_a(j\Omega)|,  |H(e^{j\omega})|');
legend('H_a(j\Omega)','H(e^{j\omega})');
%�P�ʃC���p���X�����̔�r
tend = 25; t = 0:0.1:25;           %���Ԃ͈̔�
alpha = Wc/sqrt(2);
ha = 2*alpha*exp(-alpha*t).*sin(alpha*t); %�v���g�^�C�v�̃C���p���X����
subplot(2,2,2);
plot(t,ha);                        %�C���p���X�����̐}��
axis([0 tend -0.05 0.2]); grid;
xlabel('Time t, n'); ylabel('h_a(t), h(n)');
hold on;                           %��ʂ̕ێ�
n = 0:tend;                        %���Ԃ͈̔�
x = zeros(1,tend+1); x(1) = 1;     %�P�ʃC���p���X����
h = filter(bz,az,x);               %�f�B�W�^���t�B���^�̃C���p���X����
stem(n,h);                         %�C���p���X�����̐}��
legend('h_a(t)','h(n)');           
hold off;                          %��ʕێ��̉���