# gwasCatalog2Bed2Category
This is the script that will connect to http://www.genome.gov, download GWAS Catalog, convert it to a bed file with "chr position position+1 proxy_gene phenotype", and then take all your input search terms and select those entries in the catalog that match the term, and create separate bed files for each search term

#Usage
Enter all search terms as arguments passed to a Bash script and if your serach term is a phrase use double quotes. Note that names of phenotypes in GWAS Catalog start with capital letter but then next word is with small letter.
<pre>
chmod 755 gwasCatalog2Bed2Category.sh
~/gwasCatalog2Bed2Category "Coronary artery" "Coronary heart" "Bipolar disorder"
</pre>
