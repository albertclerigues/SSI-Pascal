function [  ] = SSI_cl_test( VOCopts, cls, classifier, dictionary)
%SSI_CL_TEST Summary of this function goes here
%   Detailed explanation goes here

% classify each image
tic;
% load test set ('val' for development kit)
[ids,gt]=textread(sprintf(VOCopts.clsimgsetpath,cls,VOCopts.testset),'%s %d');

try
    % try to load features
    load(sprintf(VOCopts.wordstestpath, cls),'testDescriptors');
catch
    testDescriptors = [];
    
    for i = 1:length(ids)
        % display progress
        if toc>2
            fprintf('%s: test: %d/%d\n',cls,i,length(ids));
            drawnow; tic;
        end
        
        % compute and save features
        I = imread(sprintf(VOCopts.imgpath,ids{i}));
        testDescriptors = [testDescriptors; SSI_fd_computeDescriptors(VOCopts, dictionary, I)];
    end
    
    save(sprintf(VOCopts.wordstestpath, cls),'testDescriptors');
end

% create results file
fid=fopen(sprintf(VOCopts.clsrespath,'comp1',cls),'w');

% Classify whole train set
% compute confidence of positive classification
c = classify(VOCopts, classifier, testDescriptors);
        
% write to results file
for i = 1 : length(c)
    fprintf(fid,'%s %f\n', ids{i}, c(i));
end

% close results file
fclose(fid);

end

