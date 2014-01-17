#mv temp ID
## Variant_id	Allele	Magnitude	Repute	Summary
awk -F$'\t' 'BEGIN{ ID=1} {
association=ID
gsub(" ","_",$1); VarID=$1
gsub(" ","_",$2);Allele=$2 
gsub(" ","_",$3);Magnitude=$3 
gsub(" ","_",$4); Repute=$4
gsub(" ","_",$5);Summary=$5 


print "<http://www.SNpedia.org/SNpedia.owl#association_" ID ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.SNpedia.org/SNpedia.owl#association> ."
print "<http://www.SNpedia.org/SNpedia.owl#association_" ID ">\t<http://www.SNpedia.org/SNpedia.owl#summary>\t\""Summary"\" ."
print "<http://www.SNpedia.org/SNpedia.owl#association_" ID ">\t<http://www.SNpedia.org/SNpedia.owl#Repute>\t<http://www.SNpedia.org/SNpedia.owl#"Repute"> ."
print "<http://www.SNpedia.org/SNpedia.owl#association_" ID ">\t<http://www.SNpedia.org/SNpedia.owl#Magnitude>\t\"" Magnitude"\"^^<http://www.w3.org/2001/XMLSchema#double> ."
print "<http://www.SNpedia.org/SNpedia.owl#association_" ID ">\t<http://www.SNpedia.org/SNpedia.owl#hasVariantID>\t<http://www.SNpedia.org/SNpedia.owl#VID"VarID"> ."


print "<http://www.SNpedia.org/SNpedia.owl#VID"VarID">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.SNpedia.org/SNpedia.owl#Variant> ."
print "<http://www.SNpedia.org/SNpedia.owl#VID"VarID">\t<http://www.SNpedia.org/SNpedia.owl#variantOf>\t<http://www.SNpedia.org/SNpedia.owl#association_" ID "> ."
print "<http://www.SNpedia.org/SNpedia.owl#VID"VarID">\t<http://www.SNpedia.org/SNpedia.owl#hasAllele>\t<http://www.SNpedia.org/SNpedia.owl#Allele"Allele"> ."

print "<http://www.SNpedia.org/SNpedia.owl#Allele"Allele">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.SNpedia.org/SNpedia.owl#Chemical> ."
print "<http://www.SNpedia.org/SNpedia.owl#Allele"Allele">\t<http://www.SNpedia.org/SNpedia.owl#interactingToxicOf>\t<http://www.SNpedia.org/SNpedia.owl#association_" ID "> ."
print "<http://www.SNpedia.org/SNpedia.owl#Allele"Allele">\t<http://www.SNpedia.org/SNpedia.owl#alleleOf>\t<http://www.SNpedia.org/SNpedia.owl#VID" VarID "> ."


ID++

}' $1 > snpedia.nt
sort -u snpedia.nt > temp
mv temp snpedia.nt
