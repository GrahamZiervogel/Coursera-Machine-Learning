function idx = findClosestCentroids(X, centroids)
    %FINDCLOSESTCENTROIDS computes the centroid memberships for every example
    %   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
    %   in idx for a dataset X where each row is a single example. idx = m x 1
    %   vector of centroid assignments (i.e. each entry in range [1..K])
    
    % Set K
    % K = size(centroids, 1);
    
    % You need to return the following variables correctly.
    idx = zeros(size(X,1), 1);
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Go over every example, find its closest centroid, and store
    %               the index inside idx at the appropriate location.
    %               Concretely, idx(i) should contain the index of the centroid
    %               closest to example i. Hence, it should be a value in the
    %               range 1..K
    %
    % Note: You can use a for-loop over the examples to compute this.
    
    for idxLoop = 1:length(idx)
        
        distanceToCentroids = sum((X(idxLoop, :) - centroids) .^ 2, 2);
        
        % »» comment by GZ 2019-03-13 14h27: Had to add this for a bizarre
        % case in the fish image example where 2 centroids were equidistant
        % from a sample point.
        minDistIndex = find(distanceToCentroids == min(distanceToCentroids));
        if numel(minDistIndex) > 1
            minDistIndex = minDistIndex(1);
        end
        
        idx(idxLoop) = minDistIndex;
        
    end
    
    % =============================================================
    
end
