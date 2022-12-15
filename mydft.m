function [X] = mydft(x)
    %���U�t�[���G�ϊ� [X] = mydft(x)
    %���͈��� x = �M��
    %�o�͈��� X = x �̗��U�t�[���G�ϊ�
    N = length(x);                          %�M���̒���
    kn = 0:N-1;                             %��]���q�̃C���f�b�N�X
    WN = exp(-j*2*pi/N);
    WNkn = WN.^kn;                          %��]���q
    X = zeros(1,N);                         %X�̏�����
    for k = 0:N-1
        for n = 0:N-1
            p = mod(k*n,N);                    %��]���q�̎w���̌v�Z
            X(k+1) = X(k+1)+x(n+1)*WNkn(p+1);  %DFT�̌v�Z
        end
    end
end