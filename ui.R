

header <- dashboardHeader(
  title = "Luxury Loan Dashboard",
  titleWidth = 300
)

sidebar <- dashboardSidebar(
  collapsed = F,
  sidebarMenu(
    menuItem(
      text = "Dashboard",
      tabName = "overview",
      icon = icon("chart-bar")
    )
  )
)

body <- dashboardBody(
  
  tabItem(
    tabName = "overview",
    fluidPage(
      box(plotlyOutput("ggplot1"), width = 6),
      box(plotlyOutput("ggplot2"), width = 6),
      box(plotlyOutput("ggplot3"), width = 6),
      box(plotlyOutput("ggplot4"), width = 6)
    )
  )
)




dashboardPage(
  header = header,
  body = body,
  sidebar = sidebar,
  skin = "black"
)