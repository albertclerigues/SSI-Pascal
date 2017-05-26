function [ descriptors ] = SSI_fd_computeDescriptors( VOCopts, dictionary, A, trainMetaData )

descriptors = [];

% Building HOBW for 1 image (Everything to do!)
if nargin == 3
    I = A;

    % Compute words from image
    [words, frames] = SSI_w_extractWords(VOCopts, I, 0);
    frames = frames(1:2,:);
    
    % Bag words according to dictionary
    A = SSI_dic_bagWords(VOCopts, dictionary, words);
    
    %If windowing, result is one descriptor per each window
    if length(VOCopts.subWindows) == 2
        descriptors = [];
        
        
        
        r_win = size(I, 1) * (0:(1/VOCopts.subWindows(1)):1);
        c_win = size(I, 2) * (0:(1/VOCopts.subWindows(2)):1);
        
        for r = 1:length(r_win)-1
            for c = 1:length(c_win)-1
                x1 = r_win(r);   y1 = c_win(c);
                x2 = r_win(r+1); y2 = c_win(c+1);
                
                win_frames = frames(1,:) > x1 & frames(1,:) < x2 & ...
                             frames(2,:) > y1 & frames(2,:) < y2;
                         
                Ai = A(:, win_frames);
                
                descriptors = [descriptors; ...
                               SSI_fd_computeFeatures(VOCopts, dictionary, Ai)];
            end
        end
    else
        %Get features
        descriptors = SSI_fd_computeFeatures(VOCopts, dictionary, A);
    end
    
    return
end

% Building HOBW for train dataset (Words already computed and bagged!)
if nargin == 4
    % Get bagged words for all images and classes
    cumWordCount = 1;
    for i = 1:length(trainMetaData)
        Ai = A(:, cumWordCount:(cumWordCount+trainMetaData(i).numWords - 1));
        cumWordCount = cumWordCount + trainMetaData(i).numWords;

        % Get HOW for all images and classes
        descriptors_i = SSI_fd_computeFeatures(VOCopts, dictionary, Ai);
        descriptors = [descriptors; descriptors_i];
    end
end

end

