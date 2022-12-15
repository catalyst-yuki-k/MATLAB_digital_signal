function [yc] = circconv(h,x)
    %�M��h��x�̏z�����݂���yc [yc] = circconv(h,x)
    %h = �M���Cx = �M���C��̐M���̒����͓������Ȃ���΂Ȃ�Ȃ�
    %yc = N�_�̏z�����݂��݂̌���
    if length(h) ~= length(x)                     %h��x�̒����͈قȂ邩
        error('Length of h and x must be equal');  %�قȂ�΃G���[�\���ƒ�~
    end
    N = length(h);                                %h�̒���
    yc = zeros(1,N);                              %yc�̏�����
    for n = 1:N
        for k = 1:N
            yc(n) = yc(n)+h(k)*x(mod((n-k),N)+1);   %�z�����݂��݂̎��s
        end
    end
end