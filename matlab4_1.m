%FFT の実行例
x = [1 1 1 1 0 0 0 0];  %8点の信号
X = myfft(x)            %FFTの実行
magX = abs(X)           %振幅スペクトル