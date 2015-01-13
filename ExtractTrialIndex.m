function TrialIndex = ExtractTrialIndex(TrialType)
    
    TrialList = str2num(TrialType(:,2));
    %TrialList = TrialType;
    cnt = 1;
    for i=1:6
        Index = find( TrialList == i);
        if numel(Index) == 0
            continue;
        end
        diffIndex = diff(Index);
        q = find(diffIndex~=1);

        if(isempty(q))
            TrialIndex(cnt,:) = [i Index(1) Index(end)];
        else
            TrialIndex(cnt,:) = [i Index(1) Index(q(1))];
            cnt = cnt + 1;
            v = size(q);
            for j = 1:v(2)-1
                TrialIndex(cnt,:) = [i Index(q(j)) Index(q(j+1))];
                cnt = cnt + 1;
            end
            TrialIndex(cnt,:) = [i Index(q(end)+1) Index(end)];
        end
        cnt = cnt + 1;
    end
end   