clc
clear all
close all

k = 10;
n=15;
p = 0.015;
N = 1000;


% five P_E values should be recorded out of which the min(P_E) belongs to the best code generated
for loop=1:5

    %Generating a random BSC code
    x = zeros(2^k,n);
    for r = 1:2^k
        x(r,:) = randi([0 1],1,n);
    end
    
    % flipping code x to get code y
    y = zeros(2^k,n);
    
    %assigning random probabilities to every bit of the codewords
    prob = rand(size(x));
    
    %flipping
    r =1:2^k;
    c = 1:n;
    if prob(r,c) < p
         y(r,c) = abs( x(r,c)-1 );
    end
    %disp(x);
    E = 0;
    %rate = k/n;
    
    % conducting N iterations
    for iteration =1:N
        %disp(x)
        
        %selecting a random codeword by picking a random row index 
        code_word = randi([1 ,2^k]);

        % minimum distance decoding algorithm
        d_h = zeros(2^k,1);
        
        %calculating the hamming distances of all the original codewords and the flipped codeword
        for i = 1:2^k
          count = 0;
            for j=1:n
                if y(i,j) == x(cod_wrd,j)
                    count = count + 1;
                end
            end
          d_h(i,1) = count;
        end
        %disp(d_h)
        
        %finding the minimum hamming distance
        [d_min, index] = min(d_h);
        %disp(d_min);
        % Using the index to obtain the codeword closest to the flipped codeword-eatimate of x
        x_estimate = x(index,:);
        disp(x_estimate);
        
        % indicator function
        I = 0;
        if x_estimate ~= x(cod_wrd,j)
            I = 1;
        else
            I = 0;
        end        
        %I = piecewise((x_estimate ~= x(cod_wrd,j)),1,(x_estimate == x(cod_wrd,j)),0);
        disp(I);
        E = E + I;
    end

% Probability of error
P_E = E/N;
end
%disp(P_E)

%Plot P_E against (n,p,k)
%Comment on observing the Channel capacity for all values of n,p,k





