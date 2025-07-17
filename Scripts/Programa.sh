#!/bin/bash
#$ -N FELIDAE_PIPELINE
#$ -cwd
#$ -l h_rt=04:00:00,h_data=8G
#$ -pe shared 4
#$ -M dechavezv@ucla.edu
#$ -m bea
#$ -o logs/felidae.out
#$ -e logs/felidae.err

# 1. Crear carpetas base
mkdir -p GENES_FELIDAE ALINEAMIENTOS ARBOLES logs

# 2. Descargar ortólogos con datasets (FOXP2, MC1R, TAS2R38)
cd GENES_FELIDAE

echo "Descargando FOXP2..."
datasets download gene symbol FOXP2 --ortholog Felidae --filename FOXP2_Felidae.zip
unzip -o FOXP2_Felidae.zip
cp ncbi_dataset/data/rna.fna FOXP2_Felidae.fna
rm -rf ncbi_dataset FOXP2_Felidae.zip

echo "Descargando TAS2R38..."
datasets download gene symbol TAS2R38 --ortholog Felidae --filename TAS2R38_Felidae.zip
unzip -o TAS2R38_Felidae.zip
cp ncbi_dataset/data/rna.fna TAS2R38_Felidae.fna
rm -rf ncbi_dataset TAS2R38_Felidae.zip

echo "Descargando MC1R..."
datasets download gene symbol MC1R --ortholog Felidae --filename MC1R_Felidae.zip
unzip -o MC1R_Felidae.zip
cp ncbi_dataset/data/rna.fna MC1R_Felidae.fna
rm -rf ncbi_dataset MC1R_Felidae.zip

# 3. Renombrar encabezados en formato Genus_species_GENE
for f in *_Felidae.fna; do
  gene=$(basename "$f" _Felidae.fna)
  sed -E 's/^>.*\[organism=([A-Za-z]+) ([a-z]+)\].*/>\1_\2_'${gene}'/' "$f" > "${gene}_renamed.fna"
done

cd ..

# 4. Alineamiento con MUSCLE
for gene in FOXP2 MC1R TAS2R38; do
  ./muscle3.8.31_i86linux64 -in GENES_FELIDAE/${gene}_renamed.fna -out ALINEAMIENTOS/${gene}_aln.fasta
done

# 5. Verificación de longitudes de alineamiento
echo "Verificación de longitudes de alineamientos:"
for aln in ALINEAMIENTOS/*.fasta; do
  echo -n "$aln: "
  grep -v "^>" "$aln"

