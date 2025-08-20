

# Datasets

## Overview

This section documents comprehensive datasets for viral glycoprotein stabilization experiments, focusing on SARS-CoV-2 spike protein structures, stability measurements, and mutation effects. The datasets are organized into three primary categories: structural databases, viral glycoprotein-specific resources, and protein stability benchmarks.

## Structural Databases

### Dataset 1: RCSB Protein Data Bank (PDB) - SARS-CoV-2 Structures
- **Name**: RCSB PDB SARS-CoV-2 Spike Protein Collection
- **Source**: https://www.rcsb.org/
- **Size**: 100+ high-resolution spike protein structures
- **Features**: 
  - Prefusion and postfusion conformations
  - Wildtype and stabilized variants (2P, HexaPro, etc.)
  - Antibody-bound complexes
  - Cryo-EM and X-ray structures
  - Key PDB IDs: 6Z97, 7AD1, 8FEZ, 8DYA, 7RA8
- **License**: Public Domain (CC0)
- **Preprocessing**: Structure validation, chain selection, standardization
- **Access**: Direct download via PDB API or bulk download

### Dataset 2: CoV3D Database
- **Name**: Coronavirus 3D Structure Database
- **Source**: https://cov3d.ibbr.umd.edu/
- **Size**: Weekly-updated collection of coronavirus structures
- **Features**: 
  - SARS-CoV-2, SARS-CoV, MERS-CoV structures
  - Spike structural classifications (open/closed states)
  - Antibody binding analysis
  - Glycosylation data
  - RBD interface analysis
- **License**: Academic use, CC BY 4.0
- **Preprocessing**: Structural clustering, conformational classification
- **Access**: Web interface and bulk downloads available

### Dataset 3: AlphaFold Protein Structure Database
- **Name**: AlphaFold DB Coronavirus Proteins
- **Source**: https://alphafold.ebi.ac.uk/
- **Size**: 200M+ protein predictions, ~50 coronavirus proteins
- **Features**: 
  - AI-predicted 3D structures
  - Confidence scores (pLDDT)
  - Full-length spike proteins from variants
  - Structural domains and flexibility predictions
- **License**: CC BY 4.0
- **Preprocessing**: Confidence filtering, domain extraction
- **Access**: UniProt ID-based search and bulk download

## Viral Glycoprotein-Specific Resources

### Dataset 4: CoVal - SARS-CoV-2 Mutation Database
- **Name**: CoVal Structural Mutations Database
- **Source**: https://coval.ccpem.ac.uk/
- **Size**: Comprehensive mutation collection mapped to structures
- **Features**: 
  - Amino acid mutations in SARS-CoV-2 genome
  - Structural mapping to cryo-EM structures
  - Geographic and demographic distribution
  - Co-occurring mutation analysis
  - Local structure quality assessment
- **License**: Academic use (contact required)
- **Preprocessing**: Structure-sequence alignment, mutation validation
- **Access**: Web interface, API for programmatic access

### Dataset 5: PDBe-KB COVID-19 Portal
- **Name**: Protein Data Bank Europe COVID-19 Portal
- **Source**: https://www.ebi.ac.uk/pdbe/covid-19
- **Size**: 2400+ structures with functional annotations
- **Features**: 
  - Ligand binding sites annotation
  - Protein-protein interaction residues
  - Functional site predictions
  - Cross-references to UniProt
  - Structural comparisons
- **License**: Open access (various licenses)
- **Preprocessing**: Functional annotation, site classification
- **Access**: REST API and bulk download

## Protein Stability Benchmarks

### Dataset 6: FireProtDB
- **Name**: Database of Manually Curated Protein Stability Data
- **Source**: https://loschmidt.chemi.muni.cz/fireprotdb/
- **Size**: 140,000+ stability measurements, 4,000+ proteins
- **Features**: 
  - Experimental ΔΔG values for mutations
  - Temperature, pH conditions
  - Measurement methods (DSC, CD, fluorescence)
  - Cross-validation with PDB structures
  - Quality assessment scores
