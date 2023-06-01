library(dplyr)
library(stringr)
library(ggplot2)
library(shiny)
library(plotly)

source("Narrative_design_Factors.R")
source("Narrative Design 2_Change Over Time_Code.R")
source("Drill_down_storytelling.R")
about_pg <- tabPanel('About', 
                     tags$div(
                       style = "font-family: Arial; margin: 0.25in 1in 1in 1in;",
                       tags$h1('About this project'),
                       tags$p("This website was created for our Informatics 201 class. The assignment was to create an interactive webpage that included visualizations and text demonstrating the points we were trying to make from our data in our chosen topic. We did all our coding in R through Rstudio and uploaded it to Github which held all the visualizations, source code, combined datasets, and wrangled code to combine our datasets. For the visualizations, we used ggplot2 to create a heat map, line chart, and shaded area chart. To create our final interactive webpage, we used Shiny in an app.R file and then uploaded it as an HTML file. In order to best present our data, we decided to use different tabs to separate our visualizations and information as well as making the webpage interactive for users."),
                       tags$p("For more information and source code, you can visit our ", 
                              tags$a(href = "https://github.com/INFO-201-Fall-2023/INFO201-final-project-repositories-Group27", "GitHub"),
                              ".")
                     )
)
intro_pg <- tabPanel("Introduction",
                     tags$div(
                       style = "font-family: Arial; margin: 0.25in 1in 1in 1in;",
                       tags$h1('How did the events of the Covid-19 Pandemic and the attacks of September 11th, 2001 affect SEATAC and airports which routed through it?'),
                       tags$p("The airline industry is one of the most integral elements of the American economy. The role of the industry is to provide transportation services to commercial, personal, and governmental personnel. Two of the most prolific events in the American airline industry were the attacks of September 11th, 2001, and the Covid-19 Pandemic of 2020. The goal of this project is to visualize the effects of Pre and post-9/11 on the airline industry and compare this to how the airlines responded when faced with similar restrictive difficulties during the outbreak of the Coronavirus. This story is compelling through its potential to give insight into how the airline industry in the United States gained resilience or lost strength between the two damaging events. During the recovery efforts of the post 9/11 airline industry, government funding injected much needed support into the system to attempt build American confidence and bolster failing airlines. during the Pandemic, government spending bills like the CARES act sought to provide smaller amounts of stability through what was considered a short waiting period between viral spread and the return to normal. The result of this difference was that post 9/11 injections of capital back into the industry were significantly more profound results wise compared to the partisan supported CARES act which was meant to be bridge support. The data also describes the story of each event and how the industry managed or failed to respond. Using Domestic flight data from the years 2000, 2002, 2018, and 2022 this analysis looks at each event singularly before comparing both in a more holistic review. particular attention will be spent analyzing how the overall industry gained or lost footing (through the number of flights) and how individual routes or airports gained notoriety given the circumstances."),
                       tags$p("9/11's effect on the American psyche and the airline industry was profound. American flights were grounded, and the TSA was introduced. These elements meant that the way Americans had freely traveled changed dramatically, scaring away previous customers. Such a nationwide tragedy also meant that many individuals suffered severe PTSD and trauma when flying, continuing the trend of customers avoiding flight. Covid-19 had a similar effect on the industry. Instead of fearing hijacking, individuals became incredibly afraid of the damaging virus. Government mandates also halted the booming airline industry, increasing restrictions that were passed on to unhappy customers."),
                       tags$p("In addition to the immediate effects of 9/11 and the Covid-19 pandemic on the airline industry, there were also long-term impacts that have persisted beyond the initial shockwaves. One of the most notable effects of 9/11 was the increased focus on security measures, which have become a permanent fixture of air travel. This includes not only the TSA screenings, but also increased security measures on airplanes themselves, such as reinforced cockpit doors and restrictions on carry-on items. Similarly, the Covid-19 pandemic has led to a new normal in terms of health and safety protocols. This includes mask mandates, social distancing requirements, and enhanced cleaning procedures. While these measures were initially introduced as temporary solutions, many of them have remained in place even as travel has resumed."),
                       tags$p("Some challenges we experienced was the drastic increase in flights from 2002 to 2018. This made it difficult to compare the two events using the number of monthly flights since 2018 had significantly more just because of the technological and increased use of air travel during the 16-year gap. A way we rendered this issue was by creating multiple graphs to demonstrate the changes since we were able to scale the number of flights in proportion to the other year, so they were easily comparable despite the large difference in flights per month. Another challenge we faced was the size of the datasets. We decided to narrow down our data by only looking at flights that included Seattle as a departure or origin city. While this did get rid of data that could’ve modified our results, it made the data more relevant to us and easier to manage.")
                     )
)

