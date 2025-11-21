cwlVersion: v1.2
class: CommandLineTool
baseCommand: flye
label: "Flye genome assembler"
doc: |
  Flye is an assembler for long reads.

inputs:
  read_type:
    type:
      type: enum
      symbols: ["--nano-raw", "--nano-hq", "--pacbio-raw", "--pacbio-hifi"]
    label: "Read technology flag"
    doc: "Specifies the technology used for sequencing, passed as a flag to Flye"
    inputBinding:
      position: 0
      separate: true

  reads:
    type: File
    format: http://edamontology.org/format_1930
    label: "Long-read input file"
    doc: "A single long-read FASTQ/FASTA file (uncompressed)"
    inputBinding:
      position: 1
  out_dir:
    type: string
    label: "Output directory"
    doc: "Directory into which Flye writes results"
    inputBinding:
      position: 2
      prefix: "--out-dir"
      separate: true

  genome_size:
    type: string?
    label: "Estimated genome size"
    doc: "Estimated genome size in megabases (m)"
    inputBinding:
      position: 3
      prefix: "--genome-size"
      separate: true

  threads:
    type: int?
    label: "Number of threads"
    doc: "Number of CPU threads to use"
    inputBinding:
      position: 4
      prefix: "--threads"
      separate: true

outputs:
  assembly:
    type: File
    format: http://edamontology.org/format_1929
    label: "Assembled contigs"
    doc: "Assembled genome in FASTA format"
    outputBinding:
      glob: "$(inputs.out_dir)/assembly.fasta"

  log:
    type: File
    format: http://edamontology.org/format_2330
    label: "Flye log"
    doc: "Log file generated during the Flye assembly process"
    outputBinding:
      glob: "$(inputs.out_dir)/flye.log"