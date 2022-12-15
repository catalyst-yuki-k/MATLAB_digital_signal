%基本的な離散時間信号
nbegin = -5; nend = 10; n = nbegin:nend; %時間の範囲
n0 = 0;                                  %信号の開始時刻
%単位インパルス
delta = [(n-n0)==0];                     %時刻n=n0で1，その他で0
subplot(2,2,1);                          %画面を2x2に分割し，位置1に設定
stem(n,delta);                           %deltaを図示
xlabel('Time n'); ylabel('\delta(n)'); grid; 
%単位ステップ
unitstep = [(n-n0)>=0];                  %時刻n>=n0で1，その他で0
subplot(2,2,2);                          %画面を2x2に分割し，位置2に設定
stem(n,unitstep);                        %unitstepを図示
xlabel('Time n'); ylabel('u_0(n)'); grid;                        
%ランプ関数
ramp = [(n-n0)>=0].*(n-n0);              %時刻n>=n0でランプの値，その他で0
subplot(2,2,3);                          %画面を2x2に分割し，位置3に設定
stem(n,ramp); grid;                      %rampを図示
xlabel('Time n'); ylabel('r(n)');
%指数関数
alpha = 0.75; 
a = [(n-n0)>=0].*alpha.^(n-n0);          %時刻n>=n0で指数関数，その他で0
subplot(2,2,4);                          %画面を2x2に分割し，位置4に設定
stem(n,a);                               %aを図示
xlabel('Time n'); ylabel('a(n)'); grid;