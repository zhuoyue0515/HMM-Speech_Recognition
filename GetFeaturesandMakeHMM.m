clear
% down
time = 25;
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/down/' 'down' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(6,pD1,obsdata,ldata);
hmm(1) = h;
clearvars -except hmm time

% forward
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/forward/' 'forward' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(7,pD1,obsdata,ldata);
hmm(2) = h;
clearvars -except hmm time

% go
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/go/' 'go' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(4,pD1,obsdata,ldata);
hmm(3) = h;
clearvars -except hmm time

% hovering
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/hovering/' 'hovering' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(7,pD1,obsdata,ldata);
hmm(4) = h;
clearvars -except hmm time

% left
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/left/' 'left' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(5,pD1,obsdata,ldata);
hmm(5) = h;
clearvars -except hmm time

% off
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/off/' 'off' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(4,pD1,obsdata,ldata);
hmm(6) = h;
clearvars -except hmm time

% right
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/right/' 'right' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(6,pD1,obsdata,ldata);
hmm(7) = h;
clearvars -except hmm time

% roll
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/roll/' 'roll' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(6,pD1,obsdata,ldata);
hmm(8) = h;
clearvars -except hmm time

% take
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/take/' 'take' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(5,pD1,obsdata,ldata);
hmm(9) = h;
clearvars -except hmm time

% up
ldata = zeros(1, time);
pD = [];
obsdata = [];
for p = 1:time
    filename = ['dataset/up/' 'up' num2str(p) '.wav'];
    [y,fs] = audioread(filename);
    mfccs = GetSpeechFeatures(y, fs, 0.03, 13);
    delta = zeros(size(mfccs));
    delta_deltas = delta;
    delta(:,2:size(delta, 2)) = diff(mfccs')';
    delta_deltas(:,2:size(delta, 2)) = diff(delta')';
    mfccs = cat(1, mfccs, delta);
    mfccs = cat(1, mfccs, delta_deltas);
    for i = 1:size(mfccs, 2)
       mfccs(:, i) = (mfccs(:, i) - mean(mfccs(:, i)))/std(mfccs(:, i));
    end
%         pD = MakeGMM(5,mfccs);
    ldata(p) = size(mfccs,2);
    obsdata = cat(2, obsdata, mfccs);
    pDp = [];
    for j = 1:size(mfccs, 1)
        m = mean(mfccs(j,:));
        sigma = std(mfccs(j,:));
        b = GaussD('Mean', m, 'StDev', sigma);
        pDp = [pDp b];
    end
    pD = cat(2, pD, pDp');
end
pD1 = [];
for q = 1:size(obsdata, 1)
    m1 = mean(obsdata(q,:));
    sigma1 = std(obsdata(q,:));
    b1 = GaussD('Mean', m1, 'StDev', sigma1);
    pD1 = [pD1 b];
end
h = MakeLeftRightHMM(4,pD1,obsdata,ldata);
hmm(10) = h;






