function [ dict, A ] = SSI_dic_makeDictionary(VOCopts, cls, vocabulary)

switch VOCopts.dicttype
    case 'hikmeans'
        [ dict, A ] = SSI_dic_hikmeans( VOCopts, cls, vocabulary );
    otherwise
        [ dict, A ] = SSI_dic_hikmeans( VOCopts, cls, vocabulary );
end


end

