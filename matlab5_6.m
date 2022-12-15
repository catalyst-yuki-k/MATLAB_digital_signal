%1ŸÄ‹AŒ`ƒtƒBƒ‹ƒ^‚Ìü”g”‰“š
b = [0.5]; a = [1 -0.5];      %ŒW”ƒxƒNƒgƒ‹
w = -pi:0.01:pi;              %ü”g”‚Ì”ÍˆÍ
H = freqz(b,a,w);             %ü”g”‰“š‚ÌŒvZ
magH = abs(H);                %U•“Á«
argH = angle(H);              %ˆÊ‘Š“Á«
subplot(2,2,1);
plot(w,magH);                 %U•“Á«‚Ì}¦
axis([-pi pi 0 1.5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2); 
plot(w,argH);                 %ˆÊ‘Š“Á«‚Ì}¦
axis([-pi pi -pi pi]); grid;
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');
