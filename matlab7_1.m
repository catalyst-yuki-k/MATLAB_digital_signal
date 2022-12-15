%FIRƒtƒBƒ‹ƒ^‚ÌU•“Á«‚ÆˆÊ‘Š“Á«
h = [1 1 1 1 1]/5;            %ƒCƒ“ƒpƒ‹ƒX‰“š
w = -pi:0.01:pi;              %ü”g”‚Ì”ÍˆÍ
H = freqz(h,1,w);             %ü”g”‰“š
magH = abs(H);                %U•“Á«
argH = angle(H);              %ˆÊ‘Š“Á«
subplot(2,2,1);
plot(w,magH);                 %U•“Á«‚Ì}¦
axis([-pi pi 0 1.2]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);
plot(w,argH);                 %ˆÊ‘Š“Á«‚Ì}¦
axis([-pi pi -pi pi]); grid;  
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');