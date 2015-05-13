% Lukas' little helper program.

% For d,p family, find an isomorphism spy chart. 

% d = 4;
% p = 5;
% 
% matrices = get_graphs(d,p);
% 
% n_poly = length(matrices);
% isomorphic = zeros(n_poly);
% 
% for ii = 1:n_poly
%     
%     progress_bar(ii,1,n_poly);
%     
%     for jj = ii:n_poly
%         %fprintf('trying %d and %d\n',ii,jj);
%         
%         % if you want to test for exactness, add third argument "1"
%         if(graphs_isomorphic(matrices{ii},matrices{jj},1))
%             isomorphic(ii,jj) = 1;
%         end
%     end
% end
% 
% isomorphic = isomorphic + triu(isomorphic,1)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Let's compute the avg component numbers for cubics. 
% d = 1;
% 
% primey = primes(300);
% n_comps = zeros(size(primey));
% 
% for ip = 1:length(primey)
%     
%     progress_bar(ip,1,length(primey));
%     
%     n_comps(ip) = avg_n_components(d,primey(ip));
%     
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Let's get a list of the number of components for statistical randomness
% comparisons. 
 
% d = 4;
% p = 5;
% 
% matrices = get_graphs(d,p);
% n_poly = length(matrices);
% n_components = zeros(n_poly,1);
% 
% for ii = 1:n_poly
%      n_components(ii) = n_comps(matrices{ii});
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% p = 7;
% d = 2;
% 
% matrices = get_graphs(d,p);
% 
% bins = zeros(length(matrices),p);
% 
% for ii = 1:length(matrices);
%     
%     
%     loop_lengths_i = loop_lengths(matrices{ii},n_comps(matrices{ii}));
%     
%     for jj = 1:length(loop_lengths_i)
%        
%         bins(ii,loop_lengths_i(jj)) = bins(ii,loop_lengths_i(jj)) + 1;
%         
%     end
% 
% end
% 
% surf(bins);
% xlabel('Loop Length');
% ylabel('Polynomial');
% zlabel('Frequency');

p = 5;
d = 4;

matrices = get_graphs(d,p);
avg_loop_lengths = zeros(length(matrices),1);

for ii = 1:length(matrices)
   
    avg_loop_lengths(ii) = mean(loop_lengths(matrices{ii},n_comps(matrices{ii})));
    
end

