%zΟ·X(z)=N(z)/D(z)ΜΙΖλ_Μzu
Nz = [1 2 1];             %ͺqW
Dz = [1 -1 0.75];         %ͺκW
zr = roots(Nz)            %λ_ΜvZiN(z)=0ππ­j
pl = roots(Dz)            %ΙΜvZ  iD(z)=0ππ­j
zplane(Nz,Dz);            %Ιλ_Μ}¦
legend('zeros','poles');  %}α