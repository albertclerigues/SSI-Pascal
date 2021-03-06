function [ features ] = SSI_fd_computeFeatures(VOCopts, dictionary, A )

switch VOCopts.dicttype
    case 'hikmeans'
        hobw = vl_hikmeanshist(dictionary, A)';
        features = hobw./max(hobw);
    case 'ikmeans'
        hobw = vl_ikmeanshist(VOCopts.ikmeans.K, A)';
        features = hobw./max(hobw);
    otherwise
        error('Incorrect configuration, cannot compute features');
end


end

