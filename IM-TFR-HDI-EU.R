require(openxlsx)
require(plotly)
imdata<- read.xlsx("IM-TFR-HDI.xlsx")


fig <- imdata %>% na.omit()%>% 
  plot_ly(
    y = ~HDI,
     x= ~SUF,
    frame = ~Godina,
    type = 'scatter',
    size= ~Populacija,
    sizes = c(10, 3000),
    mode = 'markers',
    color = ~Region,
    text = ~Zemlja,
    hovertemplate = paste(
      "<b>%{text}</b>\n",
      "HDI: %{y:1}\n",
      "SUF: %{x:1}"
    ),
    showlegend = T
  )

fig %>% animation_opts(frame = 1000,transition = 1000) %>% animation_button(label = "Pokreni")
