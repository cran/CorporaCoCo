### R code from vignette source 'proof_of_concept.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: common.tex:58-60
###################################################
    options(width = 100)
    options(continue = ' ', prompt = ' ')


###################################################
### code chunk number 2: 'load CorporaCoCo package'
###################################################
library(CorporaCoCo)


###################################################
### code chunk number 3: 'load other packages' (eval = FALSE)
###################################################
## library(CorporaCorpus)
## library(stringi)
## 
## GE  <- unlist( stri_extract_all_words( stri_trans_tolower( readLines(corpus_filepaths('DNov', 'GE')) ) ))
## TTC  <- unlist( stri_extract_all_words( stri_trans_tolower( readLines(corpus_filepaths('DNov', 'TTC')) ) ))


###################################################
### code chunk number 4: 'choose nodes'
###################################################
nodes <- c('back', 'eye', 'eyes', 'forehead', 'hand', 'hands', 'head', 'shoulder')


###################################################
### code chunk number 5: 'check behaviour under the null' (eval = FALSE)
###################################################
## chunks <- split(c(GE, TTC), ceiling(seq_along(c(GE, TTC)) / 1000))
## corpus_a <- unlist( chunks[seq(1, length(chunks), 2)] )
## corpus_b <- unlist( chunks[seq(2, length(chunks), 2)] )
## 
## corpus_a_c <- surface(corpus_a, span = '5LR')
## corpus_b_c <- surface(corpus_b, span = '5LR')
## 
## results <- coco(corpus_a_c, corpus_b_c, nodes = nodes, fdr = 0.01)


###################################################
### code chunk number 6: 'load null results'
###################################################
results <- readRDS('results_null.rds')


###################################################
### code chunk number 7: 'print null results'
###################################################
results


###################################################
### code chunk number 8: 'check distribution of the p-values' (eval = FALSE)
###################################################
## results_all <- coco(corpus_a_c, corpus_b_c, nodes = nodes, fdr = 1.0)
## test_p_values <- results_all$p_value[results_all$p_value <= 0.1]


###################################################
### code chunk number 9: 'load null p-value results'
###################################################
test_p_values <- readRDS('results_null_p_values.rds')


###################################################
### code chunk number 10: proof_of_concept.Rnw:59-66
###################################################
plot(
    qunif(ppoints(test_p_values), min = 0, max = 0.1),
    sort(test_p_values),
    bty = 'n', pch = 4, xlim = c(0.0, 0.1), ylim = c(0.0, 0.1),
    main = "QQ Plot", xlab = "Theoretical Quantiles", ylab = "Sample Quantiles"
)
abline(a = 0, b = 1, col = 'blue', lty = 5)


###################################################
### code chunk number 11: 'check contrived differences' (eval = FALSE)
###################################################
## corpus_a_mod <- corpus_a
## mys <- which(corpus_a_mod == 'my')
## corpus_a_mod[sample(mys, floor(length(mys)*0.9))] <- 'CHIMERA'
## corpus_a_mod_c <- surface(corpus_a_mod, span = '5LR')
## 
## results <- coco(corpus_a_mod_c, corpus_b_c, nodes = nodes, fdr = 0.01)


###################################################
### code chunk number 12: 'load results_chimera'
###################################################
results <- readRDS('results_chimera.rds')


###################################################
### code chunk number 13: 'print CHIMERA results'
###################################################
results


###################################################
### code chunk number 14: 'compare TTC with GE' (eval = FALSE)
###################################################
## results <- surface_coco(TTC, GE, span = '5LR', nodes = nodes, fdr = 0.01)


###################################################
### code chunk number 15: 'load TTC vs GE results'
###################################################
results = readRDS('results_TTC_vs_GE.rds')


###################################################
### code chunk number 16: 'print TTC vs GE results'
###################################################
results


###################################################
### code chunk number 17: proof_of_concept.Rnw:97-98
###################################################
plot(results)


###################################################
### code chunk number 18: 'compare DICKENS and NCNB' (eval = FALSE)
###################################################
## DICKENS <- unlist(stri_extract_all_words(stri_trans_tolower(do.call(c, lapply(corpus_filepaths('DNov'), readLines)))))
## NCNB <- unlist(stri_extract_all_words(stri_trans_tolower(do.call(c, lapply(corpus_filepaths('19C'), readLines)))))
## 
## results <- surface_coco(DICKENS, NCNB, span = '5LR', nodes = nodes, fdr = 0.01)


###################################################
### code chunk number 19: 'load DICKENS vs 19C results'
###################################################
results = readRDS('results_DICKENS_vs_19C.rds')


###################################################
### code chunk number 20: proof_of_concept.Rnw:113-114
###################################################
plot(results)


