% trivial classifier: compute ratio of L2 distance betweeen
% nearest positive (class) feature vector and nearest negative (non-class)
% feature vector
function c = classify(VOCopts, classifier, testFeatures)

testFeatures = prdataset(testFeatures);

% Classify
c = testFeatures*classifier;

% Get class probabilities
c = getdata(c);

% Select positive classification probability
c = c(:, 2);
