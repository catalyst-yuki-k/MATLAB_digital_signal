%zŠÂ‚½‚½‚Ý‚±‚Ý‚É‚æ‚éüŒ`‚½‚½‚Ý‚±‚Ý‚ÌŽÀs
h = [8 4 2 1];
x = [1 2 3 4];
hp = [h zeros(1,length(x)-1)]  %h‚Éƒ[ƒ‚Ã‚ß
xp = [x zeros(1,length(h)-1)]  %h‚Éƒ[ƒ‚Ã‚ß
ycp = circconv(hp,xp)          %zŠÂ‚½‚½‚Ý‚±‚Ý