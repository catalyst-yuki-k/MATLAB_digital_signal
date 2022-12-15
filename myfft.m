function [X] = myfft(x)%
    %�2�̎��ԊԈ����`FFT  [X] = myfft(x)
    %���͕ϐ� x = 2 �ׂ̂���̒����̃x�N�g��
    %�o�͕ϐ� X = �M�� x �̗��U�t�[���G�ϊ�
    %�Q�l���� Rabiner, Gold, ``Theory and Application of Digital
    %         Signal Processing,'' p. 367, 1975, Prentice-Hall.
    %
    %�M���̒����̊m�F
    N = length(x);
    if 2^fix(log2(N)) ~= N              %����N��2�ׂ̂���łȂ����
        error('N is not a power of 2');  %    ���b�Z�[�W�������ďI��
    end
    %
    %��]���q�̌v�Z
    WN = exp(-j*2*pi/N);
    t = 0:N/2-1;
    WNkn = WN.^t;
    %�M�� x �̃r�b�g�t��
    X = x;
    nv2 = N/2;
    nm1 = N-1;
    q = 1;
    for r = 1:nm1                       %�r�b�g�t���J�n
        if r < q
            tmp  = X(q);
            X(q) = X(r);
            X(r) = tmp;
        end
        k = nv2;
        while k < q
            q = q-k;
            k = k/2;
        end
        q = q+k;
    end                                %�r�b�g�t���I��
    %FFT �J�n
    p = fix(log2(N));                  %�M���̒����ׂ̂�
    for s = 1:p                        %��s�i�K
        k1 = 2^s;
        k2 = k1/2;
        Nk1 = N/k1;
        for m = 1:k2
            kn = (m-1)*Nk1+1;
            for q = m:k1:N
                r = q+k2;
                Xtmp = WNkn(kn)*X(r);     %�o�^�t���C
                X(r) = X(q)-Xtmp;
                X(q) = X(q)+Xtmp;
            end
        end
    end
end