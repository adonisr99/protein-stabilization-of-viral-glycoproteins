# Data Directory

This directory contains datasets for viral glycoprotein stabilization research, focusing on SARS-CoV-2 spike protein structures, stability measurements, and mutation effects.

## Directory Structure

```
data/
├── structures/
│   ├── pdb/                 # RCSB PDB structures
│   │   ├── spike_original_6Z97.pdb
│   │   ├── spike_stabilized_7AD1.pdb
│   │   └── spike_hexapro_8FEZ.pdb
│   └── alphafold/          # AlphaFold predicted structures
│       └── AF-P0DTC2-F1-model_v4.pdb
├── stability_data/
│   ├── fireprotdb/         # FireProtDB curated stability data
│   │   └── fireprotdb_data.csv
│   ├── skempi/            # SKEMPI protein-protein interaction data
│   │   └── skempi_v2_data.csv
│   └── prothermdb/        # ProThermDB thermodynamic data
│       └── protherm_data.csv
├── mutations/
│   ├── coval/             # CoVal SARS-CoV-2 mutation data
│   │   └── coval_spike_mutations.csv
│   └── variants/          # Variant-specific data
│       ├── delta_mutations.csv
│       ├── omicron_mutations.csv
│       └── ba5_mutations.csv
└── benchmarks/
    ├── s2648_dataset.csv      # Standard stability benchmark
    ├── varibench_data.csv     # Pathogenic variant benchmark
    └── evaluation_metrics.json # Performance metrics definitions
```

## Key Datasets Downloaded

### Structural Data
1. **6Z97.pdb** - Original SARS-CoV-2 spike protein structure (closed state)
2. **7AD1.pdb** - 2P stabilized spike protein (prefusion stabilized)
3. **8FEZ.pdb** - HexaPro stabilized spike protein (highly stabilized)
4. **AF-P0DTC2-F1-model_v4.pdb** - AlphaFold spike protein prediction

### Stability Datasets
1. **FireProtDB** - 140,000+ experimental stability measurements
2. **SKEMPI v2.0** - 7,085 protein-protein binding mutations
3. **ProThermDB** - 31,000+ thermodynamic measurements

### Mutation Data
1. **CoVal Database** - SARS-CoV-2 mutations mapped to structures
2. **Variant Collections** - Delta, Omicron, BA.5 specific mutations
3. **Geographic Distribution** - Mutation prevalence by region

## Data Access and Usage

### Structural Data Access
```bash
# Download key SARS-CoV-2 structures
wget https://files.rcsb.org/download/6Z97.pdb   # Original spike
wget https://files.rcsb.org/download/7AD1.pdb   # 2P stabilized
wget https://files.rcsb.org/download/8FEZ.pdb   # HexaPro stabilized

# Download AlphaFold model
wget https://alphafold.ebi.ac.uk/files/AF-P0DTC2-F1-model_v4.pdb
```

### Stability Data Access
```bash
# FireProtDB (requires registration)
# Download from: https://loschmidt.chemi.muni.cz/fireprotdb/

# SKEMPI v2.0
wget https://life.bsc.es/pid/skempi2/database/download/skempi_v2.csv

# ProThermDB (contact required for bulk data)
# Access via: https://web.iitm.ac.in/bioinfo2/prothermdb/
```

### Preprocessing Requirements
1. **Structure Preparation**: Remove waters, add hydrogens, validate chains
2. **Data Cleaning**: Remove outliers, standardize units, filter low-quality entries
3. **Feature Extraction**: Calculate structural descriptors, sequence features

## Dataset Licenses and Citations

### RCSB PDB
- **License**: Public Domain (CC0)
- **Citation**: Worldwide Protein Data Bank consortium. Nucleic Acids Res. 2019;47:D520-8.

### AlphaFold
- **License**: CC BY 4.0
- **Citation**: Jumper et al. Nature. 2021;596:583-589.

### FireProtDB
- **License**: CC BY 4.0
- **Citation**: Stourac et al. Nucleic Acids Res. 2021;49:D319-D324.

### SKEMPI v2.0
- **License**: Open access for research
- **Citation**: Jankauskaite et al. Bioinformatics. 2019;35:462-469.

### CoVal
- **License**: Academic use (registration required)
- **Citation**: Malhotra et al. Database. 2021;baab050.

## Storage and Compute Requirements

- **Raw Data**: ~15 GB total
- **Processed Features**: ~5 GB
- **Analysis Results**: ~2 GB
- **Recommended RAM**: 16 GB for large-scale analysis
- **Disk Space**: 25 GB recommended with processing overhead

## Quality Control

### Structure Validation
- Resolution cutoff: ≤3.0 Å for experimental structures
- Validation scores from PDB
- Missing atom/residue assessment

### Data Quality Metrics
- Experimental condition standardization
- Measurement method consistency  
- Statistical significance thresholds
- Cross-validation with literature

## Usage Examples

### Loading Structural Data
```python
import biotite.structure.io as bsio

# Load and analyze spike structures
structure_6z97 = bsio.load_structure("structures/pdb/spike_original_6Z97.pdb")
structure_7ad1 = bsio.load_structure("structures/pdb/spike_stabilized_7AD1.pdb")
```

### Processing Stability Data
```python
import pandas as pd

# Load FireProtDB data
fireprotdb = pd.read_csv("stability_data/fireprotdb/fireprotdb_data.csv")
# Filter for coronavirus proteins
cov_data = fireprotdb[fireprotdb['protein_name'].str.contains('spike|corona')]
```

## Contributing New Data

To add new datasets:
1. Create appropriate subdirectory
2. Include metadata file (JSON format)
3. Add preprocessing scripts
4. Update this README
5. Document licensing and citation requirements

## Support and Issues

For questions about dataset usage or to report data quality issues, please create an issue in the repository or contact the research team.

Last Updated: 2025-08-20