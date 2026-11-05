# Etiology-Conditioned Spatial Immune Niches Associated with Immunotherapy Response in Hepatocellular Carcinoma

> An integrative single-cell + spatial transcriptomics study
> **MSc Bioinformatics Dissertation** · Thota Sravani · REVA University

![status](https://img.shields.io/badge/status-in%20progress-orange)
![stage](https://img.shields.io/badge/stage-data%20downloaded%20%26%20environment%20ready-blue)
![updates](https://img.shields.io/badge/updates-weekly-green)

---

## 1. Research Overview

Hepatocellular carcinoma (HCC) responds unevenly to immune-checkpoint therapy, and its etiology — hepatitis B virus (HBV) vs metabolic dysfunction-associated steatohepatitis (MASH) — may shape the tumour immune microenvironment. This project asks whether **HBV-HCC and MASH-HCC form distinct T-cell states and spatial immune niches**, and whether those differences relate to **response or resistance to immunotherapy**.

The framework links:

**etiology → T-cell state → cell–cell communication → spatial niche → treatment response**

with **discovery and validation kept strictly separate**. The contribution is an etiology-aware, spatially resolved, interpretable framework — not a black-box bulk prognostic signature.

---

## 2. Research Question and Hypotheses

**Central question:** Do HBV- and MASH-associated HCC form distinct immune-cell states and spatial immune niches, and are these associated with response/resistance to immune-checkpoint therapy?

| # | Hypothesis |
|---|---|
| H1 | HBV-HCC and MASH-HCC contain distinct T-cell functional states and suppressive programs. |
| H2 | These programs are organised into recurring multicellular spatial niches, not randomly distributed. |
| H3 | Some niches associate with activation/response; others with exclusion/dysfunction. |
| H4 | The same programs can be tested in independent immunotherapy-response datasets. |

---

## 3. Datasets

Raw data are **not** stored in this repo (large files, git-ignored). See [`data/README.md`](data/README.md) for download instructions, checksums, and verification details.

| Accession | Role | Data type | Main use | Status |
|---|---|---|---|---|
| GSE319709 | Discovery | scRNA-seq (CD45+ immune cells) | HBV-HCC vs MASH-HCC; tumour, peritumour, PBMC | ✅ Downloaded & verified |
| GSE238264 | Spatial validation | 10x Visium | Cabozantinib + nivolumab; responder vs non-responder | ⬜ Pending |
| GSE206325 | Immune-response validation | scRNA-seq + TCR | PD-1 blockade; mregDC / Tfh-like biology | ⬜ Pending |
| GSE202069 | Response validation | Bulk RNA-seq | Anti-PD-1-treated HCC with response info | ⬜ Pending |
| TCGA-LIHC | Clinical validation | RNA-seq + clinical | Survival, molecular and clinical associations | ⬜ Pending |
| GSE14520 / ICGC LIRI-JP | External validation | Bulk | Additional molecular validation | ⬜ Pending |

**GSE319709 sample breakdown** (from GEO overall design):
- HBV-HCC: PBMC n=4, Tumour n=3, Peritumour n=3
- MASH-HCC: PBMC n=4, Tumour n=2, Peritumour n=2
- Total 18 samples; CD45+ immune cells only; 10x platform (GPL24676)
- Few tumour samples → **hypothesis-generating only**

---

## 4. Repository Structure

```
.
├── README.md                        # this file (project overview)
├── PROJECT_PROPOSAL.md              # internship/dissertation proposal
├── .gitignore                       # git-ignored: raw data, R/conda envs, checkpoints
├── data/
│   ├── .gitkeep
│   ├── README.md                    # dataset accessions, download logs, checksums
│   ├── GSE319709_checksums.md5      # MD5 checksums for downloaded GSE319709 files
│   └── raw/                         # git-ignored: GSE319709_RAW.tar, series matrix (downloaded)
├── docs/
│   ├── .gitkeep
│   └── novelty_audit.md             # search log: prior work vs. this project's gap
├── environment/
│   ├── .gitkeep
│   └── environment.yml              # conda environment specification (Python 3.11)
├── logs/
│   ├── download_GSE319709_20261105_152039.log
│   └── weekly/
│       ├── TEMPLATE.md              # weekly log template
│       └── 2026-W42.md              # Week 1 log
├── notebooks/
│   └── .gitkeep                     # exploratory notebooks / reports (empty)
├── references/
│   ├── references.md                # annotated bibliography + reading status
│   ├── references.bib               # BibTeX
│   └── papers/
│       ├── .gitkeep
│       └── README.md                # open-access PDFs only
├── results/
│   └── figures/
│       └── .gitkeep                 # figures (empty)
└── scripts/
    ├── .gitkeep
    └── 01_download_data.sh          # GSE319709 download script
```

**Notes:**
- `data/raw/` is git-ignored — raw datasets are excluded from GitHub because of their size (GSE319709_RAW.tar is ~1 GB).
- `results/figures/`, `notebooks/` are empty — no analyses completed yet.
- Downloaded files live locally in `data/raw/` and are tracked only by checksums in `data/GSE319709_checksums.md5`.

---

## 5. Environment Setup

A reproducible conda environment is specified in [`environment/environment.yml`](environment/environment.yml) (Python 3.11).

### Create and activate the environment

```bash
cd /home/sravani/hcc-spatial-immune-niches
conda env create -f environment/environment.yml
conda activate hcc-spatial
```

### Installed packages (verified)

- **Core:** numpy, pandas, scipy, scikit-learn, matplotlib, seaborn, jupyter
- **Single-cell:** scanpy, anndata, loompy, umap-learn, leidenalg
- **Spatial:** squidpy, cell2location
- **Utilities:** gseapy, requests, tqdm

### Verification (completed 2026-11-05)

```bash
conda activate hcc-spatial
python --version          # Python 3.11.18
python -c "import scanpy, anndata, squidpy, pandas, numpy, scipy; print('Core imports successful')"  # OK
```

**Note:** `cell2location` has a known import incompatibility with the installed `pyro-ppl` version (`ImportError: cannot import name 'deep_getattr'`). This is non-critical — cell2location is only needed in Phase 5 (spatial deconvolution). Package versions were not changed without explicit justification.

---

## 6. GSE319709 Download and Verification (Completed)

The discovery dataset GSE319709 (HBV-HCC vs MASH-HCC scRNA-seq) has been downloaded and verified.

**Download script:** [`scripts/01_download_data.sh`](scripts/01_download_data.sh)

**Files downloaded (2026-11-05):**

| File | Size | MD5 checksum | Integrity check |
|---|---|---|---|
| `data/raw/GSE319709_series_matrix.txt.gz` | 3.8K | `a8539b3d6a703944f9ad91580054b6d5` | ✅ gzip -t passed |
| `data/raw/GSE319709_RAW.tar` | 1.024G | `d96bc741d0fecc2dd1577c9eae659a12` | ✅ tar -tf passed (54 files) |

**Verification command:**

```bash
md5sum -c data/GSE319709_checksums.md5
```

Both files passed integrity verification. The TAR archive contains 54 files (18 samples × 3 files each in 10x format: barcodes.tsv.gz, features.tsv.gz, matrix.mtx.gz). Raw data files are **not committed** to GitHub (git-ignored); only checksums and the download log are recorded.

---

## 7. Current Project Progress

**Completed (Foundations — Phase 1):**
- [x] GitHub repository created and structured
- [x] Project proposal prepared (`PROJECT_PROPOSAL.md`)
- [x] Initial reference list compiled (`references/references.md`, `references/references.bib`)
- [x] Novelty audit started (`docs/novelty_audit.md`)
- [x] All six accession → paper mappings confirmed against NCBI GEO
- [x] Reproducible conda environment created (`environment/environment.yml`)
- [x] GSE319709 downloaded and verified (checksums recorded)

**In progress / planned:**
- [ ] Complete novelty audit before coding freeze
- [ ] Read key papers (Zhang 2023, Magen 2023, Pfister 2021, Wu 2025, Liang 2025, Cappuyns 2023)
- [ ] Phase 2: Single-cell atlas (GSE319709 QC → integration → annotation)

**Not started:**
- Phase 3: T-cell states (sub-clustering, program scoring, HBV vs MASH tests)
- Phase 4: Cell–cell communication (CellChat / NicheNet / LIANA)
- Phase 5: Spatial niches (GSE238264 deconvolution, niche discovery)
- Phase 6: Validation (GSE206325, GSE202069, TCGA-LIHC, GSE14520 / ICGC)
- Phase 7: Integration & writing (figures 1–7, dissertation)

---

## 8. Phase 2 Workflow — Single-Cell Atlas (Planned)

The next phase will process GSE319709 using scanpy (Python 3.11, `hcc-spatial` environment):

1. **QC** — filter cells by gene count, UMI count, mitochondrial percentage; filter genes by minimum cell detection
2. **Normalization** — library-size normalization + log1p transformation
3. **Integration** — correct for batch effects across patients/tissues (HBV vs MASH, tumour vs peritumour vs PBMC)
4. **Clustering** — PCA → UMAP → Leiden clustering
5. **Cell annotation** — assign major cell types (T, B, NK, myeloid, etc.) using canonical markers; sub-cluster CD8/CD4/Treg

**Key principle:** Patient, not cell, is the biological replicate. Group comparisons (HBV vs MASH) will use pseudobulk or mixed models at the patient level.

---

## 9. Statistical & Reproducibility Principles

- **Patients, not cells/spots, are the biological replicates** (pseudobulk or mixed models).
- Multiple-testing control; report effect sizes with confidence intervals.
- **Discovery and validation cohorts kept separate; no tuning on validation data.**
- Versioned scripts, recorded package versions, complete computational log.
- Computationally prioritised molecules are hypotheses, not validated targets.

---

## 10. Planned Figures

1. Study design and dataset integration
2. Single-cell atlas and composition
3. HBV vs MASH T-cell states
4. Communication networks and candidate ligand–receptor axes
5. Spatial niches and responder/non-responder differences
6. Independent validation (scRNA-seq, bulk, clinical)
7. Integrative model and candidate therapeutic hypotheses

---

## 11. Key References

Full annotated list with reading status: [`references/references.md`](references/references.md) · BibTeX: [`references/references.bib`](references/references.bib)

| # | Reference | Why it matters |
|---|---|---|
| 1 | Zhang S, et al. *Spatial transcriptomics analysis of neoadjuvant cabozantinib and nivolumab in advanced HCC identifies independent mechanisms of resistance and recurrence.* **Genome Med** 2023;15:72. doi:10.1186/s13073-023-01218-y | Source of GSE238264 (spatial validation); this project asks a different question |
| 2 | Magen A, et al. *Intratumoral dendritic cell–CD4+ T helper cell niches enable CD8+ T cell differentiation following PD-1 blockade in HCC.* **Nat Med** 2023;29:1389–1399. doi:10.1038/s41591-023-02345-0 | mregDC / CXCL13+ Th niches; PD-1 blockade response biology (GSE206325 source) |
| 3 | Pfister D, et al. *NASH limits anti-tumour surveillance in immunotherapy-treated HCC.* **Nature** 2021;592:450–456 | Rationale for etiology-stratified immunotherapy analysis |
| 4 | Wu K, et al. *PCK1 deficiency promotes MASH-HCC progression by 12-HETE-induced CD8+ T cell dysfunction.* **Gut** 2025 (online Dec 2025). doi:10.1136/gutjnl-2024-334562 | MASH-HCC–specific CD8 dysfunction mechanism |
| 5 | Liang Y, et al. *Integrated single-cell and spatial transcriptomic profiling reveals that CD177+ Tregs enhance immunosuppression … in HCC.* **Oncogene** 2025. doi:10.1038/s41388-025-03330-2 | Treg-mediated resistance, single-cell + spatial |
| 6 | Cappuyns S, et al. *PD-1− CD45RA+ effector-memory CD8 T cells and CXCL10+ macrophages are associated with response to atezolizumab plus bevacizumab in advanced HCC.* **Nat Commun** 2023;14. doi:10.1038/s41467-023-43381-1 | Response-associated T-cell/macrophage states |

> ⚠️ All DOIs, author lists and novelty status must be re-verified before submission.

---

## 12. Citation / Contact

Thota Sravani · MSc Bioinformatics, REVA University  
https://github.com/sravanithota186-eng/hcc-spatial-immune-niches
