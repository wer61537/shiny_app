library(shiny)
library(choroplethrZip)
library(markdown)

data(df_zip_demographics)
demographics = colnames(df_zip_demographics)[2:9]
tc_zips<-zip.regions[zip.regions$cbsa == "33460", ]
tc_data<-df_zip_demographics[df_zip_demographics$region %in% tc_zips$region,]

shinyUI(fluidPage(
  
  titlePanel("Demographics of the Twin Cities Metropolitan Statistical Area, MN - WI"),
  
  fluidRow(
    column(
        12, includeMarkdown("Top.md")
        )
   ),
  tabsetPanel(
    tabPanel("Maps", 
      sidebarLayout(
        sidebarPanel(
          selectInput("value",
                      "Demographic",
                      demographics,
                      selected="per_capita_income")
        ),
        mainPanel(
          plotOutput("map")
          ) #main panel
        ) #sidebarLayout
      ), #tab panel
      tabPanel("Plots", 
               sidebarLayout(
                 sidebarPanel(
                   selectInput("xvar",
                               label = "Select X Variable",
                               choices = demographics,
                               selected = "per_capita_income"),
                   selectInput("yvar",
                               label = "Select Y Variable",
                               choices = demographics,
                               selected = "per_capita_income")
                 ),
                 mainPanel(
                   plotOutput("plot")
                 ) #main panel
               ) #sidebarLayout
      ) #tab panel
    ) #tabsetpanel
  ) #fluidpaget
) #shinyui