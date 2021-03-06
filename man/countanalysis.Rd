% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/5_getaltered.R
\name{countanalysis}
\alias{countanalysis}
\title{Determines which regulatory regions are signifigantly altered
between sample types}
\usage{
countanalysis(counts, pval = 0.01, lfcvalue = 1)
}
\arguments{
\item{counts}{counts for each region}

\item{pval}{optional, pvalue considered significant (0.05, 0.01, etc.)}

\item{lfcvalue}{optional, logfold change value considered significant
(value reported on a log scale base 2 so log2fold change of 1.5 means
difference in peaks increased by 2^1.5 or 2.8)}
}
\value{
list containing:
1) DESeq2 results table
2) some statistics
3) data.frame used for plotting
}
\description{
Altered regions are those that show differences in chromatin accessibility
(using DESeq2 algorithm)
}
\examples{
\dontrun{
dir <- system.file('extdata', package='ALTRE', mustWork=TRUE)
csvfile <- file.path(dir, 'lung.csv')
sampleinfo <- loadCSVFile(csvfile)
samplePeaks <- loadBedFiles(sampleinfo)
consPeaks <- getConsensusPeaks(samplepeaks=samplePeaks,minreps=2)
TSSannot <- getTSS()
consPeaksAnnotated <- combineAnnotatePeaks(conspeaks = consPeaks,
                                          TSS = TSSannot,
                                          merge = TRUE,
                                          regionspecific = TRUE,
                                          mergedistenh = 1500,
                                          mergedistprom = 1000)
counts_consPeaks <- getCounts(annotpeaks = consPeaksAnnotated,
                              csvfile = csvfile,
                              reference = 'SAEC')
altre_peaks <- countanalysis(counts=counts_consPeaks,
                             pval=0.01,
                             lfcvalue=1)
}
}

