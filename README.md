# Etiology-Conditioned Spatial Immune Niches Associated with Immunotherapy Response in Hepatocellular Carcinoma

> An integrative single-cell + spatial transcriptomics study
> **MSc Bioinformatics Dissertation** · Thota Sravani · REVA University

![status](https://img.shields.io/badge/status-in%20progress-orange)
![stage](https://img.shields.io/badge/stage-literature%20%26%20novelty%20audit-blue)
![updates](https://img.shields.io/badge/updates-weekly-green)

---

## 1. Project in one paragraph

Hepatocellular carcinoma (HCC) responds unevenly to immune-checkpoint therapy, and its etiology (e.g. HBV vs metabolic/MASH) may shape the tumour immune microenvironment. This project asks whether **HBV-HCC and MASH-HCC form distinct T-cell states and spatial immune niches**, and whether those differences relate to **response or resistance to immunotherapy**. The framework links **etiology → T-cell state → cell–cell communication → spatial niche → treatment response**, with discovery and validation kept strictly separate.

## 2. Research question and hypotheses

**Central question:** Do HBV- and MASH-associated HCC form distinct immune-cell states and spatial immune niches, and are these associated with response/resistance to immune-checkpoint therapy?

1. HBV-HCC and MASH-HCC contain distinct T-cell functional states and suppressive programs.
2. These programs are organised into recurring multicellular spatial niches, not randomly distributed.
3. Some niches associate with activation/response; others with exclusion/dysfunction.
4. The same programs can be tested in independent immunotherapy-response datasets.

**Contribution:** an etiology-aware, spatially resolved, interpretable framework — not a black-box bulk prognostic signature.

## 3. Datasets

| Accession | Role | Data type | Main use |
|---|---|---|---|
| GSE319709 | Discovery | scRNA-seq | HBV-HCC vs MASH-HCC; tumour, peritumour, PBMC |
| GSE238264 | Spatial validation | 10x Visium | Cabozantinib + nivolumab; responder/non-responder |
| GSE206325 | Immune-response validation | scRNA-seq + TCR | PD-1 blockade; T-cell / mregDC / Tfh-like biology |
| GSE202069 | Response validation | Bulk RNA-seq | Anti-PD-1-treated HCC with response info |
| TCGA-LIHC | Clinical validation | RNA-seq + clinical | Survival, molecular and clinical associations |
| GSE14520 / ICGC LIRI-JP | External validation | Bulk | Additional molecular validation |

Raw data are **not** stored in this repo. See [`data/README.md`](data/README.md) for download instructions (to be added as datasets are retrieved).

## 4. Workflow (planned)

```
GSE319709 ──► QC / integration / annotation ──► T-cell states (CD8/CD4/Treg)
                                                       │
                                  HBV vs MASH (patient-level tests)
                                                       │
                                  Cell–cell communication (CellChat / NicheNet / LIANA)
                                                       │
GSE238264 ──► deconvolution (RCTD / cell2location) ──► spatial niches ──► responder vs non-responder
                                                       │
            Validation: GSE206325 · GSE202069 · TCGA-LIHC · GSE14520 / ICGC
```

**Modules**
1. **Single-cell atlas** – QC, doublet removal, integration, annotation, CD8/CD4/Treg sub-clustering; patient = replicate.
2. **T-cell states** – cytotoxic, exhausted, tissue-resident, interferon-responsive, proliferating programs (UCell/AUCell).
3. **Communication** – macrophage/DC/stromal/endothelial ↔ T-cell axes; compare HBV vs MASH.
4. **Spatial niches** – map cell states onto Visium spots; find recurring neighbourhoods; compare responders vs non-responders.
5. **E-SHIELD concept** *(working idea, not a predefined score)* – combine T-cell state, suppressive program, co-localisation, ligand–receptor signal and barrier signal **only after** reproducible biology is observed and independently validated.

## 5. Statistical & reproducibility principles

- Patients, not cells/spots, are the biological replicates (pseudobulk or mixed models).
- Multiple-testing control; report effect sizes with CIs.
- Discovery and validation cohorts kept separate; no tuning on validation data.
- Versioned scripts, recorded package versions, complete computational log.
- GSE319709 has few tumour samples → treated as **hypothesis-generating**.
- Computationally prioritised molecules are hypotheses, not validated targets.

## 6. Where I am now

**Current stage (Week 1, Oct 2026): Setup, literature collection and novelty audit.**

- [x] Project proposal / presentation prepared
- [x] GitHub repository created and structured
- [x] Initial reference list compiled ([`references/references.md`](references/references.md))
- [ ] Download and read the key papers (see reading status in the reference table)
- [ ] Complete the novelty audit ([`docs/novelty_audit.md`](docs/novelty_audit.md)) *before coding freeze*
- [ ] Confirm exact accession → paper mapping for all GEO datasets
- [ ] Set up reproducible environment (R / renv, conda)

## 7. What I plan to do next

| Phase | Planned work | Target |
|---|---|---|
| 1. Foundations | Literature review, novelty audit, environment setup, data access | Weeks 1–3 |
| 2. Single-cell atlas | GSE319709 QC → integration → annotation | Weeks 4–7 |
| 3. T-cell states | Sub-clustering, program scoring, HBV vs MASH tests | Weeks 8–10 |
| 4. Communication | CellChat / NicheNet / LIANA | Weeks 11–12 |
| 5. Spatial niches | GSE238264 deconvolution, niche discovery, response comparison | Weeks 13–16 |
| 6. Validation | GSE206325, GSE202069, TCGA-LIHC, GSE14520 / ICGC | Weeks 17–19 |
| 7. Integration & writing | E-SHIELD (if supported), figures 1–7, dissertation | Weeks 20+ |

*(Timeline is a draft; adjust to your university deadlines and update as the project evolves.)*

## 8. Planned figures

1. Study design and dataset integration
2. Single-cell atlas and composition
3. HBV vs MASH T-cell states
4. Communication networks and candidate ligand–receptor axes
5. Spatial niches and responder/non-responder differences
6. Independent validation (scRNA-seq, bulk, clinical)
7. Integrative model and candidate therapeutic hypotheses

## 9. Key references

Full annotated list with reading status: [`references/references.md`](references/references.md) · BibTeX: [`references/references.bib`](references/references.bib)

| # | Reference | Why it matters |
|---|---|---|
| 1 | Zhang S, et al. *Spatial transcriptomics analysis of neoadjuvant cabozantinib and nivolumab in advanced HCC identifies independent mechanisms of resistance and recurrence.* **Genome Med** 2023;15:72. doi:10.1186/s13073-023-01218-y | Source of the spatial validation dataset (GSE238264); my question must differ from theirs |
| 2 | Magen A, et al. *Intratumoral dendritic cell–CD4+ T helper cell niches enable CD8+ T cell differentiation following PD-1 blockade in HCC.* **Nat Med** 2023;29:1389–1399. doi:10.1038/s41591-023-02345-0 | mregDC / CXCL13+ Th niches; PD-1 blockade response biology |
| 3 | Pfister D, et al. *NASH limits anti-tumour surveillance in immunotherapy-treated HCC.* **Nature** 2021;592:450–456 | Rationale for etiology-stratified immunotherapy analysis |
| 4 | Wu K, et al. *PCK1 deficiency promotes MASH-HCC progression by 12-HETE-induced CD8+ T cell dysfunction.* **Gut** 2025 (online Dec 2025) | MASH-HCC–specific CD8 dysfunction mechanism |
| 5 | Liang Y, et al. *Integrated single-cell and spatial transcriptomic profiling reveals that CD177+ Tregs enhance immunosuppression … in HCC.* **Oncogene** 2025. doi:10.1038/s41388-025-03330-2 | Treg-mediated resistance, single-cell + spatial |
| 6 | Cappuyns S, et al. *PD-1− CD45RA+ effector-memory CD8 T cells and CXCL10+ macrophages are associated with response to atezolizumab plus bevacizumab in advanced HCC.* **Nat Commun** 2023;14. doi:10.1038/s41467-023-43381-1 | Response-associated T-cell/macrophage states |

> ⚠️ All DOIs, author lists and novelty status must be re-verified before submission.

## 10. Repository structure

```
.
├── README.md                 # this file (updated weekly)
├── docs/
│   └── novelty_audit.md      # search log: already done / partial / open
├── references/
│   ├── references.md         # annotated bibliography + reading status
│   ├── references.bib        # BibTeX
│   └── papers/               # open-access PDFs only (see its README)
├── logs/weekly/              # one log per week (TEMPLATE.md to copy)
├── data/                     # accessions & download notes (raw data git-ignored)
├── scripts/                  # analysis scripts
├── notebooks/                # exploratory notebooks / reports
├── results/figures/          # figures
└── environment/              # renv.lock / environment.yml
```

## 11. Weekly progress log

| Week | Dates | Summary |
|---|---|---|
| 1 | 12–18 Oct 2026 | [Setup, reference collection, novelty audit started](logs/weekly/2026-W42.md) |

## 12. Weekly update routine

1. Copy `logs/weekly/TEMPLATE.md` → `logs/weekly/YYYY-Www.md` and fill it in.
2. Add new papers to `references/references.md` and `references.bib`.
3. Update sections 6, 7 and 11 of this README.
4. `git add . && git commit -m "Week N update" && git push`

## 13. Citation / contact

Thota Sravani · MSc Bioinformatics, REVA University
