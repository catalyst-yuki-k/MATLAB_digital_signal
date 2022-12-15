function [X] = mydft(x)
    %離散フーリエ変換 [X] = mydft(x)
    %入力引数 x = 信号
    %出力引数 X = x の離散フーリエ変換
    N = length(x);                          %信号の長さ
    kn = 0:N-1;                             %回転因子のインデックス
    WN = exp(-j*2*pi/N);
    WNkn = WN.^kn;                          %回転因子
    X = zeros(1,N);                         %Xの初期化
    for k = 0:N-1
        for n = 0:N-1
            p = mod(k*n,N);                    %回転因子の指数の計算
            X(k+1) = X(k+1)+x(n+1)*WNkn(p+1);  %DFTの計算
        end
    end
end