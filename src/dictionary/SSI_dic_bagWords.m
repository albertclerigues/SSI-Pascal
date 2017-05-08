function A = SSI_dic_bagWords(VOCopts, dictionary, words)

switch VOCopts.dicttype
    case 'hikmeans'
        A = vl_hikmeanspush(dictionary, words);
    otherwise
        error('Incorrect dictionary, cannot bag words');
end

end

