#!/bin/bash
#SBATCH -J soloJ1
#SBATCH -o /tmp/Mazutislab-out/Juozapas/HEM/logs/soloindrops_1.log
#SBATCH --partition Cluster-public
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=120G
#SBATCH --time=48:00:00

# conda env
conda activate nextflow21
export PATH="/home/MazutisLab/software/pkg/miniconda3/envs/nextflow21/bin:$PATH"

# add tempdir path
export TMPDIR=/tmp

#run pipe
nextflow run jsimonas/solo-in-drops \
	--run_dir '/tmp/Mazutislab-out/Juozapas/HEM/data/raw/231117_NS500633_0187_AHJT72BGXV' \
	--outdir '/tmp/Mazutislab-out/Juozapas/HEM/data/indrops/' \
	--sample_sheet '/tmp/Mazutislab-out/Juozapas/HEM/data/samplesheets/hem_extended_sample_sheet1.xlsx' \
	--star_index '/home/simonasj/references/genome/GRCh38_Ensembl_107/index/' \
	--scrna_protocol 'indrops' \
	--solo_features "Gene GeneFull" \
	--solo_multi_mappers "EM" \
	--sequencer 'nextseq' \
	--align_mode 'cell' \
	-profile conda \
	-ansi-log false \
	-resume \
	-r dev

