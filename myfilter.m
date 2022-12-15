function [y] = myfilter(b,a,x)
    %差分方程式によるディジタルフィルタリング [y] = myfilter(b,a,x)
    %出力yは以下の差分方程式から計算されるベクトル
    %  a(1)*y(n) =  -a(2)*y(n-1)-...-a(na+1)*y(n-na)
    %                 +b(1)*x(n)+b(2)*x(n-1)+...+b(nb+1)*x(n-nb)
    %a = フィードバック係数ベクトル，b = フィードフォワード係数ベクトル
    %x = 入力ベクトル
    %
    a = a/a(1);                             %a(1)による係数ベクトルaの正規化
    b = b/a(1);                             %a(1)による係数ベクトルbの正規化
    na = length(a)-1; nb = length(b)-1;     %係数の次数
    order = max(na,nb);                     %フィルタ次数
    xlength = length(x);                    %入力信号の長さ
    x = [zeros(1,order) x];                 %入力の前部にゼロづめ
    y = zeros(1,order+xlength);             %出力の初期化
    %フィルタリング
    for n = order:order+xlength-1           %時刻nの計算のループ開始
        for k = 0:nb
            y(n+1) = y(n+1)+b(k+1)*x(n-k+1);  %フィードフォーワード部の計算
        end
        for k = 1:na
            y(n+1) = y(n+1)-a(k+1)*y(n-k+1);  %フィードバック部の計算
        end
    end
    y = y(order+1:order+xlength);           %出力の長さの調整(不要なゼロを除く)
end