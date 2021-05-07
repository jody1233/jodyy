library(shiny)
library(tidyverse)
library(readr)
library(readr)

happiness <- read_csv("world_happiness21.csv")
# there is an error with the plot
# the plot dose not view i`ll fix it and i`ll send it aging

ui <- fluidPage(
  selectInput(inputId="cat2",
              label="Choose a the scale for y",
              # display choices for users to pick from
              choices=c(
                        "GDP"="Logged GDP per capita",
                        "Generosity"= "Generosity",
                        "Social support" = "Explained by: Social support",
                        "Healthy life"="Healthy life expectancy"
                        )

 
),
  plotOutput("scatter1")
)

server <- function(input, output) {
 
  output$scatter1 <- renderPlot({
    title <- "Scatter 1"
   
    happiness_f <- happiness[happiness$`Country name` == c("United Arab Emirates","Saudi Arabia","Egypt"),c('Country name',input$cat2)]
    happiness_f<-as.data.frame(happiness_f)
    print(happiness_f)
      typeof(happiness_f)
     
      happiness_f %>%
      ggplot(aes(x=happiness_f[,1], y=happiness_f[,2])) +
      geom_bar(stat = 'identity') +
      labs(title=title, x='Country name', y=input$cat2)
    # if the user choose any species other than 'all' display plot below
   })
}
shinyApp(ui=ui, server=server)



#----------------------------------------------------------
# then I want create chart par dynamic for this :

filter(country_name == c('India'))%>%
ggplot()+geom_point(aes(y=life_ladder, x=year),show.legend =F)+
geom_line(aes(y=life_ladder, x=year))+
labs(title = 'Life Ladder Score of India',
    subtitle = 'over the years',
    y= 'Life Ladder Score',
    x = 'Year')+
theme_wsj()
