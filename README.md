# gwasCatalog2Bed2Category
This is the script that will connect to http://www.genome.gov, download GWAS Catalog, convert it to a bed file with "chr position position+1 proxy_gene phenotype", and then take all your input search terms and select those entries in the catalog that match the term, and create separate bed files for each search term.
Script will create and call two 'subscripts' GwasCatalog2Bed.sh and main.sh. Main.sh will be removed while GwasCatalog2Bed.sh will not be removed and you can use it afterwards to download whole GWAS Catalog in bed format.

#Usage
Enter all search terms as arguments passed to a Bash script and if your serach term is a phrase use double quotes. Note that names of phenotypes in GWAS Catalog start with capital letter but then next word is with small letter.
<pre>
chmod 755 gwasCatalog2Bed2Category.sh
~/gwasCatalog2Bed2Category "Coronary artery" "Coronary heart" "Bipolar disorder"
</pre>

#Example

<pre>
chmod 755 gwasCatalog2Bed2Category.sh
~/gwasCatalog2Bed2Category "Coronary artery" "Coronary heart" "Bipolar disorder"

--2016-04-19 23:14:53--  http://www.genome.gov/admin/gwascatalog.txt
Resolving www.genome.gov (www.genome.gov)... 156.40.242.24
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.genome.gov/admin/gwascatalog.txt [following]
--2016-04-19 23:14:54--  https://www.genome.gov/admin/gwascatalog.txt
Connecting to www.genome.gov (www.genome.gov)|156.40.242.24|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 10407265 (9.9M) [text/plain]
Saving to: `gwascatalog.txt.2'

100%[======================================================================================================>] 10,407,265  1.48M/s   in 7.0s    

2016-04-19 23:15:01 (1.42 MB/s) - `gwascatalog.txt.2' saved [10407265/10407265]

Received: Coronary artery
Done: Coronary artery
Received: Coronary heart
Done: Coronary heart
Received: Bipolar disorder
Done: Bipolar disorder
Gwas Catalog number of SNP-phenotype associations:
18899 gwascatalog.txt.cut
Gwas Catalog number of SNP-phenotype associations per category:
Phenotype: Coronary artery
110 Coronary artery.gwascatalog.bed
Phenotype: Coronary heart
143 Coronary heart.gwascatalog.bed
Phenotype: Bipolar disorder
324 Bipolar disorder.gwascatalog.bed
</pre>
