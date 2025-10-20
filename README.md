# PGP Q100 Human Genome Assembly CWL Pipeline

This project aims to provide an open-source [Common Workflow Language
(CWL)][cwl] pipeline of Q100 human genome assembly based on public,
well-consented genome data from the Personal Genome Project.

## Overview

State of the art human Whole Genome Sequencing (WGS) starts with short
sequences of nucleobases sampled from typically many cells' worth of DNA.
Although these are referred to as "whole genomes", the sampling technique and
length of the short-read sequences result in genomes that are not complete.     

What if a clinical / clinical research question can't be answered with these
incomplete genomes?

Currently, there is a race to develop methods delivering "Q100" genomes -- with
1 error in 10 billion bases -- and we would like to make these methods publicly
available, in the form of well-documented CWL pipelines.    

In this project we will see if we can augment an ordinary Illumina 30x genome
with low coverage PacBio HiFi and answer new questions nearly impossible with
short reads alone. 

## Technical requirements

1. We shall provide reusable and reproducible CWL workflows (with documentation
   and metadata) that precisely specify the assembly of a "Q100" human genome,
   which can be shared and reproduced by anyone.
2. The CWL workflows shall reference open-access, public human genome data
   (uniquely and unambiguously identifiable by formal identifiers and content
   hashes), and make use of open-source, containerized bioinformatics tools.
3. The CWL workflows shall be deposited to public repositories such as
   [WorkflowHub][wfheu] and curated so as to facilitate replication and
   further collaboration.

## FAQ

### What is a "Q100" genome?

Very simply speaking, we can see the human genome as a string of letters (base
pairs) from the alphabet of four elements "ACGT", the four nucleobases that
encode an someone's genetic information in DNA.

A "Q score" (technically, the logarithmic [Phred quality score][phred]) of Q100
means an error rate not exceeding one in 10 ^ 10 base pairs in the full genomic
sequence -- or one in 10 billion.

The human genome's size is about 3.1 billion base pairs. For humans, a Q100
genome sequence is practically error-free as a whole.

### Where does the human genomic data come from?

This project is based on public-access, well-consented human genomic data from
the [Personal Genome Project (PGP)][pgp] that is also part of the [Genome in a
Bottle (GIAB)][giab] reference collection. The genomic data is explicitly
[shared in an open and free manner](https://pgp.med.harvard.edu/about) for
everyone to access and study.

For an open-source project like this, the public characteristics of the PGP
data is _the_ foundation of the collaboration that happens here. Simply put, it
makes sure _you_ can work on the human-derived data and share your work with
the public.

### What is "Common Workflow Language", and why?

[Common Workflow Language (CWL)][cwl] is an open-standard computer language
that empowers the user to define, run, test, and share workflows. It is
perfectly suited to data-driven development that involves complex operations,
voluminous inputs, and most importantly, open collaboration among teams and
communities. CWL is a generic workflow language, it is already widely adopted
among the bioinformatics world.

CWL embodies the [FAIR principles][fair] -- scientific data and workflows
should be Findable, Accessible, Interoperable, and Reusable. The public nature
of this project calls for the use of tools such as CWL in order to advance the
public interest.

CWL is a vibrant community. Over at WorkflowHub, you can find
[existing projects using CWL](https://workflowhub.eu/workflows?filter%5Bworkflow_type%5D=cwl)
that are still growing, and _you_ may contribute to that growth. Your help is
deeply appreciated!


[phred]: https://en.wikipedia.org/wiki/Phred_quality_score
[cwl]: https://commonwl.org/
[pgp]: https://www.personalgenomes.org/us
[giab]: https://www.nist.gov/programs-projects/genome-bottle
[fair]: https://www.go-fair.org/fair-principles/
[wfheu]: https://workflowhub.eu/
