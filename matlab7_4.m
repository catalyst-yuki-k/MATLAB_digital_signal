%IIRtB^ÌÉÆë_Ìzu
b = [1 0 1];              %ªqW
a = [1 -0.9 0.81];        %ªêW
zr = roots(b)             %ë_ÌvZ
pl = roots(a)             %ÉÌvZ
zplane(b,a);              %Éë_Ì}¦
legend('zeros','poles');  %}á