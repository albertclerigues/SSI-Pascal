function [ dict, A ] = SSI_dic_makeDictionary(VOCopts, cls, vocabulary)

switch VOCopts.dicttype
    case 'hikmeans'
        [ dict, A ] = SSI_dic_hikmeans( VOCopts, cls, vocabulary );
    case 'ikmeans'
        [ dict, A ] = SSI_dic_ikmeans( VOCopts, cls, vocabulary );
    otherwise
        error('Bad dictionary type, cannot make dictionary');
end


end

