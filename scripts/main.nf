process TRIMMING {

    stageInMode 'copy'

    input:
    path read1
    path read2

    output:
    path "read1_paired.fastq"
    path "read2_paired.fastq"

    publishDir "../results/trimmed", mode: 'copy'

    script:
    """
    trimmomatic PE -threads 2 \
    $read1 $read2 \
    read1_paired.fastq read1_unpaired.fastq \
    read2_paired.fastq read2_unpaired.fastq \
    SLIDINGWINDOW:4:20 MINLEN:36
    """
}
