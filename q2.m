clc
clear all
close all

k = 10;
n=15;
p = 0.015;
N = 1000;


for loop=1:5 % five P_E values should be recorded out of which the min(P_E) belongs to the best code generated
    %Generating a random BSC code
    x = zeros(2^k,n);
    for r = 1:2^k
        x(r,:) = randi([0 1],1,n);
    end
    
    % flipped code y
    y = zeros(2^k,n);
    prob = rand(size(x));
    r =1:2^k;
    c = 1:n;
    if prob(r,c) < p
        if x(r,c) == 0
            y(r,c) = 1;
        else if x(r,c) == 1
                y(r,c) = 0;
             end
        end
    end
    %disp(x);
    E = 0;
    %rate = k/n;
    for iteration =1:N
        %disp(x)
        cod_wrd = randi([1 ,2^k]);

        % minimum distance decoding algorithm
        d_h = zeros(2^k,1);
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

        [d_min, index] = min(d_h);
        %disp(d_min);

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





