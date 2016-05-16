#!/usr/bin/env nextflow

params.base_dir="$baseDir/data/prestin_SLC26A5.35eutheria.original.msa"
params.out_dir="."

params.rand_value=9
params.tag_name="PRESTIN"


file_names=Channel.fromPath(params.base_dir)

process get_raxml_tree{
  publishDir params.out_dir, mode: "copy"

  input:
      set file(seq_file) from file_names
  output:
      file "RAxML_bestTree*"
  
  """
      raxmlHPC -T $task.cpus -f d -j -m PROTGAMMALG -s $seq_file -n $params.tag_name -p $params.rand_value
  """

}
