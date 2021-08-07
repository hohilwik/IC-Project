function coded_data = encodemessage(message, symb, codeword)
    length(symb)=n
    for i=1:n
        indices = find(message==symb(i));
        message(indices) = codeword(i);
    end
    coded_data = message;
end