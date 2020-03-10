% As per MATLAB documentation, the parameters normalization and probability
% when paired result in a histogram normalized for probability
% distributions
hist1 = histogram(sum(spiketrain,2), 'normalization', 'probability');
hold on;
hist2 = histogram(sum(spiketrain2,2), 'normalization', 'probability');

% These provide the bin limits. The overlap region will be
% starting from the lower limit of one to the upper limit
% of the other
bin_lims1 = hist1.BinLimits;
bin_lims2 = hist2.BinLimits;
binh1 = hist1.BinEdges;
binh2 = hist2.BinEdges;


start_bin = bin_lims1(1);
end_bin = bin_lims2(2);

% get the data entries of the histogram
hvalues1 = hist1.Values;
hvalues2 = hist2.Values;

error1 = 0;
error2 = 0;

for i=1:(length(binh2) -1)
    if ((binh2(i) >= start_bin) && (binh2(i) <= end_bin))
        if (hvalues1(i) < hvalues2(i))
            error1 = error1 + hvalues1(i);
        else 
            error2 = error2 + hvalues2(i);
        end
    end
end

errors = [error1 error2];
error_total = mean(errors);
disp(error_total);
    