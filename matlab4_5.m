%�z�����݂��݂ɂ����`�����݂��݂̎��s
h = [8 4 2 1];
x = [1 2 3 4];
hp = [h zeros(1,length(x)-1)]  %h�Ƀ[���Â�
xp = [x zeros(1,length(h)-1)]  %h�Ƀ[���Â�
ycp = circconv(hp,xp)          %�z�����݂���