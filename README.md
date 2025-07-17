# Análisis filogenético de genes ortólogos en especies del grupo *Felidae*

Este proyecto tiene como objetivo analizar la relación evolutiva entre especies del grupo *Felidae* mediante el estudio de tres genes ortólogos: **FOXP2**, **MC1R** y **TAS2R38**. Estos genes fueron seleccionados por su relevancia en características fenotípicas clave como vocalización (FOXP2), pigmentación (MC1R) y percepción del gusto amargo (TAS2R38), respectivamente.

Las secuencias se descargaron desde NCBI utilizando la herramienta `datasets`, se alinearon con `muscle` y se construyeron árboles filogenéticos con `IQ-TREE2`. Finalmente, los árboles generados se visualizaron en `FigTree`.

Este estudio permite observar la divergencia genética entre especies de *Felidae* y evaluar la utilidad de estos genes ortólogos en estudios evolutivos comparativos.

# Utilidad:
- Explora la utilidad de genes funcionales específicos para reconstrucción filogenética.
- Aporta evidencia sobre la divergencia genética en el grupo *Felidae*.
- Contribuye a entender cómo se han conservado o diversificado genes con funciones biológicas claves.
- Sirve como ejemplo práctico de cómo combinar herramientas bioinformáticas para análisis filogenético.

---

## Requisitos previos

- Acceso a una supercomputadora.
- Terminal Git Bash.
- ATOM
- Programas requeridos:
  - [`datasets`](https://www.ncbi.nlm.nih.gov/datasets/)
  - [`muscle`](https://www.drive5.com/muscle/)
  - [`iqtree`](http://www.iqtree.org/)
  - [`figtree`](http://tree.bio.ed.ac.uk/software/figtree/)

---

## Crear carpeta de trabajo en la terminal y carpeta personal

cd JuanAY
mkdir FELIDAE

- Tiene que estar datasets en esta carpeta.
- Tiene que estar muscle3.8.31

## Descargar secuencias

```bash
datasets download gene symbol FOXP2 --taxon Felidae --filename FOXP2_Felidae.zip
datasets download gene symbol MC1R --taxon Felidae --filename MC1R_Felidae.zip
datasets download gene symbol TAS2R38 --taxon Felidae --filename TAS2R38_Felidae.zip

unzip FOXP2_Felidae.zip
unzip MC1R_Felidae.zip
unzip TAS2R38_Felidae.zip

- Generando archivos .fna dentro de cada carpeta descargada.
```
## Alinear con muscle

```bash
./muscle3.8.31_i86linux64 -in FOXP2_Felidae.fna -out FOXP2_aln.fasta
./muscle3.8.31_i86linux64 -in MC1R_Felidae.fna -out MC1R_aln.fasta
./muscle3.8.31_i86linux64 -in TAS2R38_Felidae.fna -out TAS2R38_aln.fasta

- Generando archivos alineados en formato FASTA para cada gen.
```
## Editar con ATOM



## Implementar IQTREE

```bash
module load iqtree/2.2.6
iqtree2 -s
```
---

## Visualizar el treefile en Figtree

- Si el archivo se encuentra en la supercomputador utilizar el comando: scp

Abre el archivo en FigTree para visualizar y analizar el árbol filogenético.

---

![Felidae - Leptailurus serval](https://upload.wikimedia.org/wikipedia/commons/2/2a/Serval.jpg)
