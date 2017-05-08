function [ hobw ] = SSI_fd_hobw( VOCopts, dictionary, A, trainMetaData)

hobw = [];

% Building HOBW for 1 image (Everything to do!)
if nargin == 3
    I = A; 
    
    I = single(rgb2gray(I));

    % Compute words from image
    words = SSI_w_extractWords(VOCopts, I);

    % Bag words according to dictionary
    A = vl_hikmeanspush(dictionary, words);

    %Get HOBW
    hobw = vl_hikmeanshist(dictionary, A);
    hobw = hobw./max(hobw);     
    hobw = hobw(:)';
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
        hobw_i = vl_hikmeanshist(dictionary, Ai)';
        hobw = [hobw; hobw_i./max(hobw_i)];
    end
    
    disp('Histograms of Bagged Words built!');
end

end

