function [ words ] = SSI_w_extractWords( VOCopts, I, anno )

switch VOCopts.wtype
    case {'DSIFT', 'dsift'}
        %Compute for DSIFT
        words = SSI_w_DSIFT(VOCopts, I, anno);
    otherwise
        error('Incorrect word type, cannot extract words');
end

end

