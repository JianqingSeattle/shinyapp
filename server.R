library(UsingR)
# Convert between the same unit system
S_to_S <- function(S) S
# Celsius -> Fahrenheit
C_to_F <- function(C) (C * 9.0 / 5.0) + 32.0
# Celsius -> Kelvin
C_to_K <- function(C) C + 273.15
# Fahrenheit -> Celsius
F_to_C <- function(F) (F - 32.0) * 5.0 / 9.0
# Fahrenheit -> Kelvin
F_to_K <- function(F) (F - 32) * 5.0 / 9.0 + 273.15
# Kelvin -> Celsius
K_to_C <- function(K) K - 273.15
# Kelvin -> Fahrenheit
K_to_F <- function(K) (K - 273.15) * 9.0 / 5.0 + 32.0

shinyServer(
	function(input, output) {
		## Set the "Instructions" tab
		output$instruction <- renderText({
			paste("This app is created using shiny package in R. The purpose of this app is to convert temperature between different unit systems. Three options are provided, Celsius (C), Fahrenheit (F), Kelvin (K). To use this app, first choose a unit system you want to convert using the 'From' box, then set the value using the 'Degree' box. The third step is to select a unit system you want to convert to using 'To' box. Default values are provided for these items.")
		})
	
		## Set the "Results" tab
		# Set the caption
		from_to <- reactive({
			paste(input$from_item, " ----> ", input$to_item)
		})
		
		output$caption <- renderText({
			from_to()
		})
		
		# Convert between two unit systems
		convert <- reactive({
			if (input$from_item == input$to_item) {
				return(S_to_S(input$from_degree))
			} else if (input$from_item == "Celsius (C)" & input$to_item == "Fahrenheit (F)") {
				return(C_to_F(input$from_degree))
			} else if (input$from_item == "Celsius (C)" & input$to_item == "Kelvin (K)") {
				return(C_to_K(input$from_degree))
			} else if (input$from_item == "Fahrenheit (F)" & input$to_item == "Celsius (C)") {
				return(F_to_C(input$from_degree))
			} else if (input$from_item == "Fahrenheit (F)" & input$to_item == "Kelvin (K)") {
				return(F_to_K(input$from_degree))
			} else if (input$from_item == "Kelvin (K)" & input$to_item == "Celsius (C)") {
				return(K_to_C(input$from_degree))
			} else if (input$from_item == "Kelvin (K)" & input$to_item == "Fahrenheit (F)") {
				return(K_to_F(input$from_degree))
			}
		})
		
		output$result <- renderText({convert()})
  }
)
