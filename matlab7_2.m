%IIR �t�B���^�̐U�������ƈʑ�����
b = [1 0 1];                  %���q�W��
a = [1 -0.9 0.81];            %����W��
w = -pi:0.01:pi;              %���g���͈̔�
H = freqz(b,a,w);             %���g������
magH = abs(H);                %�U������
argH = angle(H);              %�ʑ�����
subplot(2,2,1);
plot(w, magH);                %�U�������̐}��
axis([-pi pi 0 8]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);
plot(w,argH);                 %�ʑ������̐}��
axis([-pi pi -pi pi]); grid;
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');