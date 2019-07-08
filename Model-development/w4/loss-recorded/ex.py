with open('oil_loss.txt', 'r') as i, open('oil.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace('\t', ' ')
        o.write(line)

with open('water_loss.txt', 'r') as i, open('water.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace('\t', ' ')
        o.write(line)

with open('whfp_loss.txt', 'r') as i, open('whfp.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace('\t', ' ')
        o.write(line)

with open('whft_loss.txt', 'r') as i, open('whft.dat', 'w') as o:
    all_line = i.readlines()
    for line in all_line:
        line = line.replace('\t', ' ')
        o.write(line)

print('Done')

