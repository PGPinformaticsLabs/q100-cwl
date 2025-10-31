cwlVersion: v1.2
class: Workflow
label: "Flye single-input genome assembly workflow"
doc: "Runs Flye using one long-read FASTQ file"

inputs:
  read_type:
    type:
      type: enum
      symbols:
        - --nano-raw
        - --nano-hq
        - --pacbio-raw
        - --pacbio-hifi
    doc: "Flye read type"
  reads:
    type: File
    format: http://edamontology.org/format_1930
  out_dir:
    type: string
  genome_size:
    type: string?
  threads:
    type: int?

outputs:
  assembled_genome:
    type: File
    outputSource: run_flye/assembly

  flye_log:
    type: File
    outputSource: run_flye/log

steps:
  run_flye:
    run: ../tools/flye.cwl
    in:
      read_type: read_type
      reads: reads
      out_dir: out_dir
      genome_size: genome_size
      threads: threads
    out: [assembly, log]