story_1_text_info <- sidebarPanel(
  tabsetPanel(
    tabPanel("9/11 Factors", 
             h1('9/11 Factors'),
             p("9/11 had a profound and crippling effect on the aviation industry, as seen in the visualization of monthly flight numbers to and from Seattle-Tacoma International Airport (Sea-Tac). The terrorist attacks in September 2001 resulted in a significant drop in air travel. While the flight numbers in 2002 were higher than those in 2000, the difference was not substantial (e.g., 383 vs. 412 in Jan, 364 vs. 408 in Feb, and so on). However, it is worth noting that the industry experienced a decline in airline passenger travel and capacity following the attacks, as the national airspace was temporarily closed. Despite the eventual recovery in air passenger travel over the following years, the growth in available seats was comparatively slower. Additionally, the industry underwent shifts with the emergence of low-cost carriers and decreased airfares. To address the crisis, a bipartisan financial package of nearly $71 billion was passed between 2000 and 2015 to provide bailout funds for airlines deemed “too big to fail.”")
    ),
    tabPanel("Covid-19 Factors", 
             h1("Covid-19 Factors"),
             p("In contrast, the outbreak of COVID-19 had a less profound impact on the aviation industry, as reflected in the visualization of flight numbers at Sea-Tac. The period spanning 2020 and 2021, marked by the pandemic, did not cause significant damage to the industry. The trend of increasing traffic to and from the airport remained steady, aligning with the pre-COVID trend of high summer flight numbers. However, aviation services were disrupted for several months due to travel restrictions and lockdown measures implemented to control the virus's spread. It is important to note that the increases in flight numbers in 2018 and 2022, compared to their respective previous years, were more significant than those in 2000 and 2002. In response to the industry-specific challenges posed by the pandemic, various government assistance programs were introduced, providing a total of $25 billion under the CARES Act, $15 billion under the Consolidated Appropriations Act 2021, and $14 billion under the American Rescue Plan Act of 2021. These programs aimed to support and stabilize the aviation sector during the unprecedented crisis caused by the COVID-19 pandemic.")
    )
  )
)
story_1_plot_nine_eleven <- tabPanel('9/11 Plot', plotOutput(outputId = 'story_1_nine_eleven_chart'))
story_1_plot_covid <- tabPanel('Covid Plot', plotOutput(outputId = 'story_1_covid_chart'))

story_2_text_info <- sidebarPanel(
  tabsetPanel(
    tabPanel("9/11 Change Over Time", 
             h1('9/11 Change Over Time'),
             p("The visualization of flight activity between 2000 and 2002 reveals no significant change in the number of flights flying in and out of Seattle. The data showcases a relatively stable trend, with only a slight increase in flight numbers during this period. Comparing the monthly flight counts, it becomes evident that the difference in flight numbers between 2000 and 2002 was relatively modest (e.g., 383 vs. 412 in January, 364 vs. 408 in February, and so on). Despite the events surrounding September 11, 2001, which profoundly impacted the aviation industry, the change in flight activity during these years was relatively minor. This suggests that the overall aviation landscape during this period remained relatively stable even with the aftermath of the 9/11 Attacks, with minimal disruption to flight travel.")
    ),
    tabPanel("Covid-19 Change Over Time", 
             h1("Covid-19 Change Over Time"),
             p("In contrast, the data for 2018 and 2022 reveal a substantial change in flight activity, demonstrating a significant surge in flight numbers during these years. The visualization vividly portrays a notable increase in the number of flights to and from Seattle during this period, showcasing a marked contrast to the relatively stable trend observed in the early 2000s. Comparing the monthly flight counts between 2018 and 2022, the difference in flight numbers is considerably more significant (e.g., 21445 vs. 25731 in January, 19076 vs. 23902 in February, and so on). The visualization provides clear evidence of the considerable growth and expansion of flight travel in recent years, highlighting Seattle's increasing prominence as an aviation hub. The substantial change in flight activity during 2018 and 2022 signifies the dynamic nature of the aviation industry and its response to evolving travel demands and market forces, despite the COVID-19 pandemic.")
    )
  )
)
story_2_plot_nine_eleven <- tabPanel('9/11 Plot', plotOutput(outputId = 'story_2_nine_eleven_chart'))
story_2_plot_covid <- tabPanel('Covid Plot', plotOutput(outputId = 'story_2_covid_chart'))

