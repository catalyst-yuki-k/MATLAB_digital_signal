%2ŸŒ³˜A‘±‹óŠÔM†‚Ì—á
[t1,t2] = meshgrid(-20:20,-20:20);              %Šiq“_‚ğ’è‹`
X = exp(-0.01*(abs(t1).^2+abs(t2.^1.8)))...     %2ŸŒ³˜A‘±M†‚ğ‚Â‚­‚é
    + 0.5*exp(-0.03*((t1-13).^2+(t2+10).^2))...
    + 0.3*exp(-0.03*((t1+15).^2+(t2).^2));  
colormap(gray);                                 %”Z’W}¦‚ğw’è
subplot(2,2,1);
surfl(t1,t2,X), shading interp;                 %X‚ğ—§‘Ì}¦
xlabel('t_1'); ylabel('t_2'); 
subplot(2,2,2);
pcolor(t1,t2,X), shading interp;                %X‚ğ•½–Êã‚É”Z’W}¦
xlabel('t_1'); ylabel('t_2');