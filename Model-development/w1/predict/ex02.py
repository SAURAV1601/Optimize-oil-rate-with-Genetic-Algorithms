
import os


list_file = os.listdir('D:\\Thesis\\Data\\well-cali\\w1\\predict')

for file_name in list_file:
    with open(file_name, 'r') as i, open('w1_'+file_name, 'w') as o:
        all_line = i.readlines()
        for line in all_line:
            line = line.replace(',', ' ')
            o.write(line)

print('done!')


