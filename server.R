function(input, output) {
  
  
  
  # Plot 1
  output$ggplot1 <- renderPlotly({
    
    tabel1 <- df %>% 
      select(year, purpose, funded_amount) %>% 
      group_by(year, purpose) %>% 
      summarise(total = sum(funded_amount)) %>% 
      ungroup() %>% 
      mutate(text = paste("purpose:",purpose,year,";",total))
    
    plot1 <- ggplot(tabel1, aes(y=total, x=year, fill=purpose, text = text)) + 
      geom_bar(position="stack", stat="identity") +
      ggtitle("Rule of Law") +
      scale_fill_brewer(palette = "YlGnBu") +
      labs(x = "Year", y= "Total Funded", title = "Total Funded per Year by Purpose") +
      theme(legend.position = "none") +
      theme_light()
    
    ggplotly(plot1, tooltip = "text")%>%
      config(displayModeBar = F)
    
  })
  
  # Plot 2
  
  output$ggplot2 <- renderPlotly({
    
    tabel2 <- df %>% 
      select(funded_amount, year, loan_id) %>% 
      group_by(year) %>% 
      summarise(total = sum(funded_amount),
                credits = length(loan_id)) %>% 
      ungroup() %>% 
      mutate(text = paste("Credit:",credits, "Total:", total))
    
    plot2 <- ggplot(tabel2, aes(y=total, x=year, text=text, fill = total)) + 
      geom_bar(stat="identity") +
      labs(x = "Year", y= "Total Funded", title = "Total Funded per Year and Number of Credits") +
      theme_light()
    
    ggplotly(plot2, tooltip = "text")%>%
      config(displayModeBar = F)
    
  })
  
  # Plot 3
  
  output$ggplot3 <- renderPlotly({
    
    tabel3 <- df %>% 
      select(loan.balance, purpose) %>%
      group_by(purpose) %>% 
      summarise(total = sum(loan.balance)) %>% 
      ungroup() %>% 
      mutate(text = paste(purpose,":",total))
    
    plot3 <- ggplot(tabel3, aes(x = total, y = reorder(purpose, total), text = text))+
      geom_col(aes(fill=purpose))+
      theme(legend.position = "none") +
      scale_fill_brewer(palette = "PuBuGn") +
      labs(x = "Total Loan", y= NULL, title = "Total Loan Funded by Purpose")
    
    ggplotly(plot3, tooltip = "text") %>% 
      config(displayModeBar = F)
    
  })
  
  
  # Plot 4
  
  output$ggplot4 <- renderPlotly({
    
  table4 <- df %>%
    select(year, funded_amount, loan.balance) %>%
    group_by(year) %>%
    summarise(total_funded = sum(funded_amount),
              total_balance = sum(loan.balance))%>%
    arrange(year) %>%
    pivot_longer(-year, names_to = "category")
  
  areachart <- ggplot(table4, aes(x = year, y = value, fill = category)) +
    geom_area() +
    scale_fill_brewer(palette = "Blues") +
    labs(x = "Year", y= "", title = "Total Balance and Total Funded Comparison") +
    theme(legend.position = "none") +
    theme_light()
  
  ggplotly(areachart)%>%
    config(displayModeBar = F)
  
  })
  
  
  
  
  
  
  
  
  
  
}