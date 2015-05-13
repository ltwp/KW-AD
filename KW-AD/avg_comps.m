function get_avg_comps = avg_comps(upbd,deg) 
%get a table of a col of primes and col of overage components for all
%polynomials of a certain degree
%run avg_comps(upbd, deg), where upbd is the upperbound on range of primes
%to check, i.e. =100 -> check p up to 100, and deg for deg of polynomials

p = primes(upbd);
    for ii=1:length(p) %for every prime though the upperbound (upbd)
        p(ii);
        m(ii) = avg_n_components(deg,p(ii));
        progress_bar(ii, 1, length(p))
    end 
Dat = vertcat(p,m);
Dat = Dat'
csvwrite('AvgCpnts', Dat)
end


% M = csvread('AvgCpnts')
% plot(M(:,1), M(:,2),'o')   (points as o's, use '-o' to connect)
%