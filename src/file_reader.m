x = 100*rand(8,1);

file_id = fopen('test.txt', 'w');
fprintf(file_id, '%4.4f\n', x);
fclose(file_id);