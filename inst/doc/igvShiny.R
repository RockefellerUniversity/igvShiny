## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>"
    )

## ----eval=FALSE---------------------------------------------------------------
# if (!requireNamespace("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
# 
# BiocManager::install("igvShiny")

## ----include=TRUE,results="hide",message=FALSE,warning=FALSE------------------
library(igvShiny)

## ----eval=FALSE---------------------------------------------------------------
# library(igvShiny)
# options <- parseAndValidateGenomeSpec(genomeName="hg38",  initialLocus="NDUFS2")
# if (interactive()) {
#     ui <- shinyUI(fluidPage(igvShinyOutput('igvShiny'), width = 10))
#     server <-
#         function(input, output, session) {
#             output$igvShiny <- renderIgvShiny({
#                 igvShiny(options)
#             })
#             }
#     runApp(shinyApp(ui = ui, server = server))
#     }

## ----echo=TRUE----------------------------------------------------------------
igvShiny::parseAndValidateGenomeSpec("mm10")

## ----echo=TRUE----------------------------------------------------------------
igvShiny::get_css_genomes()

## ----echo=TRUE----------------------------------------------------------------
library(igvShiny)
demo_app_file <- system.file(package= "igvShiny", "demos", "stockGenomesDemo.R")
    if (interactive()) {
        shiny::runApp(demo_app_file)
        }

## ----echo=TRUE----------------------------------------------------------------
library(igvShiny)

# defining custom genome with data provided via URLs
base_url <- "https://gladki.pl/igvr/testFiles"
title <- "ribo remote"
fasta_file <- sprintf("%s/%s", base_url, "ribosomal-RNA-gene.fasta")
fastaIndex_file <- sprintf("%s/%s", base_url, "ribosomal-RNA-gene.fasta.fai")
annotation_file <- sprintf("%s/%s", base_url, "ribosomal-RNA-gene.gff3")
locus <- "U13369.1:7,276-8,225"
genomeOptions <- parseAndValidateGenomeSpec(
    genomeName = title,
    initialLocus = locus,
    stockGenome = FALSE,
    dataMode = "http",
    fasta = fasta_file,
    fastaIndex = fastaIndex_file,
    genomeAnnotation = annotation_file
    )
genomeOptions

# defining custom genome with data provided with local files
data_directory <- system.file(package = "igvShiny", "extdata")
fasta_file      <- file.path(data_directory, "ribosomal-RNA-gene.fasta")
fastaIndex_file <- file.path(data_directory, "ribosomal-RNA-gene.fasta.fai")
annotation_file <- file.path(data_directory, "ribosomal-RNA-gene.gff3")
genomeOptions2 <- parseAndValidateGenomeSpec(
    genomeName = "ribo local",
    initialLocus = "U13369.1:7,276-8,225",
    stockGenome = FALSE,
    dataMode = "localFiles",
    fasta = fasta_file,
    fastaIndex = fastaIndex_file,
    genomeAnnotation = annotation_file
    )
genomeOptions2

## ----echo=TRUE----------------------------------------------------------------
library(igvShiny)
demo_app_file <- system.file(
    package = "igvShiny", 
    "demos", 
    "igvShinyDemo-customGenome-http.R"
    )
if (interactive()) {
    shiny::runApp(demo_app_file)
    }

## ----echo=TRUE----------------------------------------------------------------
library(igvShiny)
demo_app_file <-
    system.file(
        package = "igvShiny", 
        "demos", 
        "igvShinyDemo-customGenome-localFiles.R")
if (interactive()) {
    shiny::runApp(demo_app_file)
    }

## ----echo=TRUE----------------------------------------------------------------
library(igvShiny)
demo_app_file <- system.file(package= "igvShiny", "demos", "igvShinyDemo.R")
if (interactive()) {
    shiny::runApp(demo_app_file)
    }

## -----------------------------------------------------------------------------
sessionInfo()

