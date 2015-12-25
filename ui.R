library(shiny)
shinyUI(pageWithSidebar(
	# Set the title
	headerPanel("Temperature Conversion"),
	sidebarPanel(
		# Set the unit system to be converted
		selectInput("from_item",
			label = "From",
			choices = list("Celsius (C)", "Fahrenheit (F)", "Kelvin (K)"),
			selected = "Fahrenheit (F)"),
	
		# Set the value of the unit system to be converted
		numericInput("from_degree", "Degree", 68, min = -1000, max = 1000, step = 1),
	
		# Set the unit system to be converted to
		selectInput("to_item", 
			label = "To",
			choices = list("Celsius (C)", "Fahrenheit (F)", "Kelvin (K)"),
			selected = "Celsius (C)")
	),

	# Set the main panel
	mainPanel(	
		tabsetPanel(
            tabPanel("Instructions", h3(verbatimTextOutput("instruction"))),
            tabPanel("Results", h3(textOutput("caption")), h3(verbatimTextOutput("result")))
        )
	)
))