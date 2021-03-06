function [codeword] = huffman_encode(p)
% p is the vector of probabilities
%This block initiates necessary matrices and cells and stuff
n=length(p);
codeword=cell(1,n);   %where the codewords are going to be stored
X=zeros(n,n);         %This matrix helps us track which elements we have worked on
temp=p;
%%
%Building the relationship matrix X. This matrix has all elements zero
%except for a few entries which are substituted with 10 or 11. Number 10 denotes this
%entry is the minimum in the column and 11 indicates this is the second
%minimum.the minimum is replaced by 100 and second minimum is replaced by
%sum of the minimum and the second minimum.And processing for the next
%column progresses
for i=1:n-1
    [~ ,l]=sort(temp);
    X(l(1),i)=10;
    X(l(2),i)=11;
    temp(l(2))=temp(l(2))+temp(l(1));
    temp(l(1))=100;
end
%%
%Filling in codewords.The key is the relationship between the 11 marked
%entry in each column. This ties the column with the next one.
i=n-1;
rows=find(X(:,i)==10);
codeword(rows)=strcat(codeword(rows),'1');
rows=find(X(:,i)==11);
codeword(rows)=strcat(codeword(rows),'0');
for i=n-2:-1:1
    row11=find(X(:,i)==11);
    row10=find(X(:,i)==10);
    codeword(row10)=strcat(codeword(row11),'1');
    codeword(row11)=strcat(codeword(row11),'0');
end
end
    