# load readtext and quanteda
library(readtext)
library(quanteda)

# install.packages("readtext")

# import our raw text files as a data frame
dat <- readtext(file = "data/*.txt",
                docvarsfrom = "filenames",
                dvsep = "-",
                encoding = "UTF-8",
                docvarnames = c("year", "name", "party"))


# create a text corpus
corp <- corpus(dat)

# get a summary of the text corpus
summary(corp)

# tokenize the corpus
toks <- tokens(corp)

# tokenize with some adjustments
toks_processed <- corp %>% 
    tokens(remove_punct = TRUE,
           remove_numbers = TRUE) %>% 
    tokens_remove(pattern = "das")

# compare the first tokens
head(toks, n = 4)

# repeat with the adjusted object
head(toks_processed, n = 4)

# tokenize to the level of characters
toks_char <- tokens(corp, what = "character")

# inspect element
head(toks_char, n = 4)

# construct a document-feature matrix
dfmat_char <- dfm(toks_char)

# overview of dfm
dfmat_char

# get most frequent characters
topfeatures(dfmat_char, n = 100)
