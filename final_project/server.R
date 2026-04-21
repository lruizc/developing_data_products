library(shiny)
library(ggplot2)

function(input, output) {
  
  calculations <- reactive({
    liters100km <- 235.215 / input$mpg
    daily_gas_liters <- (input$distance / 100) * liters100km
    daily_gas_cost <- daily_gas_liters * input$gasPrice
    
    daily_ev_kwh <- (input$distance / 100) * input$kwh100km
    daily_ev_cost <- daily_ev_kwh * input$kwhPrice
    
    annual_gas <- daily_gas_cost * 365
    annual_ev <- daily_ev_cost * 365
    
    data.frame(
      Vehicle = c("Gas Car", "Electric Vehicle"),
      Daily_Cost = c(daily_gas_cost, daily_ev_cost),
      Annual_Cost = c(annual_gas, annual_ev)
    )
  })
  
  output$costTable <- renderTable({
    calculations()
  })
  
  output$costPlot <- renderPlot({
    df <- calculations()
    ggplot(df, aes(x = Vehicle, y = Annual_Cost, fill = Vehicle)) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      labs(title = "Annual Cost Comparison", y = "Cost ($)")
  })
}
