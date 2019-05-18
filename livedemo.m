recObj = audiorecorder(22050, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 1);
disp('End of Recording.');
play(recObj);
myRecording = getaudiodata(recObj);
fs = 22050;
mfccs_x = GetSpeechFeatures(myRecording, fs, 0.03, 13);
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
a = {'down', 'forward', 'go', 'hovering', 'left', 'off', 'right', 'roll', 'take', 'up'};
disp(a(I))