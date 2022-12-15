%FIR�t�B���^�̐U�������ƈʑ�����
h = [1 1 1 1 1]/5;            %�C���p���X����
w = -pi:0.01:pi;              %���g���͈̔�
H = freqz(h,1,w);             %���g������
magH = abs(H);                %�U������
argH = angle(H);              %�ʑ�����
subplot(2,2,1);
plot(w,magH);                 %�U�������̐}��
axis([-pi pi 0 1.2]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);
plot(w,argH);                 %�ʑ������̐}��
axis([-pi pi -pi pi]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');