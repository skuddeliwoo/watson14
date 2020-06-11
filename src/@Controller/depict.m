function depict(con)
%--------------------------------------------------------------------------
% depict:
% B und Hebb
%--------------------------------------------------------------------------
% calcHebb to calculate the Hebb matrix for the last generation
con.calcHebb();
% get grn matrices ordered by distance to the Hebb matrix
grn = con.sortByDistance();
if con.nPop >= 5
    % get worst five grns to display
    worstGrns = grn(:, :, end-4:end);

    subplot(2,3,1);
    % using hebb magnitudes to scale all grn heatmaps
    scale = abs(con.hebb(1));
    h = heatmap(con.hebb);
    h.Title = 'Hebb matrix';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,2)
    h = heatmap(worstGrns(:,:,1));
    h.Title = 'furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,3)
    h = heatmap(worstGrns(:,:,2));
    h.Title = '2nd furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,4)
    h = heatmap(worstGrns(:,:,3));
    h.Title = '3rd furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,5)
    h = heatmap(worstGrns(:,:,4));
    h.Title = '4th furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,6)
    h = heatmap(worstGrns(:,:,end));
    h.Title = 'closest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);
end

end

