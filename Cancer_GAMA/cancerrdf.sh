sort -k 8,8 $1 |sed 's/>/%3E/g' > temp 
#mv temp $1
awk -F$'\t' 'BEGIN{ PID=99; PUBMED=""} {
if($8!=PUBMED)
{ PID++; PUBMED=$8}
association=$1
gsub(" ","_",$2); Phenotype=$2
gsub(" ","_",$4);author=$4 
gsub(" ","_",$5);jurnal=$5 
jurnalyear=$6
Genotype=$7
gsub(" ","_",$9);
Variant=$9
gene=$10
gsub(" ","_",$11);Contrast=$11
caseno=$12
control=$13
OR=$14
ci=$15
pvalue=$16

print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#association> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#hasVariantID>\t<http://www.CancerGAMA.org/CancerGama.owl#" Variant "> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#hasPhenotypeInfo> <http://www.CancerGAMA.org/CancerGama.owl#" Phenotype "> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#hasEvidence> <http://www.CancerGAMA.org/CancerGama.owl#" PUBMED "> ."
if (caseno !="NA")
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#Case>\t\""caseno"\"^^<http://www.w3.org/2001/XMLSchema#integer> ." 
if (control !="NA")
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#Control>\t\"" control"\"^^<http://www.w3.org/2001/XMLSchema#integer> ."
if (pvalue !="NA")
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#pValue>\t\""pvalue"\"^^<http://www.w3.org/2001/XMLSchema#double> ."
if (ci !="NA")
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#CI95>\t\""ci"\" ."
if (OR !="NA")
print "<http://www.CancerGAMA.org/CancerGama.owl#association_" $1 ">\t<http://www.CancerGAMA.org/CancerGama.owl#OR>\t\""OR"\" ."

print "<http://www.CancerGAMA.org/CancerGama.owl#" Phenotype ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#Phenotype> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#" Phenotype ">\t<http://www.CancerGAMA.org/CancerGama.owl#phenotypeInfoOf>\t<http://www.CancerGAMA.org/CancerGama.owl#association_"$1"> ."


print "<http://www.CancerGAMA.org/CancerGama.owl#"PUBMED">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#PubMedID> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#" PUBMED">\t<http://www.CancerGAMA.org/CancerGama.owl#evidenceOf>\t <http://www.CancerGAMA.org/CancerGama.owl#association_"$1"> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#" PUBMED">\t<http://www.CancerGAMA.org/CancerGama.owl#hasAuthor>\t <http://www.CancerGAMA.org/CancerGama.owl#"author"> ." 
print "<http://www.CancerGAMA.org/CancerGama.owl#" PUBMED">\t<http://www.CancerGAMA.org/CancerGama.owl#hasPubMedID>\t <http://www.CancerGAMA.org/CancerGama.owl#"pubmed"> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#" PUBMED">\t<http://www.CancerGAMA.org/CancerGama.owl#publicationYear>\t\""jurnalyear"\"^^<http://www.w3.org/2001/XMLSchema#integer> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#" PUBMED">\t<http://www.CancerGAMA.org/CancerGama.owl#publishedBy>\t <http://www.CancerGAMA.org/CancerGama.owl#"jurnal"> ."


print "<http://www.CancerGAMA.org/CancerGama.owl#"author">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#FirstAuthor> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"author">\t<http://www.CancerGAMA.org/CancerGama.owl#AuthorOf>\t <http://www.CancerGAMA.org/CancerGama.owl#"PUBMED"> ."

print "<http://www.CancerGAMA.org/CancerGama.owl#"jurnal">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#journal> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"jurnal">\t<http://www.CancerGAMA.org/CancerGama.owl#hasPublished> <http://www.CancerGAMA.org/CancerGama.owl#"PUBMED"> ." 

print "<http://www.CancerGAMA.org/CancerGama.owl#"Contrast">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#Contrast> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"Contrast">\t<http://www.CancerGAMA.org/CancerGama.owl#alleleOf>\t<http://www.CancerGAMA.org/CancerGama.owl#"Variant"> ." 


print "<http://www.CancerGAMA.org/CancerGama.owl#"Variant">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#Variant> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"Variant">\t<http://www.CancerGAMA.org/CancerGama.owl#variantIDof>\t<http://www.CancerGAMA.org/CancerGama.owl#association_"$1"> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"Variant">\t<http://www.CancerGAMA.org/CancerGama.owl#hasAllele>\t<http://www.CancerGAMA.org/CancerGama.owl#"Contrast"> ." 
print "<http://www.CancerGAMA.org/CancerGama.owl#"Variant">\t<http://www.CancerGAMA.org/CancerGama.owl#locatedIn>\t<http://www.CancerGAMA.org/CancerGama.owl#"gene"> ."

print "<http://www.CancerGAMA.org/CancerGama.owl#"gene">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.CancerGAMA.org/CancerGama.owl#Gene> ."
print "<http://www.CancerGAMA.org/CancerGama.owl#"gene">\t<http://www.CancerGAMA.org/CancerGama.owl#location_of>\t<http://www.CancerGAMA.org/CancerGama.owl#"Variant"> ."

}' temp > $1.nt
sort -u $1.nt > temp
mv temp $1.nt
