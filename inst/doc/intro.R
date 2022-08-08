## ---- echo = FALSE, message = FALSE---------------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#",
    error = FALSE,
     tidy = FALSE,
    cache = FALSE,
 collapse = TRUE)
options(width = 100)

## -------------------------------------------------------------------------------------------------
library(CorporaCoCo)

## -------------------------------------------------------------------------------------------------
a <- "`But do cats eat bats, I wonder?' And here Alice began to get rather sleepy, and went on saying to herself, in a dreamy sort of way, `Do cats eat bats? Do cats eat bats?' and sometimes, `Do bats eat cats?' for, you see, as she couldn't answer either question, it didn't much matter which way she put it."

## -------------------------------------------------------------------------------------------------
a_text <- corp_text(a)

## -------------------------------------------------------------------------------------------------
corp_type_lookup(a_text)

## -------------------------------------------------------------------------------------------------
aa <- "The cat sat on the mat."
bb <- "This dog ate this cat."
aaa <- corp_text(aa)
bbb <- corp_text(bb)
ccc <- list(aaa, bbb)
corp_text_rbindlist(ccc)

## -------------------------------------------------------------------------------------------------
corp_concordance(a_text, span = "4LR", nodes = c("eat"))

## -------------------------------------------------------------------------------------------------
# filtering for one collocate
y <- corp_concordance(a_text, span = "4LR", nodes = c("eat"), collocates = c("but"))
y

# filtering for two collocates
y <- corp_concordance(a_text, span = "4LR", nodes = c("eat"), collocates = c("but", "and"))
y

## -------------------------------------------------------------------------------------------------
# rerunning the original concordance without a collocate filter
o <- corp_concordance(a_text, span = "4LR", nodes = c("eat"))

# printing the concordance and adding collocate highlighting
print(o, collocates = c("but"))

## -------------------------------------------------------------------------------------------------
s <- corp_concordance(a_text, span = "4LR", nodes = c("cats", "bats"))
s[order(N, R1_type)]

## -------------------------------------------------------------------------------------------------
names(y)

## -------------------------------------------------------------------------------------------------
print(y, as_data_table = TRUE)

## -------------------------------------------------------------------------------------------------
a_cooccurs <- corp_surface(a_text, span = '1L1R', nodes = c("alice", "bats", "cats"))

## -------------------------------------------------------------------------------------------------
corp_concordance(a_cooccurs)

## -------------------------------------------------------------------------------------------------
b <- "`But cats eat bats, I wonder?' And here, Alice began to get pretty sleepy and went on to say to herself, in a dreamlike way: `Are cats eating bats? Are cats eating bats?' And sometimes, `Do cats have to eat cats?' since you see because he could not answer the questions, he did not really matter how he put it."
b_text <- corp_text(b)

b_cooccurs <- corp_surface(b_text, span = '1L1R', nodes = c("alice", "bats", "cats"))
b_cooccurs

## -------------------------------------------------------------------------------------------------
cats_and_bats <- corp_coco(a_cooccurs, b_cooccurs, nodes = c("alice", "bats", "cats"), fdr = 1.0)

## ---- fig.dim = c(7, 5)---------------------------------------------------------------------------
plot(cats_and_bats)

## -------------------------------------------------------------------------------------------------
corp_type_lookup(a_text)

## -------------------------------------------------------------------------------------------------
a_tokens <- corp_get_tokens(a_text)
b_tokens <- corp_get_tokens(b_text)

a_tokens$type <- sub("^(cats|bats)$", "MAMMALS", a_tokens$type)
b_tokens$type <- sub("^(cats|bats)$", "MAMMALS", b_tokens$type)

a_text_mammals <- corp_text(a, tokens = a_tokens)
b_text_mammals <- corp_text(b, tokens = b_tokens)

## -------------------------------------------------------------------------------------------------
corp_type_lookup(a_text_mammals)

## -------------------------------------------------------------------------------------------------
a_cooccurs_mammals <- corp_surface(a_text_mammals, span = '1L1R', nodes = c("alice", "MAMMALS"))
b_cooccurs_mammals <- corp_surface(b_text_mammals, span = '1L1R', nodes = c("alice", "MAMMALS"))

mammals <- corp_coco(a_cooccurs_mammals, b_cooccurs_mammals, nodes = c("alice", "MAMMALS"), fdr = 1.0)

## ---- fig.dim = c(7, 5)---------------------------------------------------------------------------
plot(mammals)

