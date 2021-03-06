#!/usr/bin/env cwl-runner
cwlVersion: v1.0
label: QIIME2 - DADA2 denoiser
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: umigs/chiron-qiime2

inputs:
  input_seqs:
    inputBinding:
      prefix: --i-demultiplexed-seqs
    type: File
  trim_left:
    inputBinding:
      prefix: --p-trim-left
    type: int
    default: 0
  trim_right:
    inputBinding:
      prefix: --p-trim-right
    type: int
    default: 120
  rep_seqs:
    inputBinding:
      prefix: --o-representative-sequences
    type: string
    default: "rep-seqs.qza"
  table:
    inputBinding:
      prefix: --o-table
    type: string
    default: "table.qza"
outputs:
  out_rep_seqs:
    type: File
    outputBinding:
      glob: $(inputs.rep_seqs)
  out_table:
    type: File
    outputBinding:
      glob: $(inputs.table)

baseCommand: ["qiime", "dada2", "denoise-single"]