story_3_text_info <- sidebarPanel(
  tabsetPanel(
    tabPanel("9/11 Drill Down", 
             h1('9/11 Drill Down'),
             p("The data analysis focusing on the years 2000 and 2002, corresponding to the aftermath of the 9/11 attacks, provides insights into the impact of this traumatic event on the aviation industry. By examining the top 10 destinations for flights from Seattle during this period, we can observe the changes in the number of flights to these destinations following the attacks. Despite the adverse effects one might expect, such as reduced passenger demand and increased wariness towards air travel, the data reveals a surprising trend. The number of flights to the top destinations from Seattle remained relatively resilient, showcasing a consistent or even increased level of flight activity in the months following the 9/11 events. This data suggests that despite the tragic circumstances and the negative light shed on the airline industry, it continued to grow and adapt, maintaining a steady number of flights per month to popular destinations.")
    ),
    tabPanel("Covid-19 Drill Down", 
             h1("Covid-19 Drill Down"),
             p("Turning our attention to the years 2018 and 2022, which encompass the impact of the COVID-19 pandemic, we can analyze the data to understand the changes in flight activity following this global health crisis. By examining the top 10 destinations for flights from Seattle during this period, we gain insights into how the aviation industry responded to the pandemic-induced challenges. Contrary to expectations, the data demonstrates that the number of flights to these destinations per month continued to grow, even in the face of a disruptive event like COVID-19. Despite the widespread travel restrictions and reduced passenger demand, the aviation industry showcased resilience, adapting to the changing circumstances and maintaining or even increasing flight activity. The top destinations from Seattle experienced a consistent or rising number of flights per month during this period, signifying the industry's ability to navigate and adjust to adverse conditions.")
    )
  )
)
story_3_plot_nine_eleven_2000 <- tabPanel('Top 10 Destinations from SEA in 2000', plotOutput(outputId = 'story_3_2000'))
story_3_plot_nine_eleven_2002 <- tabPanel('Top 10 Destinations from SEA in 2002', plotOutput(outputId = 'story_3_2002'))
story_3_plot_covid_2018 <- tabPanel('Top 10 Destinations from SEA in 2018', plotOutput(outputId = 'story_3_2018'))
story_3_plot_covid_2022 <- tabPanel('Top 10 Destinations from SEA in 2022', plotOutput(outputId = 'story_3_2022'))

story_1 <- tabPanel('Factors',fluidPage(
  titlePanel('Examining Factors of Airline disruption due to Covid-19 and 9/11'),
  sidebarLayout(story_1_text_info,
                mainPanel(
                  tabsetPanel(
                    story_1_plot_nine_eleven,
                    story_1_plot_covid,
                  )
                )
  )
)
)

story_2 <- tabPanel('Change Over Time',fluidPage(
  titlePanel('Examining Change Over Time of Number of Flights during Covid-19 and 9/11'),
  sidebarLayout(story_2_text_info,
                mainPanel(
                  tabsetPanel(
                    story_2_plot_nine_eleven,
                    story_2_plot_covid,
                  )
                )
  )
)
)

story_3 <- tabPanel('Drill Down',fluidPage(
  titlePanel('Drilling Down on Airport popularity During Covid-19 and 9/11'),
  sidebarLayout(story_3_text_info,
                mainPanel(
                  tabsetPanel(
                    story_3_plot_nine_eleven_2000,
                    story_3_plot_nine_eleven_2002,
                    story_3_plot_covid_2018,
                    story_3_plot_covid_2022,
                  )
                )
  )
)
)

ui <- navbarPage("Examining The Effects of Covid-19 and 9/11 on the Airline Industry", intro_pg, story_1, story_2, story_3, about_pg)

server <- function(input, output) {
  
  output$story_1_nine_eleven_chart <- renderPlot({
    return(viz2)
  })
  output$story_1_covid_chart <- renderPlot({
    return(viz)
  })
  output$story_2_nine_eleven_chart <- renderPlot({
    return(story_2_viz_nine)
  })
  output$story_2_covid_chart <- renderPlot({
    return(story_2_viz_covid)
  })
  output$story_3_2000 <- renderPlot({
    return(story_3_viz_nine_2000)
  })
  output$story_3_2002 <- renderPlot({
    return(story_3_viz_nine_2002)
  })
  output$story_3_2018 <- renderPlot({
    return(story_3_viz_covid_2018)
  })
  output$story_3_2022 <- renderPlot({
    return(story_3_viz_covid_2022)
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
