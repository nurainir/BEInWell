#mv temp ID
## ChemicalName,ChemicalID,GeneSymbol,GeneID,Organism,OrganismID,Interaction,PubMedIDs
awk -F$'\t' 'BEGIN{ ID=1} {
association=ID
gsub(" ","_",$1); ChemicalName=$1
gsub(" ","_",$2);ChemicalID=$2 
gsub(" ","_",$3);GeneSymbol=$3 
gsub(" ","_",$4); GeneID=$4
gsub(" ","_",$5);Organism=$5 
gsub(" ","_",$6);OrganismID=$6
gsub(" ","_",$7);Interaction=$7
PubMedIDs=$8

print "<http://www.ctd.org/ctd.owl#association_" ID ">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.ctd.org/ctd.owl#association> ."
print "<http://www.ctd.org/ctd.owl#association_" ID ">\t<http://www.ctd.org/ctd.owl#hasInteraction>\t\""Interaction"\" ."
print "<http://www.ctd.org/ctd.owl#association_" ID ">\t<http://www.ctd.org/ctd.owl#hasEvidence>\t<http://www.ctd.org/ctd.owl#Pub"PubMedIDs"> ."
print "<http://www.ctd.org/ctd.owl#association_" ID ">\t<http://www.ctd.org/ctd.owl#hasInteractingGene>\t<http://www.ctd.org/ctd.owl#GID"GeneID"> ."
print "<http://www.ctd.org/ctd.owl#association_" ID ">\t<http://www.ctd.org/ctd.owl#hasInteractingToxic>\t<http://www.ctd.org/ctd.owl#CID"ChemicalID"> ."


print "<http://www.ctd.org/ctd.owl#Pub"PubMedIDs">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.ctd.org/ctd.owl#PubMedID> ."
print "<http://www.ctd.org/ctd.owl#Pub"PubMedIDs">\t<http://www.ctd.org/ctd.owl#evidenceOf>\t<http://www.ctd.org/ctd.owl#association_" ID "> ."


print "<http://www.ctd.org/ctd.owl#CID"ChemicalID">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.ctd.org/ctd.owl#Chemical> ."
print "<http://www.ctd.org/ctd.owl#CID"ChemicalID">\t<http://www.w3.org/2000/01/rdf-schema#label>\t\"" ChemicalName "\" ."
print "<http://www.ctd.org/ctd.owl#CID"ChemicalID">\t<http://www.ctd.org/ctd.owl#interactingToxicOf>\t<http://www.ctd.org/ctd.owl#association_" ID "> ."

print "<http://www.ctd.org/ctd.owl#GID"GeneID">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.ctd.org/ctd.owl#Gene> ."
print "<http://www.ctd.org/ctd.owl#GID"GeneID">\t<http://www.w3.org/2000/01/rdf-schema#label>\t\"" GeneSymbol "\" ."
print "<http://www.ctd.org/ctd.owl#GID"GeneID">\t<http://www.ctd.org/ctd.owl#geneOf>\t<http://www.ctd.org/ctd.owl#OID" OrganismID "> ."
print "<http://www.ctd.org/ctd.owl#GID"GeneID">\t<http://www.ctd.org/ctd.owl#interactingGeneOf>\t<http://www.ctd.org/ctd.owl#association_" ID "> ."


print "<http://www.ctd.org/ctd.owl#OID"OrganismID">\t<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>\t<http://www.ctd.org/ctd.owl#Organism> ."
print "<http://www.ctd.org/ctd.owl#OID"OrganismID">\t<http://www.w3.org/2000/01/rdf-schema#label>\t\"" Organism "\" ."
print "<http://www.ctd.org/ctd.owl#OID"OrganismID">\t<http://www.ctd.org/ctd.owl#hasGene>\t<http://www.ctd.org/ctd.owl#GID" GeneID "> ."

ID++

}' $1 > ctd.nt
sort -u ctd.nt > temp
mv temp ctd.nt
