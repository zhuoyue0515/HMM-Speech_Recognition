for i = 21:25
recObj = audiorecorder(22050, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 1);
disp('End of Recording.');
play(recObj);
myRecording = getaudiodata(recObj);
filename = ['hovering' num2str(i) '.wav'];
audiowrite(filename, myRecording, 22050);
pause(5);
end