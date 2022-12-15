%ディジタルフィルタの単位ステップ応答
beta = 1.0;                               %パラメータの設定
b = [beta];                               %フィードフォワード係数
alpha = 0.5;                              %パラメータの設定
a = [1 -alpha];                           %フィードバック係数
nend = 10;                                %終了時刻
n = 0:nend;                               %時刻の範囲
x = ones(1,nend+1);                       %単位ステップ入力
y = filter(b,a,x)                         %差分方程式による出力の計算
stem(n,y);                                %出力の図示
axis([0 nend 0 2.5]); grid;               %座標軸の範囲の指定,格子の図示
xlabel('Time n'); ylabel('Output y(n)');  %座標軸名の設定