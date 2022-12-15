%1���ċA�`�t�B���^�̎��g������
b = [0.5]; a = [1 -0.5];      %�W���x�N�g��
w = -pi:0.01:pi;              %���g���͈̔�
H = freqz(b,a,w);             %���g�������̌v�Z
magH = abs(H);                %�U������
argH = angle(H);              %�ʑ�����
subplot(2,2,1);
plot(w,magH);                 %�U�������̐}��
axis([-pi pi 0 1.5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2); 
plot(w,argH);                 %�ʑ������̐}��
axis([-pi pi -pi pi]); grid;
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');
