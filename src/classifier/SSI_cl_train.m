function [ classifier ] = SSI_cl_train( VOCopts, cls, trainFeatures, cltype )

if nargin < 4
    cltype = 'svc';
end

[~,gt]=textread(sprintf(VOCopts.clsimgsetpath,cls,'train'),'%s %d');

Atrain = prdataset(trainFeatures,gt);

switch cltype
    case {'svc', 'svm'}
        classifier = classc(svc(Atrain));
    otherwise
        classifier = classc(knnc(Atrain, 1));
end


end

