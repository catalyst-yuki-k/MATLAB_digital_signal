function [X] = myfft(x)%
    %基数2の時間間引き形FFT  [X] = myfft(x)
    %入力変数 x = 2 のべき乗の長さのベクトル
    %出力変数 X = 信号 x の離散フーリエ変換
    %参考文献 Rabiner, Gold, ``Theory and Application of Digital
    %         Signal Processing,'' p. 367, 1975, Prentice-Hall.
    %
    %信号の長さの確認
    N = length(x);
    if 2^fix(log2(N)) ~= N              %長さNが2のべき乗でなければ
        error('N is not a power of 2');  %    メッセージをだして終了
    end
    %
    %回転因子の計算
    WN = exp(-j*2*pi/N);
    t = 0:N/2-1;
    WNkn = WN.^t;
    %信号 x のビット逆順
    X = x;
    nv2 = N/2;
    nm1 = N-1;
    q = 1;
    for r = 1:nm1                       %ビット逆順開始
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
    end                                %ビット逆順終了
    %FFT 開始
    p = fix(log2(N));                  %信号の長さのべき
    for s = 1:p                        %第s段階
        k1 = 2^s;
        k2 = k1/2;
        Nk1 = N/k1;
        for m = 1:k2
            kn = (m-1)*Nk1+1;
            for q = m:k1:N
                r = q+k2;
                Xtmp = WNkn(kn)*X(r);     %バタフライ
                X(r) = X(q)-Xtmp;
                X(q) = X(q)+Xtmp;
            end
        end
    end
end