sudo apt install fastqc
fastqc combined*.fq 
conda install -c bioconda -c conda-forge multiqc
multiqc -o multiqc *.downsampled_fastqc.zip

wget http://cab.spbu.ru/files/release3.15.3/SPAdes-3.15.3-Linux.tar.gz
tar -xzf SPAdes-3.15.3-Linux.tar.gz
cd SPAdes-3.15.3-Linux/bin/
metaspades --only-assembler -1 combined_1_val_1.downsampled.fq -2 combined_2_val_2.downsampled.fq -o metaspades

**Качаю QUAST с GitHubа**
bash install_full.sh
./metaquast.py -r ../refs/*.fna -t 16 -o ../metaquast_output/ ../metaspades/contigs.fasta
metabat2 -i ./GenomeAssembly/metaspades/contigs.fasta -o ./GenomeAssembly/metabat_output/file
./metaquast.py -r ../refs/ -t 16 -o../metaquast_output/mags_new/ ../metabat_output/*.f

conda install -c conda-forge -c bioconda busco=5.2.2
conda create -n busco -c conda-forge -c bioconda busco=5.2.2
conda activate busco

busco -i metabat_output/ -o busco_all -m genome --cpu 8 --force
generate_plot.py -wd busco_all/batch_summary.txt
