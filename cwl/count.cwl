---
  hints: 
    - 
      dockerPull: "4dndcic/4dn-repliseq:v16.1"
      class: "DockerRequirement"
  arguments: []
  class: "CommandLineTool"
  inputs: 
    - 
      type: 
        - "File"
      id: "#input_bam"
      inputBinding: 
        position: 1
        separate: true
    - 
      type: 
        - "File"
      inputBinding: 
        separate: true
        position: 2
      id: "#chrsizes"
    - 
      type: 
        - "int"
      id: "#winsize"
      inputBinding: 
        position: 5
        separate: true
      default: 5000
    - 
      type: 
        - "string"
      id: "#outprefix"
      inputBinding: 
        position: 4
        separate: true
      default: "out"
    - 
      type: 
        - "string"
      id: "#outdir"
      inputBinding: 
        position: 3
        separate: true
      default: "."
  outputs: 
    - 
      type: 
        - "File"
      id: "#out_count_bg"
      secondaryFiles: 
        - "^^.bw"
        - ".px2"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.w' + inputs.winsize + '.bedGraph.gz')"
    - 
      type: 
        - "File"
      id: "#out_count_bg_rpkm"
      secondaryFiles: 
        - "^^.bw"
        - ".px2"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.w' + inputs.winsize + '.rpkm.bedGraph.gz')"
  baseCommand: 
    - "run-count.sh"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"
  cwlVersion: "v1.0"

