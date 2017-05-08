function [ words ] = SSI_w_extractWords( VOCopts, I )

switch VOCopts.wtype
    case {'DSIFT', 'dsift'}
        %Compute for DSIFT
        words = SSI_w_DSIFT(VOCopts, I);
    otherwise
        words = SSI_w_DSIFT(VOCopts, I);
end

end

