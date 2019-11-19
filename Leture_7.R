
# Loading packages and data -----------------------------------------------

library(readr)
GSSvocab <- read_csv("GSSvocab.csv", col_types = cols(X1 = col_skip()))

library(ggplot2)
library(dplyr)

# Data exploration --------------------------------------------------------

# structure of the dataset
str(GSSvocab)

# view the dataset's first 10 obs.
head(GSSvocab, 10)

# summary the variables
summary(GSSvocab)

# summary the string variables
summary(factor(GSSvocab$gender))
summary(factor(GSSvocab$nativeBorn))
summary(factor(GSSvocab$ageGroup))
summary(factor(GSSvocab$educGroup))

ggplot(GSSvocab, aes(x = factor(year), y = vocab)) +
  geom_boxplot()

ggplot(GSSvocab, aes(x = factor(gender), y = vocab)) +
  geom_boxplot() +
  facet_wrap(~year)

ggplot(GSSvocab, aes(year)) +
  geom_bar()

ggplot(GSSvocab, aes(gender)) +
  geom_bar() +
  facet_wrap(~year)


# Data management ---------------------------------------------------------

year_vocab <- GSSvocab %>%
  group_by(year) %>%
  summarise(avgVocab = mean(vocab, na.rm = T))

head(year_vocab, 10)
