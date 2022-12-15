function [B,A] = freqztrans(b,a,ftype,thetac,wc)
    %Symbolic Math を用いた周波数変換 [B,A] = freqztrans(b,a,ftype,thetac,wc)
    %入力変数: b,a = プロトタイプフィルタの分子・分母係数
    %          thetac = プロトタイプフィルタの遮断周波数[rad]
    %          wc = 所望の遮断周波数（スカラーまたはベクトル）[rad]
    %          ftype = 所望のフィルタのタイプ  低域: 'lp', 高域:    'hp',
    %                                        帯域: 'bp', 帯域阻止: 'bs'
    %出力変数: B, A = 設計されたフィルタの分子・分母係数
    %
    syms z Z;                         %シンボルの宣言
    %プロトタイプフィルタの分子・分母の係数からzの有理多項式
    Hl = poly2sym(b,z)/poly2sym(a,z);
    %周波数変換の式の選択
    switch ftype %フィルタのタイプによる周波数変換の設定
        case{'lp'}                     %低域-低域変換
            alpha = sin((thetac-wc)/2)/sin((thetac+wc)/2);
            zinv = (Z^(-1)-alpha)/(1-alpha*Z^(-1));
        case{'hp'}                     %低域高域変換
            alpha = -cos((thetac+wc)/2)/cos((thetac-wc)/2);
            zinv = -(Z^(-1)+alpha)/(1+alpha*Z^(-1));
        case{'bp'}                     %低域-帯域変換
            w1 = wc(1); w2 = wc(2);
            alpha = cos((w2+w1)/2)/cos((w2-w1)/2);
            k = cot((w2-w1)/2)*tan(thetac/2);
            zinv = -(Z^(-2)-2*alpha*k*Z^(-1)/(k+1)+(k-1)/(k+1)) ...
                /((k-1)/(k+1)*Z^(-2)-2*alpha*k*Z^(-1)/(k+1)+1);
        case{'bs'}                     %低域-帯域阻止変換
            w1 = wc(1); w2 = wc(2);
            alpha = cos((w2+w1)/2)/cos((w2-w1)/2);
            k = tan((w2-w1)/2)*tan(thetac/2);
            zinv = (Z^(-2)-2*alpha*Z^(-1)/(1+k)+(1-k)/(1+k)) ...
                /(Z^(-2)*(1-k)/(1+k)-2*alpha*Z^(-1)/(1+k)+1);
        otherwise
            error('filter type error');  %エラーの表示
    end
    %周波数変換（HlのzにZの関数を代入し，HZを得る）
    HZ = compose(Hl,1/zinv,z,Z);      %Hlのzに1/zinv を代入し，HZをつくる
    HZ = simplify(HZ);                %HZを簡単化し，Zの有理多項式とする
    [BZ,AZ] = numden(HZ);             %HZを分子・分母多項式にわける
    B = sym2poly(BZ);                 %分子多項式から分子係数
    A = sym2poly(AZ);                 %分母多項式から分母係数
    B = B/A(1);                       %分子係数の正規化
    A = A/A(1);                       %分子係数の正規化
end