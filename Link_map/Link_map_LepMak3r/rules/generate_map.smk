rule separate_chromosomes:
    input:
        "data.call.gz"
    output:
        "maps.splitchrom/map.{lod_range}"
    log:
        "maps.splitchrom/logs/map.{lod_range}.log"
    message:
        """
        Creating map for lodLimit={params.lod} >> maps.splitchrom/map.{params.lod}
        """
    threads: sepchrom_threads
    params:
        lod = "{lod_range}",
        dist_lod = "distortionLod=1"
    shell:
        """
        zcat {input} | java -cp LM3 SeparateChromosomes2 data=- lodLimit={params.lod} {params.dist_lod} informativeMask=2 numThreads={threads} > {output} 2> {log}
        """
rule map_summary:
    input:
        expand("maps.splitchrom/map.{LOD}", LOD = lod_range)
    output:
        "maps.splitchrom/maps.summary.txt"
    message:
        """
        Combining map summaries >> maps.splitchrom/maps.summary.txt
        """
    params:
        lod_max = lod_max
    shell:
        "scripts/map_summary.sh {params.lod_max}"

rule join_singles:
    input:
        datacall = "data.call.gz",
        map_summ = "maps.splitchrom/maps.summary.txt"
    output:
        "map.master"
    log:
        "maps.splitchrom/chosen.map"
    threads: sepchrom_threads
    params:
        lod_limit = lod_lim,
        lod_diff = lod_diff,
        iterate = "iterate=1",
    shell:
        """
        echo -n -e '\nWhich map would you like to use (e.g. map.15)? map.'
        echo "map.12" > {log}
        zcat {input.datacall} | java -cp LM3 JoinSingles2All map=map.12 data=- {params.lod_limit} {params.lod_diff} {params.iterate} distortionLod=1 numThreads={threads} > {output}
        echo "Your filtered map can be found in the working directory as {output}"
        echo "A record of your choice can be found in {log}"
        sleep 5s
        """
