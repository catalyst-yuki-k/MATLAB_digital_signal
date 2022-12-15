%IIR ƒtƒBƒ‹ƒ^‚ÌU•“Á«‚ÆˆÊ‘Š“Á«
b = [1 0 1];                  %•ªqŒW”
a = [1 -0.9 0.81];            %•ª•êŒW”
w = -pi:0.01:pi;              %ü”g”‚Ì”ÍˆÍ
H = freqz(b,a,w);             %ü”g”‰“š
magH = abs(H);                %U•“Á«
argH = angle(H);              %ˆÊ‘Š“Á«
subplot(2,2,1);
plot(w, magH);                %U•“Á«‚Ì}¦
axis([-pi pi 0 8]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})|');
subplot(2,2,2);
plot(w,argH);                 %ˆÊ‘Š“Á«‚Ì}¦
axis([-pi pi -pi pi]); grid;
xlabel('Frequency \omega [rad]'); ylabel('\theta [rad]');