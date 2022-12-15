function [B,A] = freqztrans(b,a,ftype,thetac,wc)
    %Symbolic Math ��p�������g���ϊ� [B,A] = freqztrans(b,a,ftype,thetac,wc)
    %���͕ϐ�: b,a = �v���g�^�C�v�t�B���^�̕��q�E����W��
    %          thetac = �v���g�^�C�v�t�B���^�̎Ւf���g��[rad]
    %          wc = ���]�̎Ւf���g���i�X�J���[�܂��̓x�N�g���j[rad]
    %          ftype = ���]�̃t�B���^�̃^�C�v  ���: 'lp', ����:    'hp',
    %                                        �ш�: 'bp', �ш�j�~: 'bs'
    %�o�͕ϐ�: B, A = �݌v���ꂽ�t�B���^�̕��q�E����W��
    %
    syms z Z;                         %�V���{���̐錾
    %�v���g�^�C�v�t�B���^�̕��q�E����̌W������z�̗L��������
    Hl = poly2sym(b,z)/poly2sym(a,z);
    %���g���ϊ��̎��̑I��
    switch ftype %�t�B���^�̃^�C�v�ɂ����g���ϊ��̐ݒ�
        case{'lp'}                     %���-���ϊ�
            alpha = sin((thetac-wc)/2)/sin((thetac+wc)/2);
            zinv = (Z^(-1)-alpha)/(1-alpha*Z^(-1));
        case{'hp'}                     %��捂��ϊ�
            alpha = -cos((thetac+wc)/2)/cos((thetac-wc)/2);
            zinv = -(Z^(-1)+alpha)/(1+alpha*Z^(-1));
        case{'bp'}                     %���-�ш�ϊ�
            w1 = wc(1); w2 = wc(2);
            alpha = cos((w2+w1)/2)/cos((w2-w1)/2);
            k = cot((w2-w1)/2)*tan(thetac/2);
            zinv = -(Z^(-2)-2*alpha*k*Z^(-1)/(k+1)+(k-1)/(k+1)) ...
                /((k-1)/(k+1)*Z^(-2)-2*alpha*k*Z^(-1)/(k+1)+1);
        case{'bs'}                     %���-�ш�j�~�ϊ�
            w1 = wc(1); w2 = wc(2);
            alpha = cos((w2+w1)/2)/cos((w2-w1)/2);
            k = tan((w2-w1)/2)*tan(thetac/2);
            zinv = (Z^(-2)-2*alpha*Z^(-1)/(1+k)+(1-k)/(1+k)) ...
                /(Z^(-2)*(1-k)/(1+k)-2*alpha*Z^(-1)/(1+k)+1);
        otherwise
            error('filter type error');  %�G���[�̕\��
    end
    %���g���ϊ��iHl��z��Z�̊֐��������CHZ�𓾂�j
    HZ = compose(Hl,1/zinv,z,Z);      %Hl��z��1/zinv �������CHZ������
    HZ = simplify(HZ);                %HZ���ȒP�����CZ�̗L���������Ƃ���
    [BZ,AZ] = numden(HZ);             %HZ�𕪎q�E���ꑽ�����ɂ킯��
    B = sym2poly(BZ);                 %���q���������番�q�W��
    A = sym2poly(AZ);                 %���ꑽ�������番��W��
    B = B/A(1);                       %���q�W���̐��K��
    A = A/A(1);                       %���q�W���̐��K��
end