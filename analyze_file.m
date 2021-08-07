
function [symbols, probability] = analyze_file(message);
symbols=[];
probability=[];
n=length(message);
i=1;
while ~isempty(message)
    [mode_char,no_occurrances]=mode(message); %find the most occuring character and its number of occurences
    symbols(i)=mode_char;                     %store that character in symbols vector
    probability(i)=no_occurrances;            %store its #occurence in probability vector
    indices=find(message==mode_char);         %remove all instances of the character from message
    message(indices)='';
    i=i+1;
end
probability=probability/n;
end

