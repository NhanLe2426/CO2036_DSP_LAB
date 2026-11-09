// ------------------------------------------------------------
// Buoc 1: Tao tin hieu sin 440 Hz de phat am thanh
// ------------------------------------------------------------
fs  = 44100;                     // Tan so lay mau chuan
t   = 0 : 1/fs : 2;              // Thoi gian 2 giay
sig = sin(2 * %pi * 440 * t);    // 440 Hz - nut La, nghe duoc
N   = length(sig);
disp('Tan so lay mau (Hz):'); disp(fs);
disp('Tong so mau:');         disp(N);
disp('Thoi luong (giay):');   disp(N / fs);

// ------------------------------------------------------------
// Buoc 2: Tang am luong gap doi
// ------------------------------------------------------------
sig_loud = 2 * sig;
sig_loud = max(min(sig_loud, 1), -1);  // Gioi han bien do [-1, 1]

// ------------------------------------------------------------
// Buoc 3: Tang va giam toc do phat
// ------------------------------------------------------------
fs_fast = 2 * fs;     // 88200 Hz - cao do cao hon
fs_slow = fs / 2;     // 22050 Hz - cao do thap hon

// ------------------------------------------------------------
// Buoc 4: Phat am thanh lan luot
// ------------------------------------------------------------
disp('Phat tin hieu goc 440 Hz...');
playsnd(sig, fs);

disp('Phat am luong tang gap doi...');
playsnd(sig_loud, fs);

disp('Phat toc do nhanh - cao do cao hon...');
playsnd(sig, fs_fast);

disp('Phat toc do cham - cao do thap hon...');
playsnd(sig, fs_slow);

// ------------------------------------------------------------
// Buoc 5: Luu cac phien ban ra file WAV
// ------------------------------------------------------------
save_path = pwd() + "\";
wavwrite(sig,      fs,      save_path + 'output_goc.wav');
wavwrite(sig_loud, fs,      save_path + 'output_loud.wav');
wavwrite(sig,      fs_fast, save_path + 'output_fast.wav');
wavwrite(sig,      fs_slow, save_path + 'output_slow.wav');
disp('Da luu file tai: ' + save_path);

// ------------------------------------------------------------
// Buoc 6: Ve do thi so sanh (chi lay 0.01 giay de nhin ro)
// ------------------------------------------------------------
n_show      = round(0.01 * fs);
t_show      = t(1 : n_show);
t_fast_show = t_show / 2;

clf();
subplot(3, 1, 1);
    plot2d(t_show, sig(1:n_show));
    xlabel('Thoi gian (s)'); ylabel('Bien do');
    title('Tin hieu goc - sin 440 Hz'); xgrid();

subplot(3, 1, 2);
    plot2d(t_show, sig_loud(1:n_show));
    xlabel('Thoi gian (s)'); ylabel('Bien do');
    title('Am luong tang gap doi (clip -1 den 1)'); xgrid();

subplot(3, 1, 3);
    plot2d(t_fast_show, sig(1:n_show));
    xlabel('Thoi gian (s)'); ylabel('Bien do');
    title('Toc do nhanh gap doi - fs = 88200 Hz'); xgrid();
