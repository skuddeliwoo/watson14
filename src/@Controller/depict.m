function depict(con)
%--------------------------------------------------------------------------
% depict: plots the Hebb matrix and GRN matrices of some chosen
% individuals as heatmaps 
%--------------------------------------------------------------------------

% calcHebb to calculate the Hebb matrix for the last generation
con.calcHebb();
% get grn matrices ordered by distance to the Hebb matrix
grn = con.sortByDistance();

% minimum of three individuals required for plotting
if con.nPop >= 3
    % RGB matrix as colormap for heatmap (blue -> white -> red)    
    map = [ 0   , 0   , 1   ; ...
            0.2 , 0.2 , 1   ; ...
            0.4 , 0.4 , 1   ; ...
            0.6 , 0.6 , 1   ; ...
            0.8 , 0.8 , 1   ; ...
            1   , 1   , 1   ; ...
            1   , 0.8 , 0.8 ; ...
            1   , 0.6 , 0.6 ; ...
            1   , 0.4 , 0.4 ; ...
            1   , 0.2 , 0.2 ; ...
            1   , 0   , 0   ];
        
    subplot(2,2,1);
    % using hebb magnitudes to scale all grn heatmaps
    scale = abs(con.hebb(1));
    h = heatmap(con.hebb, 'Colormap', map);
    h.Title = 'Hebb matrix';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,2,2)
    h = heatmap(mean(grn,3), 'Colormap', map);
    h.Title = 'average grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,2,3)
    h = heatmap(grn(:,:,1), 'Colormap', map);
    h.Title = 'closest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

    subplot(2,2,4)
    h = heatmap(grn(:,:,end), 'Colormap', map);
    h.Title = 'furthest grn';
    h.XLabel = 'gene i';
    h.YLabel = 'gene j';
    caxis(h, [-scale scale]);

end
end

