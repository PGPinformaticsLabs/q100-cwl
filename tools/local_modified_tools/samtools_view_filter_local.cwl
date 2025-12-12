#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InlineJavascriptRequirement: {}
  
hints:
  ResourceRequirement:
    coresMin: 4
    ramMin: 8000
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.14--hb421002_0
  SoftwareRequirement:
    packages:
      samtools:
        specs: [ https://identifiers.org/biotools/samtools ]
        version: [ "1.14" ]

doc: Extract a specific region from a BAM file and output as BAM #not SAM

baseCommand: ["samtools", "view"]

arguments:
  - valueFrom: "-b"
    position: 1
    # output BAM format, not SAM/text
  - valueFrom: "-h"
    position: 2
    # include header for including sequences and lengths
  - valueFrom: $(inputs.output_bam_name)
    prefix: "-o"
    position: 3
    # output file name
#removed quality filters to keep and extract all reads from region

inputs:
  bam:
    doc: Input BAM file
    type: File
    secondaryFiles:
      - .bai  #allows for faster finding of regions in .bam file
    inputBinding:
      position: 10
      
  region:
    doc: "Region to extract (format: chr:start-end)" 
    type: string
    inputBinding:
      position: 11
      
  output_bam_name:
    doc: Name for output BAM file
    type: string
    default: output.bam

outputs:
  bam_region:
    type: File
    outputBinding:
      glob: $(inputs.output_bam_name)
  