function decoded_data = huffman_decode2(symb, codeword, message)
  n = length(codeword);
  decoded_data = message;
  for i=1:n
      decoded_data = replace(decoded_data, codeword(i), char(symb(i)) );
  end
end