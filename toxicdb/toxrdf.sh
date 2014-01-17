#mv temp ID
## http://www.toxicDB.org/toxicDB.owl#toxican	http://www.toxicDB.org/toxicDB.owl#Disease	http://www.toxicDB.org/toxicDB.owl#Evidence

awk -F$'\t' 'BEGIN{ ID=1} {
association=ID
gsub(" ","_",$1); toxican=$1
gsub(" ","_",$2);disease=$3 
evidence=$2 

print "<http://www.toxicDB.org/toxicDB.owl#association_" ID ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.toxicDB.org/toxicDB.owl#association> ."
print "<http://www.toxicDB.org/toxicDB.owl#association_" ID ">\t<http://www.toxicDB.org/toxicDB.owl#evidence>\t\""evidence"\" ."
print "<http://www.toxicDB.org/toxicDB.owl#association_" ID ">\t<http://www.toxicDB.org/toxicDB.owl#hasPhenotypeInfo>\t<http://www.toxicDB.org/toxicDB.owl#disease_"Disease"> ."
print "<http://www.toxicDB.org/toxicDB.owl#association_" ID ">\t<http://www.toxicDB.org/toxicDB.owl#hasToxicFactor>\t<http://www.toxicDB.org/toxicDB.owl#tox_"toxican"> ."


print "<http://www.toxicDB.org/toxicDB.owl#disease_"disease">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.toxicDB.org/toxicDB.owl#Disease> ."
print "<http://www.toxicDB.org/toxicDB.owl#disease_"disease">\t<http://www.toxicDB.org/toxicDB.owl#PhenotypeOf>\t<http://www.toxicDB.org/toxicDB.owl#association_" ID "> ."

print "<http://www.toxicDB.org/toxicDB.owl#tox_"toxican">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.toxicDB.org/toxicDB.owl#Toxicant> ."
print "<http://www.toxicDB.org/toxicDB.owl#tox_"toxican">\t<http://www.toxicDB.org/toxicDB.owl#ToxicFactorcOf>\t<http://www.toxicDB.org/toxicDB.owl#association_" ID "> ."

ID++

}' $1 > toxic.nt
sort -u toxic.nt > temp
mv temp toxic.nt
