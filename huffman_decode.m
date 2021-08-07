function [msg] = huffman_decode(symb,code,bitstream)

%code is the cell vector for codewords
%symb is the vector of symbols
%bitstream is the input huffman-coded string

% Assuming code to be in cell format
% n is the number of messages
% maxlen is maximum length of code

% We are going to search for matching of bits until we reach
% maximum length of the codeword or match is found.When a match between bit
% or group of bits is found we notedown the corresponding symbol of the
% group of bits.

n=length(symb);
lengths=[];
for i=1:n
    len=length(char(code(i)));
    lengths=[lengths len];
end
maxlen=max(lengths);
msg='';
%bitstream length is denoted by streamlen
streamlen=length(bitstream);
i=1;
while i<=streamlen %we iterate through the bitstream
   j=0;
    while j<maxlen
      c=bitstream(i:i+j);
      ind=1;
        while (ind<=n && ~isequal(char(code(ind)),c))
            ind=ind+1;
        end
        
        if ind<=n
            msg=[msg char(symb(ind))];
            break
        else j=j+1;
        end
    end
    i=i+j+1;
end



