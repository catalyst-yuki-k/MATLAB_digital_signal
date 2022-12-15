function [yc] = circconv(h,x)
    %信号hとxの循環たたみこみyc [yc] = circconv(h,x)
    %h = 信号，x = 信号，二つの信号の長さは等しくなければならない
    %yc = N点の循環たたみこみの結果
    if length(h) ~= length(x)                     %hとxの長さは異なるか
        error('Length of h and x must be equal');  %異なればエラー表示と停止
    end
    N = length(h);                                %hの長さ
    yc = zeros(1,N);                              %ycの初期化
    for n = 1:N
        for k = 1:N
            yc(n) = yc(n)+h(k)*x(mod((n-k),N)+1);   %循環たたみこみの実行
        end
    end
end