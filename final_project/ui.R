library(shiny)

fluidPage(
  titlePanel("EV vs Gas Car Calculator"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("distance", "Daily Driving Distance (km):", min = 1, max = 200, value = 40),
      numericInput("gasPrice", "Gasoline Price per Liter ($):", value = 1.20, step = 0.1),
      numericInput("kwhPrice", "Electricity Price per kWh ($):", value = 0.15, step = 0.05),
      numericInput("mpg", "Gas Car Fuel Economy (mpg):", value = 25, step = 1),
      numericInput("kwh100km", "EV Efficiency (kWh/100km):", value = 18, step = 1),
      helpText("Adjust the values to calculate the daily and annual costs.")
    ),
    mainPanel(
      h3("Cost Comparison"),
      tableOutput("costTable"),
      plotOutput("costPlot")
    )
  )
)
