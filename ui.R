library(shiny)


# Define UI for application that plots random distributions 
shinyUI(bootstrapPage(

  # Application title
  headerPanel("Running Diary"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    radioButtons("sel","Select action", selected="Insert",
               c("Insert" = "ins",
                  "Add Row" = "add",
                  "Change Rov" = "cha",
                  "Delete Last Row" = "del-las",
                  "Delete a Row"   = "del-a")),
    numericInput("R", "Row", 1),
    dateInput("D", "Date", value = "2012-02-29",format = "dd/mm/yy"),
    numericInput("W", "Km Traveled", 70.3),
    actionButton("action","Apply Changes")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(id="tab1",
    tabPanel("Sheet",tableOutput("km")),
    tabPanel("Summary",verbatimTextOutput("summary")),
    tabPanel("Plot",plotOutput("plot"))
  ))
))

