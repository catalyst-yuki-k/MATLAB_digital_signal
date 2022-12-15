function [y] = myconv(h,x)
    %�����݂��݂̌v�Z [y] = myconv(h,x)
    %y��h��x�̂����݂���
    %y(n) = h(0)x(n)+h(1)x(n-1)+...+h(n)x(0)
    hlength = length(h);                            %h�̒���
    xlength = length(x);                            %x�̒���
    hzero = [h zeros(1,xlength-1)];                 %h�̃[���Â�
    xzero = [x zeros(1,hlength-1)];                 %x�̃[���Â�
    ylength = hlength+xlength-1;                    %�o��y�̒���
    y = zeros(1,ylength);                           %�o�͂̏�����
    for n = 0:ylength-1
        for k = 0:n
            y(n+1) = y(n+1)+hzero(k+1)*xzero(n-k+1);  %�����݂��݂̌v�Z
        end
    end
end