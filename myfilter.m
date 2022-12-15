function [y] = myfilter(b,a,x)
    %�����������ɂ��f�B�W�^���t�B���^�����O [y] = myfilter(b,a,x)
    %�o��y�͈ȉ��̍�������������v�Z�����x�N�g��
    %  a(1)*y(n) =  -a(2)*y(n-1)-...-a(na+1)*y(n-na)
    %                 +b(1)*x(n)+b(2)*x(n-1)+...+b(nb+1)*x(n-nb)
    %a = �t�B�[�h�o�b�N�W���x�N�g���Cb = �t�B�[�h�t�H���[�h�W���x�N�g��
    %x = ���̓x�N�g��
    %
    a = a/a(1);                             %a(1)�ɂ��W���x�N�g��a�̐��K��
    b = b/a(1);                             %a(1)�ɂ��W���x�N�g��b�̐��K��
    na = length(a)-1; nb = length(b)-1;     %�W���̎���
    order = max(na,nb);                     %�t�B���^����
    xlength = length(x);                    %���͐M���̒���
    x = [zeros(1,order) x];                 %���͂̑O���Ƀ[���Â�
    y = zeros(1,order+xlength);             %�o�͂̏�����
    %�t�B���^�����O
    for n = order:order+xlength-1           %����n�̌v�Z�̃��[�v�J�n
        for k = 0:nb
            y(n+1) = y(n+1)+b(k+1)*x(n-k+1);  %�t�B�[�h�t�H�[���[�h���̌v�Z
        end
        for k = 1:na
            y(n+1) = y(n+1)-a(k+1)*y(n-k+1);  %�t�B�[�h�o�b�N���̌v�Z
        end
    end
    y = y(order+1:order+xlength);           %�o�͂̒����̒���(�s�v�ȃ[��������)
end