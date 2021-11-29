### post doc selections
#download PubMed search by type, year.
cat("\f") 
rm(list = ls())
library(readxl)
library("dplyr")
library("writexl")

pubmed = read_excel("C:/Users/Ofir Cohn/Downloads/pubmed.xlsx")
pubmed$last <- sub('.*\\,','', pubmed$Authors)
pubmed$last <- gsub(".$","", pubmed$last)
pubmed= pubmed[!is.na(pubmed$last),]
pubmed = subset(pubmed, pubmed$last != " et al")
pubmed =pubmed[-grep("SARS", pubmed$Title),]
pubmed = subset(pubmed, pubmed$`Publication Year`>2019)
counts = pubmed %>% group_by(last) %>% summarize(count=n())


write_xlsx(pubmed, "C:/Users/Ofir Cohn/pubmed2.xlsx")


