%極によるディジタルフィルタの安定性判別
a = [1 -0.9 0.81];     %伝達関数の分母係数
pl = roots(a)          %極の計算
maxpl = max(abs(pl))   %極の絶対値の最大値
if maxpl < 1           %極の絶対値の最大値は1より小さいか
   disp('Stable');     %そのときは安定と表示
else      
   disp('Unstable');   %その他のとき不安定と表示
end