- **License**: Academic use, CC BY 4.0
- **Preprocessing**: Data cleaning, outlier removal, standardization
- **Access**: Web interface, downloadable CSV files

### Dataset 7: ProThermDB
- **Name**: Protein Thermodynamic Database
- **Source**: https://web.iitm.ac.in/bioinfo2/prothermdb/
- **Size**: 31,000+ thermodynamic measurements
- **Features**: 
  - Protein unfolding free energies
  - Temperature and pH dependencies
  - Mutation effects on stability
  - Literature references
  - Experimental conditions
- **License**: Open access for academic research
- **Preprocessing**: Data normalization, condition standardization
- **Access**: Web search interface, bulk data requests

### Dataset 8: SKEMPI v2.0
- **Name**: Structural Database of Kinetic and Energetic Mutational effects on Protein-Protein Interactions
- **Source**: https://life.bsc.es/pid/skempi2
- **Size**: 7,085 mutations affecting protein binding
- **Features**: 
  - Binding energy changes (ΔΔG)
  - Kinetic parameters (kon, koff)
  - High-resolution crystal structures
  - Interface residue analysis
  - Homology clustering
- **License**: Open access for research
- **Preprocessing**: Structure validation, interface definition
- **Access**: Database download and web interface

## Specialized Stability Datasets

### Dataset 9: Megascale Experimental Data
- **Name**: Large-scale Protein Stability Measurements
- **Source**: Recent high-throughput studies (Tsuboyama et al. 2023)
- **Size**: 700,000+ stability measurements
- **Features**: 
  - Deep mutational scanning data
  - Fitness/stability correlations  
  - Multiple protein families
  - Statistical significance testing
- **License**: Open access with attribution
- **Preprocessing**: Quality filtering, batch effect correction
- **Access**: Supplementary data from publications

## Benchmarks and Evaluation Datasets

### Standard Benchmarks
1. **S2648 Dataset**: Curated protein stability changes (2,648 mutations)
2. **Varibench Dataset**: Pathogenic vs. neutral mutations
3. **ClinVar**: Clinical variant database with stability annotations
4. **Humsavar**: Human protein variant database

### Evaluation Metrics
- Pearson/Spearman correlation for ΔΔG predictions
- Classification accuracy for stabilizing vs. destabilizing
- Area under ROC curve for pathogenicity prediction
- Mean absolute error for quantitative predictions

## Data Access Instructions

### Bulk Downloads
1. **PDB Structures**: Use RCSB REST API or rsync mirrors
2. **AlphaFold Models**: FTP download by organism or bulk
3. **Stability Data**: Direct CSV downloads from FireProtDB/SKEMPI
4. **Mutation Data**: CoVal API or manual extraction

### Preprocessing Pipeline
1. **Structure Preparation**: 
   - Chain selection and cleaning
   - Hydrogen addition for modeling
   - Structure validation and filtering

2. **Stability Data Processing**:
   - Unit standardization (kcal/mol)
   - Condition normalization (25°C, pH 7.0)
   - Outlier detection and removal

3. **Feature Engineering**:
   - Structural descriptors extraction
   - Sequence context encoding
   - Physicochemical property calculation

### Storage Requirements
- **Raw structures**: ~10 GB for PDB collection
- **Processed datasets**: ~5 GB combined
- **Feature matrices**: ~2 GB for analysis-ready data

### Access Scripts
```bash
# Download SARS-CoV-2 structures
rsync -avz rsync://ftp.wwpdb.org/pub/pdb/data/structures/divided/pdb/6z/ ./pdb_structures/

# Fetch AlphaFold models
wget -r -np -nd https://alphafold.ebi.ac.uk/files/AF-P0DTC2-F1-model_v4.pdb

# Access FireProtDB data
curl -O https://loschmidt.chemi.muni.cz/fireprotdb/downloads/fireprotdb_data.csv
```

