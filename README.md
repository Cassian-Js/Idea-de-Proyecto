# Análisis filogenético del gen RPB2 en especies del filum Ascomycota

Este proyecto compara la variabilidad genética del gen **rpb2** entre especies del filum *Ascomycota*. 
Las secuencias se descargan desde NCBI usando `datasets`, se alinean con `muscle`, y se analiza su relación evolutiva con `IQ-TREE2`.
Finalmente, los árboles generados pueden visualizarse con `figtree`.

---

## Requisitos previos

- Acceso a una supercomputadora.
- Terminal Git Bash.
- Programas requeridos:
  - [`datasets`](https://www.ncbi.nlm.nih.gov/datasets/)
  - [`muscle`](https://www.drive5.com/muscle/)
  - [`iqtree`](http://www.iqtree.org/)
  - [`figtree`](http://tree.bio.ed.ac.uk/software/figtree/)

---

## Crear carpetas necesarias


mkdir -p Proyecto.final/Secuencias/Ortologos
mkdir -p Proyecto.final/Alineamientos
mkdir -p Proyecto.final/Resultados

## Descargar secuencias

cd Proyecto.final/Secuencias/Ortologos

datasets download gene symbol rpb2 --ortholog Ascomycota --filename rpb2_Asco.zip
unzip rpb2_Asco.zip
mv ncbi_dataset/data/rna.fna rpb2_ascomycota.fasta

## Alinear con muscle

cd ../../../

./muscle3.8.31_i86linux64 -in Proyecto.final/Secuencias/Ortologos/rpb2_ascomycota.fasta \
-out Proyecto.final/Alineamientos/rpb2_aligned.fasta \
-maxiters 1 -diags

## Implementar IQTREE

cd Proyecto.final/Alineamientos

module load iqtree/2.2.6
iqtree2 -s rpb2_aligned.fasta -m MFP -bb 1000 -nt AUTO

---

## Visualizar el treefile en Figtree

- Si el archivo se encuentra en la supercomputador utilizar el comando: scp

Abre el archivo rpb2_aligned.fasta.treefile en FigTree para visualizar y analizar el árbol filogenético.

---

![](https://static.nationalgeographic.es/files/styles/image_3200/public/naturepl_01678604.jpg?w=1900&h=1267)
