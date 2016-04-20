#!/bin/bash
#download gwas catalog and create bed file with "chr position position+1 proxy_gene phenotype"
echo "
#download gwas catalog 
wget http://www.genome.gov/admin/gwascatalog.txt
awk -F\"\t\" '{if (\$12!=\"\") print \$12\"\t\"\$13\"\t\"\$15\"\t\"\$8}' gwascatalog.txt > tmp
awk -F\"\t\" '{print \$1\"\t\"\$2\"\t\"\$2+1\"\t\"\$3\"\t\"\$4}' tmp > gwascatalog.txt.cut
rm tmp" > GwasCatalog2Bed.sh
chmod 775 GwasCatalog2Bed.sh
./GwasCatalog2Bed.sh

#writing main to perform grep on gwascatalog.txt.cut
echo "
for var in \"\$@\"
do
  echo Received: \$var
grep \"\$var\" gwascatalog.txt.cut > \"\$var\".gwascatalog.bed 
echo Done: \$var
done
" > main.sh

#calling main
chmod 775 main.sh
./main.sh "$@"
