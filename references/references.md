# Annotated References

Reading status: ⬜ not started · 🔄 reading · ✅ read & noted
Verification: items marked **verify** need DOI/author/PMID confirmation before submission.

## A. Core papers (tied directly to project datasets / question)

| # | Status | Reference | Link | Notes for my project |
|---|---|---|---|---|
| 1 | ⬜ | Zhang S, Yuan L, Danilova L, et al. Spatial transcriptomics analysis of neoadjuvant cabozantinib and nivolumab in advanced hepatocellular carcinoma identifies independent mechanisms of resistance and recurrence. *Genome Med.* 2023;15:72. | doi:10.1186/s13073-023-01218-y · PMID 37723590 · open access (CC BY 4.0) | Origin of GSE238264 (15 patients, 5 pathologic responders). Must ask a *new* question, not reproduce this. |
| 2 | ⬜ | Magen A, Hamon P, Fiaschi N, et al. Intratumoral dendritic cell–CD4+ T helper cell niches enable CD8+ T cell differentiation following PD-1 blockade in hepatocellular carcinoma. *Nat Med.* 2023;29(6):1389–1399. | doi:10.1038/s41591-023-02345-0 · PMC11027932 · PMID 37322116 (from proposal slides — **verify**) | mregDC + CXCL13+ Th niches around progenitor CD8 T cells; likely source for GSE206325. Confirm accession mapping. |
| 3 | ⬜ | Ho WJ, Zhu Q, Durham J, et al. Neoadjuvant cabozantinib and nivolumab converts locally advanced HCC into resectable disease with enhanced antitumor immunity. *Nat Cancer.* 2021. | PMID 34796337 | Clinical trial paper behind the cabo/nivo cohort. |

## B. Etiology (HBV vs MASH/NASH) and immunotherapy

| # | Status | Reference | Link | Notes |
|---|---|---|---|---|
| 4 | ⬜ | Pfister D, Núñez NG, Pinyol R, et al. NASH limits anti-tumour surveillance in immunotherapy-treated HCC. *Nature.* 2021;592:450–456. | **verify** DOI | Key rationale: stratify HCC immunotherapy analysis by etiology; NASH-HCC may respond less. |
| 5 | ⬜ | Wu K, Li L, Liu Y, Wang K, et al. PCK1 deficiency promotes MASH-HCC progression by 12-HETE-induced CD8+ T cell dysfunction. *Gut.* 2025 (online 17 Dec 2025). | PMID 41407525 · doi:10.1136/gutjnl-2024-334562 (**verify**) | MASH-HCC–specific CD8 dysfunction (PCK1–12-HETE–p38). Mostly mouse mechanism → hypothesis for my MASH-HCC T-cell states. |

## C. Resistance niches / response-associated cell states in HCC

| # | Status | Reference | Link | Notes |
|---|---|---|---|---|
| 6 | ⬜ | Liang Y, Qiao L, Qian Q, et al. Integrated single-cell and spatial transcriptomic profiling reveals that CD177+ Tregs enhance immunosuppression through apoptosis and resistance to immunotherapy in HCC. *Oncogene.* 2025. | doi:10.1038/s41388-025-03330-2 | Treg-centred resistance; closest to my Treg sub-analysis → **check for overlap in novelty audit**. |
| 7 | ⬜ | Cappuyns S, Philips G, Vandecaveye V, et al. PD-1− CD45RA+ effector-memory CD8 T cells and CXCL10+ macrophages are associated with response to atezolizumab plus bevacizumab in advanced HCC. *Nat Commun.* 2023;14. | doi:10.1038/s41467-023-43381-1 | Response-associated CD8/macrophage axis in a different regimen. |
| 8 | ⬜ | Single cell analyses reveal the PD-1 blockade response-related immune features in HCC. *Theranostics.* 2024;14(9):3526–3547. | doi:10.7150/thno.95971 · PMID 38948071 (authors: **add**) | TREM2+ macrophages in non-responders, SPP1+ macrophage/CAF barrier concept. |
| 9 | ⬜ | PD-1+CXCR6+ CD8 T cells and CXCL16+ macrophages in HCC immune resistance (cited in proposal slides). | **Not yet located — find exact paper** | Known axis; must not be presented as the sole novelty. |

## D. Background / context

| # | Status | Reference | Link | Notes |
|---|---|---|---|---|
| 10 | ⬜ | Bai Y, Chen D, Cheng C, et al. Immunosuppressive landscape in hepatocellular carcinoma revealed by single-cell sequencing. *Front Immunol.* 2022;13:950536. | doi:10.3389/fimmu.2022.950536 | Example scRNA-seq HCC workflow (SingleR, CellPhoneDB). |

## E. Methods papers to add (TODO)

Add the original papers for: Seurat, scDblFinder, UCell/AUCell, CellChat, NicheNet, LIANA, RCTD, cell2location, Squidpy, DESeq2/edgeR/limma, and pseudobulk/mixed-model best practice (e.g. Squair et al. 2021 on pseudobulk).

## F. Datasets

| Accession | Linked paper (confirm in Week 1–2) |
|---|---|
| GSE319709 | **to confirm** |
| GSE238264 | Zhang et al. 2023 (Genome Med) |
| GSE206325 | **confirm** (likely Magen et al. 2023) |
| GSE202069 | **to confirm** |
| TCGA-LIHC | TCGA consortium |
| GSE14520 / ICGC LIRI-JP | **to confirm** |
