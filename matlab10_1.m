%�����ƎՒf���g�����^����ꂽ�Ƃ��̃o�^���[�X�t�B���^�̐݌v
N = 2;                          %�^����ꂽ����
Wc = 1;                         %�^����ꂽ�Ւf���g��
if mod(N,2) == 0                %N�����������
   dk = 0.5;                    %N�������̂Ƃ�
else 
   dk = 0;                      %N����̂Ƃ�
end
k = 0:2*N-1;
pk = (Wc*exp(j*(k+dk)*pi/N))';  %2N�̋�
pk = pk(real(pk)<0)             %����ȋɁi�����������̋Ɂj�݂̂�I��
zr = zeros(0,1);                %��_
[b,a] = zp2tf(zr,pk,Wc^2)       %��_�Ƌɂ���`�B�֐��̕��q�ƕ���W��