#!/bin/bash

# Dataset Download Script for Viral Glycoprotein Stabilization Research
# This script downloads key datasets identified for the research

echo "Setting up data directory structure..."

# Create directory structure
mkdir -p structures/pdb
mkdir -p structures/alphafold  
mkdir -p stability_data/fireprotdb
mkdir -p stability_data/skempi
mkdir -p stability_data/prothermdb
mkdir -p mutations/coval
mkdir -p mutations/variants
mkdir -p benchmarks

echo "Downloading SARS-CoV-2 spike protein structures..."

# Download key PDB structures
cd structures/pdb

# Original SARS-CoV-2 spike (closed state)
wget -q https://files.rcsb.org/download/6Z97.pdb -O spike_original_6Z97.pdb

# 2P stabilized spike (prefusion stabilized) 
wget -q https://files.rcsb.org/download/7AD1.pdb -O spike_stabilized_7AD1.pdb

# HexaPro stabilized spike (highly stabilized)
wget -q https://files.rcsb.org/download/8FEZ.pdb -O spike_hexapro_8FEZ.pdb

# S2 subunit structure
wget -q https://files.rcsb.org/download/8DYA.pdb -O spike_s2_8DYA.pdb

# Antibody-bound spike
wget -q https://files.rcsb.org/download/7RA8.pdb -O spike_antibody_7RA8.pdb

cd ../../

echo "Downloading AlphaFold predicted structures..."
cd structures/alphafold

# SARS-CoV-2 spike protein AlphaFold prediction
wget -q https://alphafold.ebi.ac.uk/files/AF-P0DTC2-F1-model_v4.pdb -O spike_alphafold_P0DTC2.pdb

cd ../../

echo "Setting up stability data placeholders..."
# Note: Some databases require registration/contact for bulk downloads

# SKEMPI v2.0 (publicly accessible)
cd stability_data/skempi
echo "# SKEMPI v2.0 - Protein-Protein Binding Changes" > README.md
echo "# Download from: https://life.bsc.es/pid/skempi2/database/download/" >> README.md
echo "# Contains 7,085 mutations affecting binding energy" >> README.md

# FireProtDB (requires registration)  
cd ../fireprotdb
echo "# FireProtDB - Curated Protein Stability Data" > README.md
echo "# Download requires registration at: https://loschmidt.chemi.muni.cz/fireprotdb/" >> README.md
echo "# Contains 140,000+ experimental stability measurements" >> README.md

# ProThermDB (contact required)
cd ../prothermdb  
echo "# ProThermDB - Protein Thermodynamic Database" > README.md
echo "# Contact required for bulk data: https://web.iitm.ac.in/bioinfo2/prothermdb/" >> README.md
echo "# Contains 31,000+ thermodynamic measurements" >> README.md

cd ../../

echo "Setting up mutation data placeholders..."
cd mutations/coval
echo "# CoVal - SARS-CoV-2 Mutation Database" > README.md
echo "# Access via web interface: https://coval.ccpem.ac.uk/" >> README.md
echo "# Registration may be required for bulk downloads" >> README.md

cd ../variants
echo "# Variant-Specific Mutation Collections" > README.md
echo "# Data to be curated from literature and GISAID" >> README.md

cd ../../benchmarks
echo "# Evaluation Benchmarks and Metrics" > README.md
echo "# Standard datasets for model evaluation" >> README.md

cd ..

echo "Dataset setup complete!"
echo "Downloaded structures:"
ls -la structures/pdb/*.pdb
ls -la structures/alphafold/*.pdb

echo ""
echo "Note: Some datasets require registration or contact for access:"
echo "- FireProtDB: https://loschmidt.chemi.muni.cz/fireprotdb/" 
echo "- ProThermDB: https://web.iitm.ac.in/bioinfo2/prothermdb/"
echo "- CoVal: https://coval.ccpem.ac.uk/"
echo "- SKEMPI: https://life.bsc.es/pid/skempi2/"