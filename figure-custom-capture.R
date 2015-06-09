works_with_R("3.0.2", plotMakefile="2014.2.13")

## Plot DAG diagrams.

mk <- function(width, sort) list(width=width, sort=sort)
info <- list("custom-capture"=mk(10, sortValues(
                  "table-variants.R",
                  "trios.RData",
                  "sample.list.RData",
                  "table-noise.R"
                  )),
           "seq-segment"=mk(12, sortValues(
             "HOCKING-seq-segment.tex",
             "table-samples.tex",
             "table-outliers.tex",
             "figure-profiles.png",
             "figure-variables.png",
             ##
             "table-samples.R",
             "hg19.RData",
             "table-outliers.R",
             "zscores.RData",
             "figure-profiles.R",
             "figure-variables.R",
             ##
             "hg19.R",
             "zscores.R"
             )))
categories <-
  c(report="pdf$",
    figure="png$",
    "text/table"="tex$",
    data="RData$",
    code="R$")
colors <- c("black", brewer.pal(4, "Dark2"))
names(colors) <- names(categories)
for(base in names(info)){
  f <- sprintf("%s.mk", base)
  L <- info[[base]]
  out <- sprintf("figure-%s.pdf", base)
  pdf(out, width=L$width)
  plotMakefile(f, sort.fun=L$sort, categories=categories, colors=colors)
  dev.off()
}
