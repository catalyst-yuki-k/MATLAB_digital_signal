function [num,den,N] = direct(wc,ws,As)
    %�f�B�W�^���o�^���[�X���t�B���^�̒��ڐ݌v [num,den,N] = direct(wc,ws,As)
    %���͕ϐ� wc = �Ւf���g��[rad], ws = �j�~��[���g��[rad]
    %         As = �j�~�挸����[dB]
    %�o�͕ϐ� num, den = �݌v���ꂽ�t�B���^�̕��q�E����W��
    %         N = �݌v���ꂽ�t�B���^�̎���
    %
    %�����Ɨ�_�̌v�Z
    N = ceil(0.5*log10(10^(As/10)-1) / log10(tan(ws/2)/tan(wc/2)));
    zr = -ones(N,1);
    %q���ʂ̋ɂ̌v�Z
    k = 0:2*N-1;
    if mod(N,2) == 0                            %N�͋�����
        qk = tan(wc/2)*exp(j*(2*k+1)*pi/(2*N));  %N=�����̂Ƃ�
    else
        qk = tan(wc/2)*exp(j*k*pi/N);            %N=��̂Ƃ�
    end
    %z���ʂ̋�
    pk = ((1+qk)./(1-qk))';                     %��
    pl = pk(abs(pk)<1);                         %����ȋ�(��Βl1�ȉ�)��I��
    %�`�B�֐��̌v�Z
    K = abs(prod(1-pl)/2^N);                    %�`�B�֐��̃Q�C��
    [num,den] = zp2tf(zr,pl,K);                 %��_�ƋɁC�Q�C������`�B�֐���
end