%���g���I�𐫃t�B���^�ɂ��t�B���^�����O
%��̎O�p�֐��g�̍���
wl = pi/8; wh = 7*pi/8;              %���g���̒l�̐ݒ�
nend = 50; n = 0:nend;               %�M���̋��
s = sin(wl*n);                       %�M��s
v = cos(wh*n);                       %�G��v
x = s+v;                             %�M��x=s+v�̍���
subplot(2,2,1);
plot(n,s,'-',n,v,':');               %s��v�̐}��
ymax = 1.5;  
axis([0 nend -ymax ymax]); grid;
xlabel('Time n'); ylabel('s(n) and v(n)'); 
legend('s(n)', 'v(n)'); 
subplot(2,2,2);
plot(n,x);                           %x=s+v�̐}��
axis([0 nend -ymax ymax]); grid;
xlabel('Time n'); ylabel('x(n)=s(n)+v(n)');
%FIR�t�B���^�̐U������
h = [1 4 6 4 1]/16;                  %�P�ʃC���p���X����
w = -pi:0.01:pi;                     %���g���̂����݂Ɣ͈�
H = freqz(h,1,w);                    %���g������
subplot(2,2,3);
plot(w,abs(H));                      %�U�������̐}��
axis([-pi pi 0 1.2]); grid; 
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
%FIR�t�B���^�����O 
y = filter(h,1,x);                   %�t�B���^�����O
subplot(2,2,4);
plot(n,y);                           %�t�B���^�o�͂̐}��
axis([0 nend -ymax ymax]); grid; 
xlabel('Time n'); ylabel('y(n)');