list.of.packages <- c("choroplethrZip", "devtools", "shiny", "R6", "mapproj")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(R6)
library(shiny)
library(devtools)
library(choroplethrZip)
library(ggplot2)
library(mapproj)
#to proper case text
library(fitcoach)

if (!"choroplethrZip" %in% installed.packages()[, "Package"]) {
  install_github('arilamstein/choroplethrZip@v1.3.0')
}
library(choroplethrZip)

shinyServer(function(input, output) {
  
  output$map = renderPlot({
    # add a progress bar
    progress = shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "Creating image. Please wait.", value = 0)
    
    df_zip_demographics$value = df_zip_demographics[, input$value]
    num_colors = as.numeric(input$num_colors)
    zip_choropleth(df_zip_demographics, 
                   num_colors=7,title = paste0("\n",properCase(gsub("_", " ", input$value))," in Twin City Metropolitan Statistical Area"), legend = properCase(gsub("_", " ", input$value)), 
                   msa_zoom="Minneapolis-St. Paul-Bloomington, MN-WI") + coord_map()
  })
  
  output$plot = renderPlot({
    datax <- switch(input$xvar,
                    "total_population" = tc_data$total_population,
                    "percent_white" = tc_data$percent_white,
                    "percent_black" = tc_data$percent_black,
                    "percent_asian" = tc_data$percent_asian,
                    "percent_hispanic" = tc_data$percent_hispanic,
                    "per_capita_income" = tc_data$per_capita_income,
                    "median_rent" = tc_data$median_rent,
                    "median_age" = tc_data$median_age
    )
    datay<- switch(input$yvar,
                   "total_population" = tc_data$total_population,
                   "percent_white" = tc_data$percent_white,
                   "percent_black" = tc_data$percent_black,
                   "percent_asian" = tc_data$percent_asian,
                   "percent_hispanic" = tc_data$percent_hispanic,
                   "per_capita_income" = tc_data$per_capita_income,
                   "median_rent" = tc_data$median_rent,
                   "median_age" = tc_data$median_age
    )
    
    title = properCase(gsub("_", " ",paste0(input$xvar," vs ", input$yvar," in Twin City Metropolitan Statistical Area")))
    qplot(datax, datay, xlab = properCase(gsub("_", " ",input$xvar)), ylab = properCase(gsub("_", " ",input$yvar)),
          main = title ) + (geom_smooth())
    
  })

})