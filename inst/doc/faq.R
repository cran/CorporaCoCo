### R code from vignette source 'faq.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: common.tex:58-60
###################################################
    options(width = 100)
    options(continue = ' ', prompt = ' ')


###################################################
### code chunk number 2: 'load libraries'
###################################################
library(CorporaCoCo)
library(stringi)


###################################################
### code chunk number 3: 'load results set'
###################################################
results <- readRDS('results_TTC_vs_GE.rds')


###################################################
### code chunk number 4: 'Using the surface function'
###################################################
library(stringi)

text <- "‘One side of WHAT? The other side of WHAT?’ thought Alice to herself."
tokens <- unlist(stri_extract_all_words( stri_trans_tolower(text)))

surface(tokens, span = '2R')


###################################################
### code chunk number 5: 'sentences co-occurrence boundaries'
###################################################
sentences  <- unlist(stri_extract_all_boundaries(text, type = 'sentence'))
sentences

span <- 2
tokenized_sentences <- stri_extract_all_words(stri_trans_tolower( sentences )) 
tokens <- unlist(lapply(tokenized_sentences, function(x) append(x, rep(NA, span))))
tokens

surface(tokens, span = '2R')


###################################################
### code chunk number 6: faq.Rnw:77-78
###################################################
plot(results)


###################################################
### code chunk number 7: faq.Rnw:91-92
###################################################
plot(results, nodes = c('eyes', 'hand', 'back'))


###################################################
### code chunk number 8: faq.Rnw:100-101
###################################################
plot( with(results, results[effect_size > 0]) )


###################################################
### code chunk number 9: faq.Rnw:109-117
###################################################
plot(
    with(results, results[effect_size > 0]),
    forest_plot_args = list(
        main = 'Co-occurrences with a positive effect size',
        xlim = c(-2, 10),
        xlab = 'Effect Size (log of the odds ratio)'
    )
)


###################################################
### code chunk number 10: faq.Rnw:122-150
###################################################
keep <- par(no.readonly=TRUE)
par(
    cex.main = 1.5,
    col.main = 'blue',
    cex.axis = 1.5,
    col.axis = 'purple',
    cex.lab = 1.5,
    col.lab = 'darkgreen',
    lwd = 3.0,
    col = 'darkred'
)

plot(
    with(results, results[effect_size > 0]),
    forest_plot_args = list(
        main = 'Co-occurrences (positive effect size)',
        xlim = c(-2, 10),
        xlab = 'Effect Size (log of the odds ratio)',
        pch = 17,
        cex.pch = 2,
        lwd.xaxt = 2.0,
        col.xaxt = 'darkcyan',
        col.whisker = 'red',
        col.zero = 'darkorange'
    )
)

par(keep)


