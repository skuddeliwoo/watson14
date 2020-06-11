function depict(con)
%--------------------------------------------------------------------------
% depict:
% B und Hebb
%--------------------------------------------------------------------------
% calcHebb to calculate the Hebb matrix for the last generation
con.calcHebb();
% get grn matrices ordered by distance to the Hebb matrix
grn = con.sortByDistance();
if con.nPop >= 3

    subplot(2,3,1);
    % using hebb magnitudes to scale all grn heatmaps
    scale = abs(con.hebb(1));
    h = heatmap(con.hebb);
    h.Title = 'Hebb matrix';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,2)
    h = heatmap(mean(grn,3));
    h.Title = 'average grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,3)
    h = heatmap(grn(:,:,1));
    h.Title = 'closest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,4)
    h = heatmap(grn(:,:,end));
    h.Title = 'furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,5)
    h = heatmap(grn(:,:,end-1));
    h.Title = '2nd furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,3,6)
    h = heatmap(grn(:,:,end-2));
    h.Title = '3nd furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);
end

end

