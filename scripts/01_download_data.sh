#!/usr/bin/env bash
# =============================================================================
# scripts/01_download_data.sh
# Download discovery dataset GSE319709 (HBV-HCC vs MASH-HCC scRNA-seq)
# =============================================================================
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RAW_DIR="$PROJECT_ROOT/data/raw"
LOG_DIR="$PROJECT_ROOT/logs"

mkdir -p "$RAW_DIR" "$LOG_DIR"

GEO_MATRIX_URL="https://ftp.ncbi.nlm.nih.gov/geo/series/GSE319nnn/GSE319709/matrix/GSE319709_series_matrix.txt.gz"
GEO_RAW_URL="https://ftp.ncbi.nlm.nih.gov/geo/series/GSE319nnn/GSE319709/suppl/GSE319709_RAW.tar"

LOG="$LOG_DIR/download_GSE319709_$(date +%Y%m%d_%H%M%S).log"

echo "============================================================" | tee -a "$LOG"
echo "Downloading GSE319709 (discovery scRNA-seq: HBV-HCC vs MASH-HCC)" | tee -a "$LOG"
echo "Started: $(date)" | tee -a "$LOG"
echo "============================================================" | tee -a "$LOG"

# 1) Series matrix (processed expression - quick to fetch)
echo "[1/2] Fetching series matrix..." | tee -a "$LOG"
curl -L --fail --retry 3 --connect-timeout 30 --max-time 300 \
  -o "$RAW_DIR/GSE319709_series_matrix.txt.gz" \
  "$GEO_MATRIX_URL" 2>&1 | tee -a "$LOG"
echo "  saved: $RAW_DIR/GSE319709_series_matrix.txt.gz" | tee -a "$LOG"

# 2) RAW tar (FASTQ / count files - larger)
echo "[2/2] Fetching RAW supplementary tar..." | tee -a "$LOG"
curl -L --fail --retry 3 --connect-timeout 30 --max-time 600 \
  -o "$RAW_DIR/GSE319709_RAW.tar" \
  "$GEO_RAW_URL" 2>&1 | tee -a "$LOG"
echo "  saved: $RAW_DIR/GSE319709_RAW.tar" | tee -a "$LOG"

echo "============================================================" | tee -a "$LOG"
echo "Finished: $(date)" | tee -a "$LOG"
echo "Files:" | tee -a "$LOG"
ls -lh "$RAW_DIR" | tee -a "$LOG"
