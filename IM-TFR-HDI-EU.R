require(openxlsx)
require(plotly)
imdata<- read.xlsx("IM-TFR-HDI.xlsx")


fig <- imdata %>% na.omit()%>% 
  plot_ly() %>% 
  add_trace(    y = ~HDI,
                  x= ~SUF,
                  frame = ~Godina,
                  type = 'scatter',
                  size= ~Populacija,
                  sizes = c(10, 3000),
                  mode = 'markers',
                  color = ~Region,
                  text = ~sprintf(
                    "<b>%s</b>\nHDI: %s\nSUF: %s",
                    Zemlja,
                    format(HDI,decimal.mark = ","),
                    format(SUF,decimal.mark = ",")
                  ),
                  hovertemplate = paste("%{text}"),
                  showlegend = T)%>%  
  add_segments(x = 1, name='Veoma visok indeks\nljudskog razvoja',text = "Test", hovertemplate = paste("%{text}"), xend = 2.4, y = 0.8, yend = 0.8,linetype = I("dash"),line = list(color = "black", width=0.5), showlegend=T) %>% 
  animation_opts(frame = 1000,transition = 1000) %>% animation_button(label = "Pokreni") %>% layout(separators=",.")%>% layout( yaxis = list(title = 'Indeks ljudskog razvoja'),xaxis = list(title = 'Stopa ukupnog fertiliteta'))
fig
