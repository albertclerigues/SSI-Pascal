function [ classifier ] = SSI_cl_train( VOCopts, cls, trainDescriptors)

[~,gt]=textread(sprintf(VOCopts.clsimgsetpath,cls,'train'),'%s %d');

Atrain = prdataset(trainDescriptors,gt);

switch VOCopts.cltype
    case {'svc', 'svm'}
        classifier = classc(svc(Atrain));
    case 'nbayesc'
        [U,G] = meancov(Atrain);
        classifier = classc(nbayesc(U, G));
    case 'rdf'
        classifier = classc(randomforestc(Atrain));
    otherwise
        classifier = classc(knnc(Atrain, 1));
end


end

