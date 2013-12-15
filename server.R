library(shiny)
source('function.R', local = TRUE)
# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
 
  mydataL <- reactive({
    Names<-c("Data","Km")
    if(input$action == 0)
      return(mydataRead())
    else
      isolate({
        orig.date<-as.Date(input$D, origin = "1900-01-01")
        new.date<-as.character(format(orig.date, format=c("%d/%m/%Y")))
    newrow<-list(new.date,input$W)
    if (input$sel == "ins")
    newRow(mydataRead(),newrow,Names)
    if (input$sel == "add")
      insertRow(mydataRead(),newrow,input$R)
    if (input$sel == "cha")
      changeRow(mydataRead(),newrow,input$R)
    if (input$sel == "del-las")
      deleteLastRow(mydataRead())
    if (input$sel == "del-a")
      deleteARow(mydataRead(),input$R)
    di<-mydataRead()
    return(di)
      })
  })
  output$km<- renderTable({
    mydataL()
  })
  output$summary<- renderPrint({
    data_ren<-mydataL()[2]
    summary(data_ren)
  })
  output$plot<- renderPlot({
    data_ren<-mydataL()[,2]
    data_length<-length(data_ren)
    seq_length<-seq(1,data_length, by=1)
    xLab<-mydataL()[,1]
    plot(seq_length, data_ren, type="l", col="red", xaxt = "n", xlab="Day", ylab="Km")
    axis(1, at=1:data_length, labels=xLab)
  })
  
})

