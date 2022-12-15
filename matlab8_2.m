%���`�ʑ������Ɣ���`�ʑ������̔�r
%���`�ʑ�FIR�t�B���^
hlin = [1 4 6 4 1]/16;              %���`�ʑ��t�B���^�̒P�ʃC���p���X����
w = 0:0.01:pi;                      %���g���͈̔�
Hlin = freqz(hlin,1,w);             %���g�������̌v�Z
figure(1)
subplot(2,2,1); plot(w,abs(Hlin));  %�U�������̐}��
axis([0 pi 0 1.2]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('|H_{l}(e^{j\omega})|');
subplot(2,2,2); plot(w,unwrap(angle(Hlin))); %�ʑ������̐}��
axis([0 pi -10 0]); grid;          
xlabel('Frequency \omega [rad]'); ylabel('\theta_{l}(\omega)');
%���`�ʑ��t�B���^�����O
x = [ones(1,8) -ones(1,8) ones(1,8) -ones(1,8)]; %���͐M��
n = 0:length(x)-1;                  %�����͈̔�
subplot(2,2,3); stem(n,x);          %���͂̐}��
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
ylin = filter(hlin,1,x);            %���`�ʑ��t�B���^�����O
subplot(2,2,4); stem(n,ylin);       %�o�͂̐}��
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('y_l(n)');
%����`�ʑ�IIR�t�B���^�����O
alpha = 0.8;                        %�S��ʉ߃t�B���^�̃p�����[�^
numap = [-alpha  1];                %���q�W��
denap = [1 -alpha];                 %����W��
Hap = freqz(numap,denap,w);         %���g�������̌v�Z
Hnl = Hap.*Hlin;                    %�c���ڑ��̎��g�������̌v�Z
figure(2)
subplot(2,2,1); plot(w,abs(Hnl));   %�U�������̐}��
axis([0 pi 0 1.2]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('|H_{nl}(e^{j\omega})|');
subplot(2,2,2); plot(w,unwrap(angle(Hnl))); %�ʑ������̐}��
axis([0 pi -10 0]); grid;           
xlabel('Frequency \omega [rad]'); ylabel('\theta_{nl}(\omega)');
subplot(2,2,3); stem(n,x);          %���͂̐}��
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('x(n)');
ynonlin = filter(numap,denap,ylin); %����`�ʑ��t�B���^�����O
subplot(2,2,4); stem(n,ynonlin);    %�o�͂̐}��
axis([0 length(x)-1 -2 2]); grid;
xlabel('Time n'); ylabel('y_{nl}(n)');