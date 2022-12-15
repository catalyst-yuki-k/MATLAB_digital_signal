%FIRtB^ÌUÁ«ÆÊÁ«
h = [1 1 1 1 1]/5;            %CpX
w = -pi:0.01:pi;              %ügÌÍÍ
H = freqz(h,1,w);             %üg
magH = abs(H);                %UÁ«
argH = angle(H);              %ÊÁ«
subplot(2,2,1);
plot(w,magH);                 %UÁ«Ì}¦
axis([-pi pi 0 1.2]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);
plot(w,argH);                 %ÊÁ«Ì}¦
axis([-pi pi -pi pi]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');