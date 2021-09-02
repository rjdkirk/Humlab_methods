mirchunklim(inf);
mirverbose(0);
    % This cleans up the output so we only see the track progress and not
    % every single step of the computation.

    % All functions come in the form of mirx, and the input in the brackets 
    % designates what to analyse. This could be the title of an individual 
    % audio file, the contents of any folders in the path window on the 
    % left (Current Folder), or just the contents of the Current Folder. 

% Tempo
% tempo = mirtempo('26 02 Hush.wav');
% tempo = mirtempo('Folders');
tempo = mirtempo('Folder');
    % The main function creates a scalar object i.e. it only has a single 
    % value. To make this more accessible, we can use 'mirgetdata' which 
    % will return a table with all values in one row in the order of the 
    % files in your folder.
    
tempo_data = mirgetdata(tempo);
    % You could also simply use 'tempo' again as the variable name,
    % effectibevy replacing the previous output.
    
    % Set up is the same for (most) other features.

% Brightness
bright = mirbrightness('Folder');
bright_data = mirgetdata(bright);

% Event density
events = mireventdensity('Folder');
events_data = mirgetdata(events);

% RMS - global energy
rms = mirrms('Folder');
rms_data = mirgetdata(rms);

    % We can export the data now using 'mirexport'. The first input defines 
    % the file name, the remaining inputs are the variables as we have 
    % titled them above. This will create a text file, combining all of the
    % variables into a table as columns in the order we designate. 
    
mirexport('HumLab', tempo_data, bright_data, events_data, rms_data)

    % Turn the above into a table, relable variable names.
Music_feats = readtable('HumLab');
Music_feats.Properties.VariableNames{'Var1'} = 'Tempo';
Music_feats.Properties.VariableNames{'Var2'} = 'Brightness';
Music_feats.Properties.VariableNames{'Var3'} = 'Event_density';
Music_feats.Properties.VariableNames{'Var4'} = 'RMS';

    % We can add track titles using the file names. This code below will 
    % create a struct called files by finding all of the files in the
    % folder with a given extension, in this case .wav. 
files = dir('*.wav');
    % The returned object contains info about the file, including it's 
    % name, which we can extract to create a specific track name variable.
Track = {files.name};
    % This returns a row, which we can turn into a column and add to our
    % main table. 
Track = Track';
Music_feats = addvars(Music_feats, Track, 'Before', 'Tempo');

    % We can also add extra columns, e.g., to provide extra information
    % about our tracks. In the code below, we've indicated 'Source' will be
    % the new column, the particular labels are in {} and the numbers in []
    % are how many times they should appear consecutively. 
Music_feats.Source = categorical(repelem({'SpotifySleep';'SpotifyRelax';'CommercialSleep'},[1,1,1]));

    % Can now write this to a new table, designate a file type (e.g., xlsx)
writetable(Music_feats,'Humlab_demo.xlsx');


