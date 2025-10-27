# Önceden paketleri yüklenmiş Bioconductor Docker image kullan
FROM bioconductor/bioconductor_docker:RELEASE_3_21

# Küçük CRAN paketlerini ekle
RUN R -e "install.packages(c('tidyverse','data.table'), repos='https://cloud.r-project.org')"

