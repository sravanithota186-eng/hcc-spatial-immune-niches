# Project Proposal

**Etiology-Conditioned Spatial Immune Niches Associated with Immunotherapy Response in Hepatocellular Carcinoma**

An integrative single-cell + spatial transcriptomics study

**Student:** Thota Sravani, MSc Bioinformatics, REVA University  
**Type:** Internship / Dissertation project  
**Repository:** https://github.com/sravanithota186-eng/hcc-spatial-immune-niches  
**Status:** In progress — Week 1 (Foundations: literature, novelty audit, environment)  
**Last updated:** 2026-11-05

---

## 1. Project in one paragraph

Hepatocellular carcinoma (HCC) responds unevenly to immune-checkpoint therapy, and its etiology — hepatitis B virus (HBV) vs metabolic dysfunction-associated steatohepatitis (MASH) — may shape the tumour immune microenvironment. This project asks whether **HBV-HCC and MASH-HCC form distinct T-cell states and spatial immune niches**, and whether those differences relate to **response or resistance to immunotherapy**.

The framework links:

**etiology → T-cell state → cell–cell communication → spatial niche → treatment response**

with **discovery and validation kept strictly separate**. The contribution is an etiology-aware, spatially resolved, interpretable framework — not a black-box bulk prognostic signature.

---

## 2. Research question and hypotheses

**Central question:** Do HBV- and MASH-associated HCC form distinct immune-cell states and spatial immune niches, and are these associated with response/resistance to immune-checkpoint therapy?

| # | Hypothesis |
|---|---|
| H1 | HBV-HCC and MASH-HCC contain distinct T-cell functional states and suppressive programs. |
| H2 | These programs are organised into recurring multicellular spatial niches, not randomly distributed. |
| H3 | Some niches associate with activation/response; others with exclusion/dysfunction. |
| H4 | The same programs can be tested in independent immunotherapy-response datasets. |

---

## 3. Datasets (verified against NCBI GEO)

Raw data are **not** stored in this repo. See `data/README.md` for download instructions.

| Accession | Role | Data type | Linked paper | Main use |
|---|---|---|---|---|
| GSE319709 | Discovery | scRNA-seq (CD45+ immune cells) | Yan et al., 2026 ("etiology-specific T-cell heterogeneity in HCC") | HBV-HCC vs MASH-HCC; tumour, peritumour, PBMC |
| GSE238264 | Spatial validation | 10x Visium | Zhang S et al. Genome Med 2023;15:72 | Cabozantinib + nivolumab; responder vs non-responder |
| GSE206325 | Immune-response validation | scRNA-seq + TCR | Magen A et al. Nat Med 2023;29:1389 | PD-1 blockade; mregDC / Tfh-like biology |
| GSE202069 | Response validation | Bulk RNA-seq | Li B et al. (anti-PD-1 HCC) | Anti-PD-1-treated HCC with response info |
| TCGA-LIHC | Clinical validation | RNA-seq + clinical | TCGA consortium | Survival, molecular & clinical associations |
| GSE14520 / ICGC LIRI-JP | External validation | Bulk | ICGC LIRI-JP | Additional molecular validation |

**GSE319709 sample breakdown (GEO overall design):**
- HBV-HCC: PBMC n=4, Tumour n=3, Peritumour n=3
- MASH-HCC: PBMC n=4, Tumour n=2, Peritumour n=2
- Total 18 samples; 10x platform (GPL24676); PRJNA1418916

> **Important:** Only 3 HBV tumours and 2 MASH tumours → treated as **hypothesis-generating**, patient = biological replicate (pseudobulk / mixed models), not cell-level tests.

---

## 4. Workflow (what you need to do, phase by phase)

### Phase 1 — Foundations (Weeks 1–3)
- [ ] Literature review & novelty audit (`docs/novelty_audit.md`)
- [ ] Confirm accession → paper mapping for all GEO datasets (done — see Section 3)
- [ ] Set up reproducible environment (conda, see Section 8)
- [ ] Download GSE319709 (`scripts/01_download_data.sh`)

### Phase 2 — Single-cell atlas (Weeks 4–7)
GSE319709: QC → doublet removal → integration → annotation → CD8/CD4/Treg sub-clustering.
- Patient = replicate (pseudobulk for group tests).
- Output: annotated immune-cell atlas; cell-type proportions per patient/tissue/etiology.

### Phase 3 — T-cell states (Weeks 8–10)
Sub-cluster CD8/CD4/Treg. Score programs:
- cytotoxic, exhausted, tissue-resident, interferon-responsive, proliferating (UCell/AUCell).
- HBV vs MASH comparisons at **patient level** (effect sizes + CIs, multiple-testing correction).

### Phase 4 — Cell–cell communication (Weeks 11–12)
Macrophage/DC/stromal/endothelial ↔ T-cell axes; compare HBV vs MASH.
- Tools: CellChat / NicheNet / LIANA.
- Output: candidate ligand–receptor axes (hypotheses, not validated targets).

