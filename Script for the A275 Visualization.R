install.packages("ggplot2")
install.packages("reshape2")
install.packages("readxl")

library(ggplot2)
library(reshape2)
library(readxl)

data <- read_excel("C:/Users/user/OneDrive - University of Hertfordshire/Team Research and development/A275_Dataset.xlsx")
str(data)

head(data)

colnames(data) <- c("Entity", "Code", "Year", "Male_Anxiety", "Female_Anxiety", "Population", "Continent")

clean_data <- na.omit(data[, c("Male_Anxiety", "Female_Anxiety", "Year")])

long_data <- melt(clean_data, id.vars = "Year", measure.vars = c("Male_Anxiety", "Female_Anxiety"),
                  variable.name = "Gender", value.name = "Anxiety_Prevalence")



# Box Plot to visualize Anxiety Prevalence by Gender
ggplot(long_data, aes(x = Gender, y = Anxiety_Prevalence, fill = Gender)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Box Plot of Anxiety Prevalence by Gender",
       x = "Gender", 
       y = "Anxiety Prevalence (%)") +
  scale_fill_manual(values = c("Male_Anxiety" = "#1f77b4", "Female_Anxiety" = "#ff7f0e"))



# Histogram to visualize Anxiety Prevalence distribution by Gender
ggplot(long_data, aes(x = Anxiety_Prevalence, fill = Gender)) +
  geom_histogram(alpha = 0.7, position = "identity", bins = 30) +
  theme_minimal() +
  labs(title = "Histogram of Anxiety Prevalence by Gender",
       x = "Anxiety Prevalence (%)", 
       y = "Frequency") +
  scale_fill_manual(values = c("Male_Anxiety" = "#1f77b4", "Female_Anxiety" = "#ff7f0e"))