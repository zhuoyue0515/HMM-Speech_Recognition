% testing process
a = {'down', 'forward', 'go', 'hovering', 'left', 'off', 'right', 'roll', 'take', 'up'};
count = 0;
for j = 1:10
    for p = 21:25
        filename = ['dataset/' a(j) '/' a(j) num2str(p) '.wav'];
        filename = cell2mat(filename);
        [x, fs] = audioread(filename);
        [mfccs_x, spectgram, f, t] = GetSpeechFeatures(x, fs, 0.03, 13);
        delta = zeros(size(mfccs_x));
        delta_deltas = delta;
        delta(:,2:size(delta, 2)) = diff(mfccs_x')';
        delta_deltas(:,2:size(delta, 2)) = diff(delta')';
        mfccs_x = cat(1, mfccs_x, delta);
        mfccs_x = cat(1, mfccs_x, delta_deltas);
        for i = 1:size(mfccs_x, 2)
            mfccs_x(:, i) = (mfccs_x(:, i) - mean(mfccs_x(:, i)))/std(mfccs_x(:, i));
        end
        lp = logprob(hmm, mfccs_x);
        [M, I] = max(lp);
        if j == I
            count = count+1;
        end
    end
end
disp(count/50)

