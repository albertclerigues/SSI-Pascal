initSSIPascal;

% train and test classifier for each class
for i=1:VOCopts.nclasses
    cls=VOCopts.classes{i};

    % Compute Vocabulary from TRAIN
    [ vocabulary, imgMetaData ] = SSI_w_computeVocabulary(VOCopts, cls);
    
    % Make dictionary
    [ dictionary, A ] = SSI_dic_makeDictionary( VOCopts, cls, vocabulary );
    
    % Compute TRAIN descriptors
    [ descriptors ] = SSI_fd_computeDescriptors( VOCopts, dictionary, A, imgMetaData);
    
    % Train classifier with TRAIN
    classifier=SSI_cl_train(VOCopts, cls, descriptors); % train classifier
    
    % Test classifier and write results
    SSI_cl_test(VOCopts,cls,classifier, dictionary);          % test classifier
    
    %Read results and otuput
    [fp,tp,auc]=VOCroc(VOCopts,'comp1',cls, true);   % compute and display ROC
    
    if i<VOCopts.nclasses
        fprintf('Press any key to continue with next class...\n'); pause;
    end
end