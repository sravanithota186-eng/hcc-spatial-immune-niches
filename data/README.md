# Data

Raw/processed data are git-ignored. Record here, for each dataset: accession,
download date, URL, file list, checksums, and any preprocessing.

## Confirmed dataset mappings (verified against NCBI GEO, Oct/Nov 2026)

| Accession | Role | Data type | Linked paper | GEO status |
|---|---|---|---|---|
| GSE319709 | Discovery | scRNA-seq (CD45+ immune cells) | "Single-cell transcriptomics reveals etiology-specific T-cell heterogeneity in HCC" (Yan et al., 2026) | Public 2026-02-20; PRJNA1418916; GPL24676 |
| GSE238264 | Spatial validation | 10x Visium | Zhang S et al. Genome Med 2023;15:72 (cabo + nivo) | Public |
| GSE206325 | Immune-response validation | scRNA-seq + TCR | Magen A et al. Nat Med 2023;29:1389 (PD-1 blockade) | Public 2023-06-16; PMID 37322116 |
| GSE202069 | Response validation | Bulk RNA-seq | Li B et al. (anti-PD-1 HCC, fatty-acid degradation signature) | Public 2023-05-01; PRJNA834139 |
| TCGA-LIHC | Clinical validation | RNA-seq + clinical | TCGA consortium | Public |
| GSE14520 / ICGC LIRI-JP | External validation | Bulk | ICGC LIRI-JP | Public |

| Accession | Downloaded? | Date | Files | Checksum (md5) | Notes |
|---|---|---|---|---|---|
| GSE319709 | ✅ | 2026-11-05 | GSE319709_series_matrix.txt.gz (3.8K), GSE319709_RAW.tar (1.024G) | a8539b3d6a703944f9ad91580054b6d5 (matrix), d96bc741d0fecc2dd1577c9eae659a12 (RAW tar) | discovery; HBV vs MASH T cells. GZIP integrity verified. TAR contents verified (54 files: 18 samples × 3 files each in 10x format). |
| GSE238264 | ⬜ | | | | spatial Visium; responder/non-responder |
| GSE206325 | ⬜ | | | | scRNA+TCR; PD-1 blockade |
| GSE202069 | ⬜ | | | | bulk; anti-PD-1 response |
| TCGA-LIHC | ⬜ | | | | clinical + survival |
| GSE14520 / ICGC LIRI-JP | ⬜ | | | | external bulk validation |

Download script: `scripts/01_download_data.sh` (GSE319709). Run:
  bash scripts/01_download_data.sh

## Download details for GSE319709

- **Accession:** GSE319709
- **Title:** Single-cell transcriptomics reveals etiology-specific T-cell heterogeneity in hepatocellular carcinoma and implicates regulatory
- **Source:** https://ftp.ncbi.nlm.nih.gov/geo/series/GSE319nnn/GSE319709/
- **Series matrix URL:** https://ftp.ncbi.nlm.nih.gov/geo/series/GSE319nnn/GSE319709/matrix/GSE319709_series_matrix.txt.gz
- **RAW supplementary URL:** https://ftp.ncbi.nlm.nih.gov/geo/series/GSE319nnn/GSE319709/suppl/GSE319709_RAW.tar
- **Download date:** 2026-11-05
- **Files:**
  - `data/raw/GSE319709_series_matrix.txt.gz` — 3.8K — MD5: a8539b3d6a703944f9ad91580054b6d5 — GZIP integrity: ✅ valid
  - `data/raw/GSE319709_RAW.tar` — 1.024G — MD5: d96bc741d0fecc2dd1577c9eae659a12 — TAR contents: ✅ verified (54 files: barcodes.tsv.gz, features.tsv.gz, matrix.mtx.gz per sample)
- **Checksums file:** `data/GSE319709_checksums.md5`
- **Verification status:** ✅ All checks passed

## GSE319709 sample breakdown (from GEO overall design)

- HBV-HCC: PBMC n=4, Tumor n=3, Peritumour n=3
- MASH-HCC: PBMC n=4, Tumor n=2, Peritumour n=2
- Total 18 samples; CD45+ immune cells only; 10x platform (GPL24676); PRJNA1418916
-> Few tumour samples (n=3 HBV, n=2 MASH) => hypothesis-generating only.
