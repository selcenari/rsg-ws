# Rocker tabanlı RStudio imajı
FROM rocker/rstudio:4.3.2

# Sistem güncellemesi ve temel paketler
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    libxml2-dev libcurl4-openssl-dev libssl-dev

# CRAN paketleri
RUN R -e "install.packages(c('tidyverse','data.table','ggplot2'), repos='https://cloud.r-project.org')"

# Bioconductor paketleri
RUN R -e "if(!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager', repos='https://cloud.r-project.org'); BiocManager::install(c('DESeq2','clusterProfiler','org.Hs.eg.db','msigdbr','fgsea','enrichplot'), ask=FALSE, update=FALSE)"
