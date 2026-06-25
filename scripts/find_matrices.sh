#!/bin/bash

cd /tmp/Mazutislab-out/Juozapas/HEM/data/

for i in {1..15}; do
  DIR=$(find . -name "*HEMO*_${i}_*Solo.out")/GeneFull/raw
  mkdir -p "matrices/$i"
  cp "${DIR}/matrix.mtx" "matrices/$i"
  cp "${DIR}/barcodes.tsv" "matrices/$i"
  cp "${DIR}/features.tsv" "matrices/$i"
  gzip matrices/${i}/*
done

