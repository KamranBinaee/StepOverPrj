function DataStructure =  GenerateDataStructure(MatFileName)
    
    %MatFileName = 'Exp_RawMat_exp_data-2014-11-26-16-38.mat';
    load(MatFileName)

    %% Trial Index is extracted here
    % The Format is like [TrialType TrialStartIndex TrialEndIndex]
    % For Example:
    % TrialIndex = [
    %            1         370         587
    %            2           1         185
    %            3         186         369
    %            5         810        1013
    %            6         588         809
    %            6        1014        1207 ]

    
    TrialIndex = ExtractTrialIndex(TrialType);
%%
   
    [m, n, p] = size(RightFoot_XYZ);
    TrialNumber = 1
    a = TrialIndex(TrialNumber,2);
    b = TrialIndex(TrialNumber,3);

    ShutterGlass = zeros(m,4,3);
    for k = 0:4
        for j = 1:3
            ShutterGlass(:, k+1, j) = double(ShutterGlass_XYZ(:,3*k+j));
        end
    end
    size(ShutterGlass);

    RightMarker = zeros(m,4,3);
    for k = 0:3
        for j = 1:3
            RightMarker(:, k+1, j) = double(RightFoot_XYZ(:,3*k+j));
        end
    end
    size(RightMarker);

    LeftMarker = zeros(m,4,3);
    for k = 0:3
        for j = 1:3
            LeftMarker(:, k+1, j) = double(LeftFoot_XYZ(:,3*k+j));
        end
    end
    size(LeftMarker);

    SpinalMarker = zeros(m,4,3);
    for k = 0:3
        for j = 1:3
            SpinalMarker(:, k+1, j) = double(Spinal_XYZ(:,3*k+j));
        end
    end
    size(SpinalMarker);

    X = ShutterGlass(a:b,3,1);
    Y = ShutterGlass(a:b,3,2);
    Z = ShutterGlass(a:b,3,3);
    createfigure(X,Z,Y,'Shutter Glass Marker Position', Obstacle_XYZ(1,:));

    X = LeftMarker(a:b,3,1);
    Y = LeftMarker(a:b,3,2);
    Z = LeftMarker(a:b,3,3);
    createfigure(X,Z,Y, 'Left Foot Marker Position', Obstacle_XYZ(1,:));

    
    X = RightMarker(a:b,3,1);
    Y = RightMarker(a:b,3,2);
    Z = RightMarker(a:b,3,3);
    createfigure(X,Z,Y, 'Right Foot Marker Position', Obstacle_XYZ(1,:));

    X = SpinalMarker(a:b,3,1);
    Y = SpinalMarker(a:b,3,2);
    Z = SpinalMarker(a:b,3,3);
    createfigure(X,Z,Y, 'Spinal Marker Position', Obstacle_XYZ(1,:));

        
    field1 = 'FrameTime';  value1 = FrameTime;
    field2 = 'ShutterGlass_FrIdx_mIdx_XYZ';  value2 = ShutterGlass;
    field3 = 'RightFoot_FrIdx_mIdx_XYZ';  value3 = RightMarker;
    field4 = 'LeftFoot_FrIdx_mIdx_XYZ';  value4 = LeftMarker;
    field5 = 'Spinal_FrIdx_mIdx_XYZ';  value5 = SpinalMarker;
    field6 = 'Obstacle_FrIdx_XYZ';  value6 = Obstacle_XYZ;
    field7 = 'TrialType_FrIdx';  value7 = TrialIndex;
    

    DataStructure = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6,field7,value7);
end
