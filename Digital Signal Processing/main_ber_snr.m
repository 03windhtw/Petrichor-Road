snr_dB=0:2:20;
for t=1:length(snr_dB)
    [ber]=ber_snr(snr_dB(t))
    pb(t)=ber;
end
pb
figure(1)
semilogy(snr_dB,pb);
hold on
function[ber]=ber_snr(snr_dB)
N=10000;
%信噪比
%snr_dB=2;
snr=10^(snr_dB/10)
Es=1;%设定信号功率
delt2=Es/snr%控制噪声幅度
d_bit=randi([0,1],1,N);
d_mod=(2*d_bit-1);
n_am=sqrt(delt2)
n1=n_am*randn(1,N);
r1=d_mod+n1;
n2=n_am*randn(1,N);
r2=d_mod+n2;
r=(r1+r2)/2;
d_es=sign(r);
d_bit_es=(d_es+1)/2;
pb=sum(d_bit~=d_bit_es)
ber=pb
end
