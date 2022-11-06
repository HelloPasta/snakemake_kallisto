# rule for generating a kallisto index from a fasta file 
# uses the kallisto index wrappper:
# https://snakemake-wrappers.readthedocs.io/en/stable/wrappers/kallisto/index.html
# this is a wrapper based rule so snakemake needs to be run with the param:
# snakemake --use-conda

# will run the line:
# shell(
#    "kallisto index "  # Tool
#    "{extra} "  # Optional parameters
#    "--index={snakemake.output.index} "  # Output file
#    "{fasta} "  # Input FASTA files
#    "{log}"  # Logging
#)



rule kallisto_index:
    input:
        fasta= config["fasta"]
    output:
        index = expand(
            "{out}/{idx}.idx", 
            idx = config["idx_name"], 
            out = config["output_dir"])
    params:
        extra=""  # optional parameters
    threads: 1
    wrapper:
        "v1.17.2/bio/kallisto/index"