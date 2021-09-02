mirchunklim(inf);
mirverbose(0);

    % Carrying out a frame decomposition to conduct more in-depth analysis
    % of individual tracks.
    
    % RMS - the root-mean-square energy of the amplitude of the signal. We
    % can use mirrms to find the global energy of a signal, or add 'Frame'
    % to see how it changes over time.
rms_framed = mirrms('26 02 Hush.wav','Frame');
rms_framed_data = mirgetdata(rms_framed);

    % We can plot this.
plot(rms_framed_data)

    % Some functions can return several outputs, for example 'key' can 
    % return key, key clarity, and key strength.
        
% Key clarity
[k, c, s] = mirkey('26 02 Hush.wav');

key = mirgetdata(k);
keyclar = mirgetdata(c);
keystrength = mirgetdata(s);

    % Could carry out a 'Frame' decomposition as well.
[k, c, s] = mirkey('26 02 Hush.wav','Frame');
    % Mean key clarity across the signal.
mkeyclar = mirmean(c);
mkeyclar_data = mirgetdata(mkeyclar);


