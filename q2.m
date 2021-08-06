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

    prob = rand(size(x));
    for r =1:2^k
        for c = 1:n
            if prob(r,c) < p
                if x(r,c) == 0
                    x(r,c) = 1;
                else if x(r,c) == 1
                        x(r,c) = 0;
                    end
                end
            end
        end
    end
        
    E = 0;
    %rate = k/n;
    iteration =1;
    while iteration <= N
        %disp(x)
        cod_wrd = randi([1 ,2^k]);

        % minimum distance decoding algorithm
        d_h = zeros(2^k,1);
        for i = 1:2^k
            count = 0;
            for j=1:n
                if y == x(cod_wrd,j)
                    count = count + 1;
                end
            end
            d_h(i,1) = count;
        end
        disp(d_h)

        [d_min, index] = min(d_h);

        x_estimate = x(index,:);

        % indicator function
        %{
        I = 0;
        if x_estimate ~= x(cod_wrd,j)
            I = 1;
        end
        %}
        I = piecewise((x_estimate ~= x(cod_wrd,j)),1,(x_estimate == x(cod_wrd,j)),0);

        E = E + I;
        iteration = iteration + 1;
    end

% Probability of error
P_E = E/N;
disp(P_E)
end
%disp(P_E);