### Phase 5 — Spatial niches (Weeks 13–16)
GSE238264: deconvolution (RCTD / cell2location) → map cell states onto Visium spots → discover recurring neighbourhoods → compare responders vs non-responders.
- Output: spatial niche map; response-associated vs resistance-associated niches.

### Phase 6 — Validation (Weeks 17–19)
Test the same programs in independent cohorts:
- GSE206325 (scRNA+TCR, PD-1 blockade)
- GSE202069 (bulk, anti-PD-1 response)
- TCGA-LIHC (survival, clinical)
- GSE14520 / ICGC LIRI-JP (external bulk)

### Phase 7 — Integration & writing (Weeks 20+)
- E-SHIELD concept (only if supported by reproducible, independently validated biology).
- Figures 1–7, dissertation, final report.

> **Timeline is a draft** — adjust to your university deadlines and update as the project evolves.

---

## 5. Statistical & reproducibility principles

- **Patients, not cells/spots, are the biological replicates** (pseudobulk or mixed models).
- Multiple-testing control; report effect sizes with confidence intervals.
- **Discovery and validation cohorts kept separate; no tuning on validation data.**
- Versioned scripts, recorded package versions, complete computational log.
- Computationally prioritised molecules are **hypotheses, not validated targets**.

---

## 6. Planned figures

1. Study design and dataset integration
2. Single-cell atlas and composition
3. HBV vs MASH T-cell states
4. Communication networks and candidate ligand–receptor axes
5. Spatial niches and responder/non-responder differences
6. Independent validation (scRNA-seq, bulk, clinical)
7. Integrative model and candidate therapeutic hypotheses

---

## 7. Repository structure

```
.
├── README.md                 # project overview (updated weekly)
├── PROJECT_PROPOSAL.md       # this file (internship proposal)
├── docs/
│   └── novelty_audit.md      # search log: already done / partial / open
├── references/
│   ├── references.md         # annotated bibliography + reading status
│   ├── references.bib        # BibTeX
│   └── papers/               # open-access PDFs only
├── logs/weekly/              # one log per week (TEMPLATE.md to copy)
├── data/                     # accessions & download notes (raw data git-ignored)
│   └── README.md
├── scripts/                  # analysis scripts (01_download_data.sh, ...)
├── notebooks/                # exploratory notebooks / reports
├── results/figures/          # figures
└── environment/              # environment.yml (conda)
```

---

## 8. Getting started (do this now)

### Step 1 — Set up the conda environment
```bash
cd /home/sravani/hcc-spatial-immune-niches
conda env create -f environment/environment.yml
conda activate hcc-spatial
```

### Step 2 — Download the discovery dataset
```bash
bash scripts/01_download_data.sh
```
This fetches GSE319709 (series matrix + raw tar) into `data/raw/` (git-ignored).

### Step 3 — Record the download
Update `data/README.md` with the download date, file list, and checksums.

### Step 4 — Weekly routine
1. Copy `logs/weekly/TEMPLATE.md` → `logs/weekly/YYYY-Www.md` and fill it in.
2. Add new papers to `references/references.md` and `references.bib`.
3. Update sections of `README.md` (where you are / plan / weekly log).
4. `git add . && git commit -m "Week N update" && git push`

---

## 9. Key references (annotated)

Full list: `references/references.md` · BibTeX: `references/references.bib`

| # | Reference | Why it matters |
|---|---|---|
| 1 | Zhang S et al. Genome Med 2023;15:72. doi:10.1186/s13073-023-01218-y | Source of GSE238264 (spatial validation); ask a new question, don't reproduce |
| 2 | Magen A et al. Nat Med 2023;29:1389–1399. doi:10.1038/s41591-023-02345-0 | mregDC / CXCL13+ Th niches; PD-1 blockade response (GSE206325 source) |
| 3 | Pfister D et al. Nature 2021;592:450–456 | Rationale for etiology-stratified immunotherapy analysis |
| 4 | Wu K et al. Gut 2025 (online Dec 2025). doi:10.1136/gutjnl-2024-334562 | MASH-HCC–specific CD8 dysfunction (PCK1–12-HETE) |
| 5 | Liang Y et al. Oncogene 2025. doi:10.1038/s41388-025-03330-2 | CD177+ Tregs, immunosuppression, resistance |
| 6 | Cappuyns S et al. Nat Commun 2023;14. doi:10.1038/s41467-023-43381-1 | Response-associated CD8/macrophage states |

> ⚠️ All DOIs, author lists and novelty status must be re-verified before submission.

---

## 10. Citation / contact

Thota Sravani · MSc Bioinformatics, REVA University  
https://github.com/sravanithota186-eng/hcc-spatial-immune-niches
