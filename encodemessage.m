function coded_data = encodemessage(message, symb, codeword)
    n=length(symb);
    codeword = char(codeword);
    for i=1:n
        message=replace(message, char(symb(i)), codeword(i) );
    end
    coded_data = message;
end