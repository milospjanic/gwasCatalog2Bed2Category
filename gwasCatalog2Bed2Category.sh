#!/bin/bash
#download gwas catalog and create bed file with "chr position position+1 proxy_gene phenotype"
echo "
#download gwas catalog 
wget http://www.genome.gov/admin/gwascatalog.txt
awk -F\"\t\" '{if (\$12!=\"\") print \$12\"\t\"\$13\"\t\"\$15\"\t\"\$8}' gwascatalog.txt > tmp
awk -F\"\t\" '{print \$1\"\t\"\$2\"\t\"\$2+1\"\t\"\$3\"\t\"\$4}' tmp > GwasCatalog.bed
rm tmp" > GwasCatalog2Bed.sh
chmod 775 GwasCatalog2Bed.sh
./GwasCatalog2Bed.sh

#writing main to perform grep on gwascatalog.txt.cut
echo "
#grep categories
for var in \"\$@\"
do
  echo Received: \$var
grep \"\$var\" GwasCatalog.bed > \"\$var\".gwascatalog.bed 
echo Done: \$var
done

#print stats
echo "Gwas Catalog number of SNP-phenotype associations:"
wc -l GwasCatalog.bed
echo "Gwas Catalog number of SNP-phenotype associations per category:"

for var in \"\$@\"
do
  echo Phenotype: \$var
wc -l \"\$var\".gwascatalog.bed 
done

for var in \"\$@\"
do
cut -f1-3 \"\$var\".gwascatalog.bed > \"\$var\".gwascatalog.bed.cut
sort -k1,1V -k2,2n \"\$var\".gwascatalog.bed.cut > \"\$var\".gwascatalog.bed.cut.sort
uniq \"\$var\".gwascatalog.bed.cut.sort > \"\$var\".gwascatalog.bed.cut.sort.uniq 
rm \"\$var\".gwascatalog.bed.cut
rm \"\$var\".gwascatalog.bed.cut.sort
done

echo "Gwas Catalog number of SNP-phenotype associations per category AFTER REMOVING DUPLICATES:"

for var in \"\$@\"
do
  echo Phenotype: \$var
wc -l \"\$var\".gwascatalog.bed.cut.sort.uniq  
done

" > main.sh

#calling main
chmod 775 main.sh
./main.sh "$@"

#removing files
rm gwascatalog.txt
rm main.sh

