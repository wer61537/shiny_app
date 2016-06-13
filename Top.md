*by Bill Rowe*

This Shiny app uses choropleth maps to explore the demographics of the Twin Cities Metropolitan Statistical Area that includes 10 counties in Minnesota and 2 counties in western Wisconsin (separated by the St. Croix River). A choropleth map (from Greek χώρο ("area/region") + πλήθος ("multitude")) is a thematic map.  Areas are colored in proportion to the value of a statistic like per-capita income or percent Hispanic as examples.

Metropolitan Statistical Areas [Metropolitan Statistical Area (MSA)](https://en.wikipedia.org/wiki/Metropolitan_statistical_area) are defined by the Census Bureau. The regions in the images are the Census Bureau's approximation ([Zip Code Tabulated Areas (ZCTAS)](https://www.census.gov/geo/reference/zctas.html)) of postal zip codes.  All the data is from the 2013 [American Community Survey (ACS)](http://www.census.gov/acs/www/) accessed via the [choropleth](https://cran.r-project.org/web/packages/choroplethr/choroplethr.pdf) package created by [Ari Lamestein](http://www.arilamstein.com/).

The ***Maps*** tab shows the distribution of a demographic statistic across the statistical area. The drop down can be sued to chose the demographic that will be presented on the map of the Twin Cities.  The ***Plots*** tab creates scatter plots of the demographics versus other other selected demographics.  The R code (server.R, ui.R and Top.md) for this app can be found on [GitHub](https://github.com/wer61537/shiny_app).

