%z�ϊ�X(z)=N(z)/D(z)�̋ɂƗ�_�̔z�u
Nz = [1 2 1];             %���q�W��
Dz = [1 -1 0.75];         %����W��
zr = roots(Nz)            %��_�̌v�Z�iN(z)=0�������j
pl = roots(Dz)            %�ɂ̌v�Z  �iD(z)=0�������j
zplane(Nz,Dz);            %�ɗ�_�̐}��
legend('zeros','poles');  %�}��