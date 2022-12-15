%���g���ϊ��ɂ�鍂��C�ш�C�ш�j�~�f�B�W�^���t�B���^�̐݌v
%�v���g�^�C�v�t�B���^
b = 0.0976*[1 2 1];                         %���q�W��
a = [1 -0.9428 0.3333];                     %����W��
thetac = 0.25*pi;                           %�Ւf���g��
theta = 0:0.01:pi;                          %���g���͈̔�
subplot(2,2,1);
Hl = freqz(b,a,theta);                      %���g������
plot(theta,20*log10(abs(Hl)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \theta [rad]'); ylabel('|H(e^{j\theta})| [dB]');
%����t�B���^�̐݌v
wc = 0.6*pi;                                %����t�B���^�̎Ւf���g��
[Bh,Ah] = freqztrans(b,a,'hp',thetac,wc)    %���]����̎��g���ϊ�
w = 0:0.01:pi; 
Hh = freqz(Bh,Ah,w);                        %����t�B���^�̎��g������
subplot(2,2,2);
plot(w,20*log10(abs(Hh)+eps));   
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H_{h}(e^{j\omega})| [dB]');
%�ш�t�B���^�̐݌v
wc = [0.25*pi 0.5*pi];                      %�ш�t�B���^�̎Ւf���g��
[Bbp,Abp] = freqztrans(b,a,'bp',thetac,wc)  %���]�ш�̎��g���ϊ�
Hbp = freqz(Bbp,Abp,w);                     %�ш�t�B���^�̎��g������
subplot(2,2,3);
plot(w,20*log10(abs(Hbp)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('H_{bp}(e^{j\omega})| [dB]');
%�ш�j�~�t�B���^�̐݌v
wc = [0.25*pi 0.5*pi];                      %�ш�j�~�t�B���^�̎Ւf���g��
[Bbs,Abs] = freqztrans(b,a,'bs',thetac,wc)  %���]�ш�j�~�̎��g���ϊ�
Hbs = freqz(Bbs,Abs,w);                     %�ш�j�~�t�B���^�̎��g������
subplot(2,2,4);
plot(w,20*log10(abs(Hbs)+eps)); 
axis([0 pi -60 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H_{bs}(e^{j\omega})| [dB]');