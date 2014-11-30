function [] = main(methodNumber)
%     close all;
    N = [5, 10, 20, 50, 100, 200, 500, 1000];
    erori = [];
    h = [];
    for i = 1:size(N,2)
        k = 1;
        erori(i) = tema(N(i), methodNumber);
        h(i) = 1 / (N(i) + 1);
    end
    datePrint = [erori', (erori ./ h)', (erori ./ (h .^ 2))', (erori ./ (h .^ 3))', (erori ./ (h .^ 4))', (erori ./ (h .^ 5))'];
    Columns = {'e','e/h','e/h2','e/h3','e/h4','e/h5'};
    Rows = N;
    f = figure('Name',strcat('Tabel erori pentru metoda', methodNumber));
    uitable(f,'Data', datePrint, 'Position',[100 100 600 250], 'ColumnWidth',{90}, 'ColumnName', Columns, 'RowName', Rows);  
end

