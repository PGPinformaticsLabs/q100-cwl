cwlVersion: v1.2
class: CommandLineTool
label: "Index creator for minimap2"
doc: |
  Make a minimap2 index (.mmi) from a reference FASTA.
  We can write: minimap2 -d <output.mmi> <reference.fasta>

requirements:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/minimap2:2.28--h7132678_2

inputs:
  reference:
    type: File
    label: Input reference FASTA
    inputBinding:
      position: 2

  index_name:
    type: string? #optional string
    default: "reference.mmi"
    label: Output index filename
    inputBinding:
      position: 1

outputs:
  index:
    type: File
    outputBinding:
      glob: $(inputs.index_name)

baseCommand: [minimap2, -d]
