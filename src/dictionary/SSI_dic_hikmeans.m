function [ tree, A ] = SSI_dic_hikmeans( VOCopts, cls, vocabulary )

% Cluster vocabulary into BOWs
try
    % try to load dictionary and words
    load(sprintf(VOCopts.hikmeanspath, cls), 'tree', 'A');
catch
    opts = VOCopts.hikmeans;
    [tree, A] = vl_hikmeans(vocabulary, opts.K, opts.nleaves);
    save(sprintf(VOCopts.hikmeanspath, cls), 'tree', 'A');
end

disp('Dictionary built.');

end

