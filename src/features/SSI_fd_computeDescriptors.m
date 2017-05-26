function [ descriptors ] = SSI_fd_computeDescriptors( VOCopts, dictionary, A, trainMetaData )

descriptors = [];

% Building HOBW for 1 image (Everything to do!)
if nargin == 3
    I = A;

    % Compute words from image
    words = SSI_w_extractWords(VOCopts, I, 0);
    
    % Bag words according to dictionary
    A = SSI_dic_bagWords(VOCopts, dictionary, words);
    
    %Get features
    descriptors = SSI_fd_computeFeatures(VOCopts, dictionary, A);
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

