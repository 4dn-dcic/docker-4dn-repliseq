---
  outputs: 
    - 
      id: "#out_reference_bg"
      type: 
        - "File"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.inorm.bg')"
  baseCommand: 
    - "make_referencebg"
  hints: 
    - 
      dockerPull: "4dndcic/4dn-repliseq:v16.1"
      class: "DockerRequirement"
  cwlVersion: "v1.0"
  class: "CommandLineTool"
  arguments: []
  inputs: 
    - 
      id: "#outdir"
      inputBinding: 
        position: 1
        separate: true
      default: "."
      type: 
        - "string"
    - 
      id: "#outprefix"
      inputBinding: 
        position: 2
        separate: true
      default: "out"
      type: 
        - "string"
    - 
      id: "#input_bgs"
      inputBinding: 
        itemSeparator: " "
        position: 3
        separate: true
      type: 
        - 
          items: "File"
          type: "array"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"

