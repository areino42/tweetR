



library(shiny)


shinyUI(


navbarPage("tweetR",
             
             theme = shinythemes::shinytheme("cerulean"),
             collapsible = TRUE,
             fluid = TRUE,
             position = "fixed-top",
               
             
  tabPanel("home", icon = icon("home"),
           
           
           
           tags$head(
             
           shinyjs::useShinyjs(),  
           includeCSS("style.css")
                     
      
                     ),
           
           
           fluidRow(
             
           tags$header(     
             
           HTML('
                
                <header class="masthead">
                <div class="container">
                <div class="intro-text">
                <span class="name">tweetR</span>
                <hr>
                <span class="subname">Una aplicación de text mining desarrollada en  lenguaje de programación <strong>R</strong>.</span>
                </div>
                </div>
                </header>         


                <section class="success" id="about">
                <div class="container">
                <h2 class="text-center">por qué <strong>R</strong>?</h2>
                <br>
                <br>
                <div class="row">
                <div class="col-lg-6">
                <p>R es un ambiente y lenguaje de programación orientado a objetos con enfoque estadístico, siendo uno de 
                los <strong>open source</strong> más usados por la comunidad científica.</p>
                </div>
                <div class="col-lg-6">
                <p>Es multidisciplinario, siendo muy popular en los campos de minería de datos, matemáticas financieras, 
                aprendizaje de máquina, bioinformática y en la <strong>minería de textos</strong>.</p>
                </div>

                

                </div>
                </div>
                </section>


         
                ')
           
           )
           ),  
           
           fluidRow(
             
           column(width = 4,
                  
                  br(),
                  img(src='cell-phone-1245663_640.jpg', align = "left",  width = 400, height = 300)
                    
                    
           ),    
             
           column(width = 8, 
                  
                br(),
                br(),
                br(),
           
           HTML('
      
                
                <blockquote class="blockquote blockquote-reverse">
                <p>La minería de textos o "text mining" es el conjunto de herramientas que nos permiten obtener conocimiento automático a partir datos no estructurados, en este caso
                aplicado a los tweeters correspondientes a los <strong>8 candidatos presidenciales Chile 2017</strong>.
                Esta aplicación nos permite abordar las principales herramientas del análisis de textos de manera interactiva,
                con el objetivo de que el usuario puede aprender sobre dichas herramientas o técnicas estadísticas y descubrir 
                que es lo que la gente está diciendo, cuáles son los temas más frecuentes o de interés en las redes sociales.
                La aplicación nos permite la descarga de los tweets correspondientes a los <strong>últimos 7 días
                </strong>.</p></blockquote>
     
                
              ')
           
           )
           
           ),
           
           
           fluidRow(
                  
           column(width = 8,
                  
                  br(),
                  br(),
                  br(),
                  
           HTML('
      
                
                <blockquote class="blockquote">
                <p>Los avances tecnológicos han permitido que el área de text mining progrese rápido en la última década, esta área 
                comprende modelos estadísticos, aprendizaje de máquina, lingüística computacional, entre otras, necesarias para analizar una gran cantidad de información 
                no estructurada o de texto abierto, que suele ser muy valiosa para la toma de decisiones, pero que muchas veces es pasada por alto o que simplemente queda
                almacenada. Hoy softwares de código abierto u <strong>"open source"</strong> pueden automatizar la extracción y análisis de esta información
                en ambientes integrados de desarrollo o "IDE" de manera fácil de comprender, en este caso lenguaje científico <strong>"R"</strong>.
                Este tipo de tecnologías nos permiten hoy desarrollar prácticamente cualquier cosa.</p>
                </blockquote>
                
                
              ')   
                  
           
           ),
           
           column(width = 4,
                  
       
                  br(),
                  img(src='code-820275_640.jpg', align = "right",  width = 400, height = 300)
           
           )
           ),
           
           
           fluidRow(
             
           column(width = 4,
                    
                    br(),
                    img(src='thought-2123970_640.jpg', align = "left",  width = 400, height = 300)
                    
                    
             ),    
             
            column(width = 8, 
                    
                    br(),
                    br(),
                    br(),
                    
                    HTML('
      
                
                <blockquote class="blockquote blockquote-reverse">
                <p>El área de text mining es relativamente nueva en la ciencia computacional, las aplicaciones hoy son varias, 
                van desde el análisis de redes sociales, inteligencia de negocio, mercadeo,  gerencia de riesgo, hasta la prevención de 
                cibercrímenes. Técnicas como la conglomeración, análisis de sentimientos, entre otras, son muy útiles 
                para extraer el conocimiento escondido en datos no estructurados, técnicas le permiten a la organización a 
                incrementar su competitividad.
                </p></blockquote>

                <blockquote class="blockquote blockquote-reverse">
                <i>"La creatividad es simplemente conectar cosas. Cuando le preguntas a las personas creativas como hicieron algo, 
                se sienten un poco culpables, porque en realidad no lo hicieron, simplemente vieron algo. Algo que después de 
                algún tiempo, les pareció obvio."</i>
                <footer class="blockquote-footer"><cite title="Source Title">STEVE JOBS</cite></footer>
                </blockquote>
     
                
              ')
                    
             )  
 
             
           ),
           
           
           
           
           
           fluidRow(
           
               
           HTML('
                
                <footer class="footer-distributed">

                <div class="footer-left">
                
                <h3>developed thanks to</h3>
                
                <p class="footer-links">

                <a href="https://www.r-project.org/">The R Project for Statistical Computing</a>
                <br>
                <a href="https://www.rstudio.com/">RStudio – Open source and enterprise-ready professional software for R</a>
                <br>
                <a href="https://shiny.rstudio.com/">Shiny from RStudio</a> 
                <br>
                <a href="https://www.shinyapps.io/">shinyapps.io by RStudio</a> 
                <br>
                <a href="https://startbootstrap.com/">Start Bootstrap</a> 
                <br> 
                <a href="https://tutorialzine.com/">Tutorialzine!</a> 
                </p>
                
                <p class="footer-company-name">tweetR &#174 2017</p>
                </div>
                
                <div class="footer-center">
                
                <div>
                <i class="fa fa-map-marker"></i>
                <p><span>Santa Isabel 353</span> Santiago, Chile</p>
                </div>
                
                <div>
                <i class="fa fa-phone"></i>
                <p>+56964835724</p>
                </div>
                
                <div>
                <i class="fa fa-envelope"></i>
                <p><a href="mailto:andresr424242@gmail.com">andresr424242@gmail.com</a></p>
                </div>
                
                </div>
                
                <div class="footer-right">
                
                <p class="footer-company-about">
                <span>about the app</span>
                Aplicación web interactiva en "Shiny" para el análisis la red social Twitter, Magister en Estadística 2016, Instituto de Estadística, PUCV.
                </p>
                <a href="http://www.estadistica.cl/">
                <img src="logo.png" width="250" height="200">
                </a>

                </div>



                
                </footer>
                
                
                ')  
 
             
             
           )

 
           ),#--------------> tabPanel             
             
                                     
  tabPanel("tweets",icon = icon("twitter"),

    fluidRow(
             
    column(width = 3,      
      
           HTML('
         
                
                
                <h3>tweets</h3>
                <p>Selecciona el twitter a analizar y la cantidad de tweets a descargar, recuerda 
                 que la aplicación permite descargar contenido de los <strong>últimos 7 días</strong>. 
                La distribución de los tweets por día puede variar según la frecuencia con la que se 
                escriba en el mismo.
                </p>
              
                
                
                
                '),       
    br(),       
                       
    sidebarPanel(width = 12,
      
    selectInput("target", "twitter a analizar:",
                  c(
                    "CAROLINA GOIC @carolinagoic" = "carolinagoic",
                    "JOSE ANTONIO KAST  @joseantoniokast" = "joseantoniokast",
                    "SEBASTIAN PINERA @sebastianpinera" = "sebastianpinera",
                    "ALEJANDRO GUILLIER @guillier" = "guillier",
                    "BEATRIZ SANCHEZ @labeasanchez" = "labeasanchez",
                    "MARCO ENRIQUEZ OMINAMI @marcoporchile" = "marcoporchile",
                    "EDUARDO ARTES @eduardo_artes" = "eduardo_artes",
                    "ALEJANDRO NAVARRO @navarrobrain" = "navarrobrain"
                    )
                  
                  ),
      
    br(),
      
    sliderInput("n", "tweets:", min = 1000, max = 3000, value = 2000),
    
    br(),
    
    dateRangeInput("daterange", "fecha:",
                   start = since,
                   end   = until),
    
      
    br(),
      
    
    
    HTML('
         
         <button id="go" type="button" class="btn action-button btn btn-primary btn-lg btn-block"><i class="fa fa-fw fa-twitter"></i> get tweets</button>
         
         ')
    
      
    )
    
    
    ),
    
    column(width = 9,
      
    br(),       
    DT::dataTableOutput("mytable")
      
    )  
 
    
  )  #---------->  row
  ), #----------> tabPanel
  
  
  
  
  tabPanel("top 10 retweets",icon = icon("reply-all"),  

  fluidRow(
             
  column(width = 3,
         
         HTML('
         
     
              <h3>top 10 retweets</h3>
              <p>De los tweets descargados tenemos aquellos 10 que registran el conteo más alto en el 
               campo <strong>"retweetCount"</strong>. Dar Re tweet significa copiar el tweet de otra 
              persona en nuestro perfil para que nuestros seguidores lo lean, se distingue por las 
              iniciales <strong>"RT"</strong> al comienzo del texto. Twitter almacena el número de 
              veces que el tweet es re twitteado.</p>

              
              ')
         
         
         ),
  
  column(width = 9,
    
    br(),
    DT::dataTableOutput("mytable_b")
    
  )
  
    
  )  #---------->  row
  ), #----------> tabPanel 
  
    
  tabPanel("frequent terms",icon = icon("bar-chart"),  
  
  fluidRow(
             
  column(width = 3,         
  
         
         HTML('
              
              
              <h3>frequent terms</h3>
              <p>Los términos frecuentes o "frequent terms" son aquellas palabras que más se repiten en los 
              tweets descargados. Se puede ajustar la frecuencia mínima de los términos a visualizar.</p>
              
              
              
              '),
  
  br(),                        
    
  sidebarPanel(width = 12,  
      
      sliderInput("lowfreq", "frecuencia mínima:", min = 50, max = 150, value = 75)          
             
    )
  
  ),
  
  column(width = 9, 
  
    br(),      
    plotOutput("frequent",width = "100%", height = "800px")        
           
  )
  
  ) #----------> row
  ),#----------> tabPanel
  
  
  tabPanel("wordcloud", icon = icon("cloud"), 
  
  fluidRow(
             
  column(width = 3, 
         
         
         HTML('
              
              
              <h3>wordcloud</h3>
              <p>La nube de palabras o "wordcloud" es una representación visual de los términos que componen 
              el texto de los tweets, pero ordenados en tamaño según su frecuencia, es decir las palabras 
              de mayor frecuencia poseen un mayor tamaño y viceversa.
              </p>
              
              
              
              '),
   
  br(),       
                    
  sidebarPanel(width = 12,
             
        sliderInput("freq", "frecuencia mínima:", min = 1,  max = 150, value = 1),
        
        br(),
        
        sliderInput("max","numero máximo de palabras:",min = 10,  max = 300,  value = 200)
        
           )
  
  ),
  
  column(width = 9, 
     
         br(),    
        plotOutput("cloud",width = "100%", height = "800px")
      
  )
 

  ) #-----------> row           
  ),#----------> Tabpanel


  tabPanel("network of terms",icon = icon("share-alt"),
 
  fluidRow(
             
  column(width = 3, 
         
         HTML('
              
              
              <h3>network of terms</h3>
              <p>La red de términos o "network of terms" es la representación visual de las correlaciones 
              existentes entre las palabras más frecuentes, se ajusta la <strong>frecuencia mínima</strong> 
              y la <strong>correlación límite</strong> o "corThreshold", las relaciones más fuertes 
              entre términos resaltan más y viceversa.
              </p>
              
              
              
              '),   
         
    br(),      
    
    sidebarPanel(width = 12,
      
      sliderInput("lowfreq2", "frecuencia mínima:", min = 50, max = 150, value = 50),
      
      br(),
      
      sliderInput("corThreshold", "correlación límite:", min = 0.01, max = 1, value = 0.25)
      
    ),
    
    br(),
    
          HTML('
              
              <p><small><h3>search correlations</h3></small></p>
              <p><small>Busca las correlaciones de los términos presentados en "network of terms".</small></p>
             
              
              '),
 
    
    sidebarPanel(width = 12,
    
      textInput("search", 'ingresa el término:', ''),
      br(),
      
      HTML('
         
           <button id="go_b" type="button" class="btn action-button btn btn-primary btn-lg btn-block"><i class="fa fa-fw fa-search"></i> search correlations</button>
           
           ')
                 
    )             
   
  ),
  
  column(width = 9,
  
    br(),     
    plotOutput("network",width = "100%", height = "600px"), 
    br(),
    verbatimTextOutput("network_b")
    
    
  )
  
  
    
  ) #----------> row
  ), #----------> tabpanel

  tabPanel("cluster",icon = icon("sitemap"),
  
  br(),         
  tabsetPanel(
    
  tabPanel("hierarchical cluster",            
           
  fluidRow(
             
  column(width = 3,
         
         
         HTML('
              
              
              <h3>hierarchical cluster</h3>
              <p>Un dendrograma es un diagrama de árbol que nos muestra los conglomerados y sus niveles de distancia, con el objetivo de crear grupos similares u homogéneos.
              Esta herramienta utiliza el algoritmo de conglomerado jerárquico o <strong>"hierarchical cluster"</strong> que se basa en el cálculo de distancias, la distancia por defecto es la <strong>"euclidiana"</strong>.
              Existen varios métodos que se pone a disposición.
              </p>
              
              <p><small><h3>remove sparse terms</h3></small></p>
              <p><small>La eliminación de términos dispersos o "remove sparse terms" depura la matriz para el análisis
              de aquellas palabras o términos con poca frecuencia, es decir palabras que son dispersas. Dispersión o <strong>"sparse"</strong>
              es un valor numérico para la espacialidad o dispersión máxima permitida, a mayor nivel de espacialidad,
              mayor el número de palabras que conserva la matriz y viceversa.
              Por defecto se fija al 0.99, permitiendo disminuir hasta un 0.95.
              </small></p>


              '), 
  
  br(),       
      
         
  sidebarPanel(width = 12,
               
               
         sliderInput("h_sparse","removeSparseTerms:", value = 0.99, min = 0.95, max = 0.99, step = 0.01),
         
         br(),       
         
         selectInput("h_distance", "distancia a usar:",
                     c(
                       "euclidean" = "euclidean",
                       "maximum" = "maximum",
                       "manhattan" = "manhattan",
                       "canberra" = "canberra",
                       "binary" = "binary",
                       "minkowski" = "minkowski"
                       
                     )
                     ),
                     
         br(),             
         
         selectInput("method", "método de aglomeración a usar:",
                     c(
                       "ward.D" = "ward.D",
                       "ward.D2" = "ward.D2",
                       "single" = "single",
                       "complete" = "complete",
                       "average" = "average",
                       "mcquitty" = "mcquitty",
                       "median" = "median",
                       "centroid" = "centroid"
                     
                     )
                     
         )
         )
  
  ),
  column(width = 9,
         
         br(),
         plotOutput("hcluster",width = "100%", height = "600px")   
         
         
  )
    
  ) #----------------> Row     
  ),#---------------> Tab
  
  tabPanel("kmeans cluster",
         
  fluidRow(
             
  column(width = 3,       
         
        
       HTML('
              
       
            <h3>kmeans cluster</h3>
            <p>K-medias o "kmeans" es un método para agrupar <strong>n</strong> observaciones en <strong>k</strong> grupos, 
            en donde cada grupo posee observaciones con valores medios cercanos o similares.
            Selecciona el número de grupos a formar.
            </p>

            <p><small><h3>remove sparse terms</h3></small></p>
            <p><small>La eliminación de términos dispersos o "remove sparse terms" depura la matriz para el análisis
            de aquellas palabras o términos con poca frecuencia, es decir palabras que son dispersas. Dispersión o <strong>"sparse"</strong>
            es un valor numérico para la espacialidad o dispersión máxima permitida, a mayor nivel de espacialidad,
            mayor el número de palabras que conserva la matriz y viceversa.
            Por defecto se fija al 0.99, permitiendo disminuir hasta un 0.95.
            </small></p>
       
       
           '),
           
  br(),     
  
  sidebarPanel(width = 12,
               
               
          sliderInput("k_sparse","removeSparseTerms:", value = 0.99, min = 0.95, max = 0.99, step = 0.01),
               
         br(),
  
         sliderInput("k", "número de clúster:", min = 1, max = 10, value = 4, step = 1)  
         
         
         )
         
         ),              
           
  column(width = 9,
         
             
    fluidRow( 
      
    column(width = 6,
    
    br(),       
    plotOutput("kcluster_c",width = "100%", height = "400px")
    
    ),
    
    column(width = 6,
    
    br(),              
    plotOutput("kcluster_d",width = "100%", height = "400px")       
    
    )
    
    ),
    
    
    verbatimTextOutput("kcluster_b")
  
    
             
    )
    
    )#-------------> Row
    )#-------------> Tab
    
  
  ) #----------> row
  ), #----------> tabpanel
  
  
  tabPanel("topic modeling",icon = icon("area-chart"),
           
  fluidRow(
  
  column(width = 3,
         
         HTML('
              
              
              <h3>topic modeling</h3>
              <p>El modelador de tópicos o "topic modeling" es una manera sencilla de analizar grandes 
              volúmenes de texto. Un <strong>tópico</strong> consiste en una conglomeración de palabras 
              que frecuentemente aparecen juntas. Se usa para descubrir estructuras semánticas en un vector 
              de texto. Se puede modelar ajustando el número de tópicos y los términos por tópico.
              </p>
     
              
              <p><small><h3>Latent Dirichlet Allocation (LDA)</h3></small></p>
              <p><small>En el procesamiento de lenguaje natural, LDA es un modelo estadístico generativo, 
              en el cual cada documento se ve como una mezcla de temas, el modelo propone que cada palabra
              en el documento es explicado o atribuido a un tema o tópico en particular.
              En el modelo generativo los documentos son mezclas aleatorias de temas <strong>latentes</strong>,
              donde cada tema tienen su distribución sobre las palabras que lo componen.
              </small></p>
       
           
              '), 
         
  br(),
           
  sidebarPanel(width = 12,
               
  sliderInput("topics", "tópicos:", 4, min = 2, max = 8, step = 1),
  
  br(),
  
  sliderInput("term", "término por tópico:", 4, min = 2, max = 6, step = 1)             
               
               )
  
  ),
  
  column(width = 9,
  
  br(),              
  plotlyOutput("topics_a",width = "100%", height = "500px"),
  br(),
  verbatimTextOutput("topics_b")
  
         
  )       
  
  
  
  ) #----------> row
  ), #----------> tabpanel
  
  
  tabPanel("devices",icon = icon("feed"),
  fluidRow(
  
  column(width = 3,
         
         HTML('
              
              
              <h3>devices</h3>
              <p>Twitter guarda el canal por el que fue enviado el tweet, que son los dispositivos o "devices".
              La gráfica nos indica que dispositivos son los más usados.
              A continuación te presentamos las definiciones de los canales menos comunes:</p>
              
              <p><small><h3>twitter web client</h3></small></p>
              <p><small>Es una herramienta web de gestión para clientes de Twitter,
              con funciones de automatización, seguimiento, entre otras.</small></p>
              
              <p><small><h3>tweetdeck</h3></small></p>
              <p><small>Es una herramienta para gestionar y controlar notificaciones, mensajes y 
              la actividad en general de una o varias cuentas de Twitter.</small></p>
              
              <p><small><h3>twitter lite</h3></small></p>
              <p><small>Es una versión reducida de la aplicación de Twitter, que ocupa menos almacenamiento y 
              gasta menos datos.</small></p>
              
              <p><small><h3>hootsuite</h3></small></p>
              <p><small>Es una plataforma diseñada para gestionar redes sociales, usada por personas 
              u organizaciones. </small></p>
              

           
              ') 
           
    ),
    
  column(width = 9,
         
        br(),   
        plotlyOutput("devices",width = "100%", height = "500px")
           
    ) 
    
    
  ) #----------> row
  ) #----------> tabpanel 
  
  
  )# ---------------> nav bar pages
)#----------> ui

