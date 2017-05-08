%Add all folders from directory where main is located
addpath(genpath('.'));

%Initialize options
VOCinit;

% change this path if you install the VOC code elsewhere
addpath(genpath('.'));
addpath([cd '/VOCcode']);

% initialize VOC options
VOCinit;

% train and test classifier for each class
for i=1:VOCopts.nclasses
    cls=VOCopts.classes{i};

    [ vocabulary, imgMetaData ] = SSI_w_computeVocabulary(VOCopts, cls);
    [ dictionary, A ] = SSI_dic_makeDictionary( VOCopts, cls, vocabulary );
    [ features ] = SSI_fd_hobw( VOCopts, dictionary, A, imgMetaData);
    
    classifier=SSI_cl_train(VOCopts, cls, features); % train classifier
    
    SSI_cl_test(VOCopts,cls,classifier, dictionary);          % test classifier
    
    [fp,tp,auc]=VOCroc(VOCopts,'comp1',cls, true);   % compute and display ROC
    
    if i<VOCopts.nclasses
        fprintf('press any key to continue with next class...\n');
        pause;
        %return;
    end
end