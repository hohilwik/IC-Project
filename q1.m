message1 = read_file('file1.txt');
[symb1, prob1] = analyze_file(message1);
freq1 = prob1*length(message1);
[codeword1] = huffman_encode(prob1);
coded_data1 = encodemessage(message1, symb1, codeword1);
fileID = fopen('encoded_file1.txt','w');
fprintf(fileID, '%c', coded_data1);
fclose(fileID);

message2 = read_file('file2.txt');
[symb2, prob2] = analyze_file(message2);
freq2 = prob2*length(message2);
[codeword2] = huffman_encode(prob2);
coded_data2 = encodemessage(message2, symb2, codeword2);
fileID = fopen('encoded_file2.txt','w');
fprintf(fileID, '%c', coded_data2);
fclose(fileID);

message3 = read_file('file3.txt');
[symb3, prob3] = analyze_file(message3);
freq3 = prob3*length(message3);
[codeword3] = huffman_encode(prob3);
coded_data3 = encodemessage(message3, symb3, codeword3);
fileID = fopen('encoded_file3.txt','w');
fprintf(fileID, '%c', coded_data3);
fclose(fileID);
