function [y] = myconv(h,x)
    %たたみこみの計算 [y] = myconv(h,x)
    %yはhとxのたたみこみ
    %y(n) = h(0)x(n)+h(1)x(n-1)+...+h(n)x(0)
    hlength = length(h);                            %hの長さ
    xlength = length(x);                            %xの長さ
    hzero = [h zeros(1,xlength-1)];                 %hのゼロづめ
    xzero = [x zeros(1,hlength-1)];                 %xのゼロづめ
    ylength = hlength+xlength-1;                    %出力yの長さ
    y = zeros(1,ylength);                           %出力の初期化
    for n = 0:ylength-1
        for k = 0:n
            y(n+1) = y(n+1)+hzero(k+1)*xzero(n-k+1);  %たたみこみの計算
        end
    end
end