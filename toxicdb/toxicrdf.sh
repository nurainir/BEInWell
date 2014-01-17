awk -F$'\t' 'BEGIN{ } {

gsub(" ","_",$1); toxicant=$1
evidence_strengh=$2
gsub(" ","_",$3); disease=$3

print "<http://www.toxicDB.org/toxicDB.owl#toxican_" $1 ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.wellnessontologies.org/ontologies/beinwellOntology.owl#agent> ."
print "<http://www.toxicDB.org/toxicDB.owl#disease_" $1 ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.wellnessontologies.org/ontologies/beinwellOntology.owl#Disease> ."
print "<http://www.toxicDB.org/toxicDB.owl#Evidence_" $1 ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.wellnessontologies.org/ontologies/beinwellOntology.owl#Evidence> ."

}' $1 > $1.nt
sort -u $1.nt > temp
mv temp $1.nt
