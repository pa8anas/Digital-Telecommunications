Lb = 100002;
input = randsrc(Lb,1,[0 1]);
figure (1) %BER
gray=0;
M=2;
mainb;
SNR=0:5:40;
semilogy(SNR,BER,'bo-'); xlabel('SNR'); ylabel('BER');
clearvars -except input;
gray=0;
M=4;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'b^-'); xlabel('SNR'); ylabel('BER');
hold off
clearvars -except input;
gray=1;
M=4;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'ro-'); xlabel('SNR'); ylabel('BER');
hold off
clearvars -except input;
gray=0;
M=8;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'r^-'); xlabel('SNR'); ylabel('BER');
hold off
clearvars -except input;
gray=1;
M=8;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'co-'); xlabel('SNR'); ylabel('BER');
hold off
clearvars -except input;
gray=0;
M=16;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'c^-'); xlabel('SNR'); ylabel('BER');
hold off
clearvars -except input;
gray=1;
M=16;
mainb;
SNR=0:5:40;
hold on
semilogy(SNR,BER,'z^-'); xlabel('SNR'); ylabel('BER');
hold off
legend('2PAM','4PAM','4PAM-Gray','8PAM','8PAM-Gray','16PAM','16PAM-Gray');
clearvars -except input;
