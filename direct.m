function [num,den,N] = direct(wc,ws,As)
    %ディジタルバタワース低域フィルタの直接設計 [num,den,N] = direct(wc,ws,As)
    %入力変数 wc = 遮断周波数[rad], ws = 阻止域端周波数[rad]
    %         As = 阻止域減衰量[dB]
    %出力変数 num, den = 設計されたフィルタの分子・分母係数
    %         N = 設計されたフィルタの次数
    %
    %次数と零点の計算
    N = ceil(0.5*log10(10^(As/10)-1) / log10(tan(ws/2)/tan(wc/2)));
    zr = -ones(N,1);
    %q平面の極の計算
    k = 0:2*N-1;
    if mod(N,2) == 0                            %Nは偶数か
        qk = tan(wc/2)*exp(j*(2*k+1)*pi/(2*N));  %N=偶数のとき
    else
        qk = tan(wc/2)*exp(j*k*pi/N);            %N=奇数のとき
    end
    %z平面の極
    pk = ((1+qk)./(1-qk))';                     %極
    pl = pk(abs(pk)<1);                         %安定な極(絶対値1以下)を選択
    %伝達関数の計算
    K = abs(prod(1-pl)/2^N);                    %伝達関数のゲイン
    [num,den] = zp2tf(zr,pl,K);                 %零点と極，ゲインから伝達関数へ
end