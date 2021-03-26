


library(shiny)


shinyServer(function(input, output, session) {

  
    #----------->  Data Frame, tdm y tweets en blanco
  
    rv_a <- reactiveValues(tweets.df = NULL)
    rv_b <- reactiveValues(tdm = NULL)
    rv_c <- reactiveValues(tweets = NULL)
    rv_d <- reactiveValues(corr = NULL)
 
  
    #----------->  Disable data range
    
    observeEvent(input$daterange, {
      shinyjs::disable("daterange")
    })
 
    
    #-----------> Data Frame con datos
 
    observeEvent(input$go, {
    
    #-------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    progress <- shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "tweets", value = 0)
    
    n <- 100
    
    for (i in 1:n) {
      dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
      progress$inc(10/n, detail = paste("downloading...", i))
      Sys.sleep(0.1)
    }
    
    
    #-------------> Data Frame
    
    tweets <- searchTwitteR(input$target, n=input$n, since = since , until = until)
    tweets.df <- twListToDF(tweets)
    
    #-------***reactive***-------->
    
    rv_a$tweets.df <- tweets.df[,c(5,1,12)]
    rv_c$tweets <- tweets
   
    
    #------------>  Corpus (Text Cleaning)
    
    myCorpus <- Corpus(VectorSource(tweets.df$text))
    
    #Special Word
    myCorpus <- replaceWord(myCorpus, "tod@s", "todos")
    myCorpus <- replaceWord(myCorpus, "l@s", "las")
    myCorpus <- replaceWord(myCorpus, "xq", "por que")
    myCorpus <- replaceWord(myCorpus, "uds", "ustedes")
    
    #Remover Retwitters
    myCorpus <- tm_map(myCorpus, content_transformer(removeRetweet))
    
    #Remover usuarios
    myCorpus <- tm_map(myCorpus, content_transformer(removeUser))
    
    #remove hashtags 
    myCorpus <- tm_map(myCorpus, content_transformer(removeHashtags))
    
    #Remover enlaces
    myCorpus <- tm_map(myCorpus, content_transformer(removeURL))
    
    #Remover puntuaciones
    myCorpus <- tm_map(myCorpus, content_transformer(removeNumPunct))
    
    #Cambiar a minusculas
    myCorpus <- tm_map(myCorpus, content_transformer(tolower)) 
    
    #Remover las stopwords
    myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
    
    #Remover las stopwords personalizadas
    myCorpus = tm_map(myCorpus, removeWords, sw)
    
    #Remover espacion en blanco extra.
    myCorpus <- tm_map(myCorpus, stripWhitespace)
    
    #Remover numeros
    myCorpus <- tm_map(myCorpus, removeNumbers)
    
    #Correccion tildes y enes
    myCorpus <- replaceWord(myCorpus, "á", "a")
    myCorpus <- replaceWord(myCorpus, "é", "e")
    myCorpus <- replaceWord(myCorpus, "í", "i")
    myCorpus <- replaceWord(myCorpus, "ó", "o")
    myCorpus <- replaceWord(myCorpus, "ú", "u")
    myCorpus <- replaceWord(myCorpus, "ñ", "n")

    
    
    #Build Term Document Matrix
    tdm <- TermDocumentMatrix(myCorpus,control = list(wordLengths = c(1, Inf)))
    
    #-------***reactive***-------->
    rv_b$tdm <- tdm
    
   
  })
    
    
  observeEvent(input$go_b, { 
    
    #-------------> Validate
    
    validate(
      need(rv_b$tdm , "")
    )
    
    
    #-------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    progress <- shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "correlations", value = 0)
    
    n <- 10
    
    for (i in 1:n) {
      dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
      progress$inc(1/n, detail = paste("loading...", i))
      Sys.sleep(0.1)
    }
    
    
    #-------***reactive***-------->
    
    
    rv_d$corr <- findAssocs(rv_b$tdm , input$search, input$corThreshold)
    
    
  })  
    
    
  output$mytable = DT::renderDataTable({
    
    #----------------> Validate Data 
    
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    #-------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    progress <- shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "table", value = 0)
  
    n <- 10
    
    for (i in 1:n) {
      dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
      progress$inc(1/n, detail = paste("loading...", i))
      Sys.sleep(0.1)
    }
    
    
    #-------------> Generate
    
    df <- as.data.frame(rv_a$tweets.df)
    
    
    DT<-datatable(df) %>%formatStyle('retweetCount',
                                     background = styleColorBar((df$retweetCount),'lightblue')
    )
    

    #------------> Go
    
    DT

    
    
  })
  
  
  
  output$mytable_b = DT::renderDataTable({
    
    #----------------> Validate Data 
    
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    #-------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    progress <- shiny::Progress$new()
    on.exit(progress$close())
    progress$set(message = "table", value = 0)
    
    n <- 10
    
    for (i in 1:n) {
      dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
      progress$inc(1/n, detail = paste("loading...", i))
      Sys.sleep(0.1)
    }
    
    
    #-------------> Generate
    
    tweets <- as.data.frame(rv_a$tweets.df)
    

    df <- sqldf('
            
            select distinct text, retweetCount
            from tweets
            where retweetCount > 0 and 
            leftstr(text,2) = "RT" 
            order by retweetCount desc limit 10
              
         
            ')
    
    DT<-datatable(df) %>%formatStyle('retweetCount',
                                     background = styleColorBar((df$retweetCount),'lightblue')
    )
    
    
    #------------> Go
    
    DT
    
    
  })
  

  

  output$frequent <- renderPlot({

    
    #----------------> Validate Data 
   
    validate(
      need(input$go, "please select a twitter to download")
    )

    #----------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'bar plot', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    
    #----------------> Generate 
    
    term.freq <- rowSums(as.matrix(rv_b$tdm))
    term.freq <- subset(term.freq, term.freq >= input$lowfreq)
    df <- data.frame(term = names(term.freq), freq = term.freq)
    
    t <-ggplot(df, aes(x=term, y=freq)) + 
      geom_bar(stat="identity", fill="steelblue") +
      xlab("Terms") + 
      ylab("Count") +
      ggtitle("frequent terms")+
      coord_flip() +
      theme(axis.text=element_text(size=9))
 
    
    #--------------> Go
    
    t
    
    
    
  })
  
  
  output$cloud <- renderPlot({
    
  
    
    #----------------> Validate Data 
    
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    
    #------------------> Progress
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'cloud', value = 0, {
      n <- 10
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
  
    #-----------------> Generate 
    
    m <- as.matrix(rv_b$tdm)
    word.freq <- sort(rowSums(m), decreasing = T)
    
    
    #-----------------> Go
    
    wordcloud(words = names(word.freq), 
              freq = word.freq, 
              min.freq = input$freq,
              max.words=input$max,
              random.order = F, 
              colors = brewer.pal(6, "Dark2")
              )
    
    
  })
  
  
  output$network <- renderPlot({
    
    
    
    #----------------> Validate Data 
    
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    #---------------------> Progress
    

    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'network', value = 0, {

      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    
    #----------------------->  Generate 
    
    
    freq.terms <- findFreqTerms(rv_b$tdm, lowfreq = input$lowfreq2)
    
    
    #---------------------->  Go
    
    plot(rv_b$tdm, 
         
         terms = freq.terms, 
         corThreshold = input$corThreshold, 
         weighting = T,
         main= "network of terms",
         
         attrs=list(node=list(
                              label="foo", 
                              fillcolor="#5edee5",
                              fontsize=25,
                              height=1.20,
                              width=1.20
                              ),
                    
                    edge=list(color="#1795bc",
                              width="0.2"
                              )
                    )
  
         )
    

  })
  
  output$network_b <- renderPrint({
  
    #----------------> Validate Data 
    
    
    validate(
      need(input$go_b, "please enter a term to search the correlations")
    )
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'terms', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    
    #----------------------->  Generate 
  
  
    c <- rv_d$corr
  
    
    #----------------------->  Go
    
    
    c
  
  
  })
  
  
  
  
  
  
  output$hcluster <- renderPlot({
  
  
   #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
  
   #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'hcluster', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
  
    tdm2 <- removeSparseTerms(rv_b$tdm, sparse = input$h_sparse)
    m2 <- as.matrix(tdm2)
    distMatrix <- dist(scale(m2),method = input$h_distance)
    fit <- hclust(distMatrix, method = input$method) 
  
    #----------------------> Go
  
    plot(fit, 
         
         main= "cluster dendrogram"
         
         )

  
  
  })
  
  
  
  output$kcluster_b <- renderPrint({
    
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'clusters results', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
    
    tdm2 <- removeSparseTerms(rv_b$tdm, sparse = input$k_sparse)
    m2 <- as.matrix(tdm2)
    m3 <- t(m2) 
    set.seed(2017) 
    k <- input$k
    kmeansResult <- kmeans(m3, k)
    
    #----------------------->  Go
    
    
    
    for (i in 1:k) {
      cat(paste("cluster ", i, ": ", sep = ""))
      s <- sort(kmeansResult$centers[i, ], decreasing = T)
      cat(names(s)[1:5], "\n")
      
    }
    
  })
  
  output$kcluster_c <- renderPlot({
  
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'plot clusters', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
    
    tdm2 <- removeSparseTerms(rv_b$tdm, sparse = input$k_sparse)
    m2 <- as.matrix(tdm2)
    m3 <- t(m2) 
    set.seed(2017) 
    k <- input$k
    kmeansResult <- kmeans(m3, k)
    mydata <- data.frame(m3, kmeansResult$cluster)

    #-----------------------> Go
    
    fviz_cluster(kmeansResult, data = mydata)+ 
      scale_color_brewer(palette = "Set2")+
      scale_fill_brewer(palette = "Set2") +
      theme_minimal()
  
  
  })
  
  
  
  output$kcluster_d <- renderPlot({
  
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'optimal clusters', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
    
    tdm2 <- removeSparseTerms(rv_b$tdm, sparse = input$k_sparse)
    m2 <- as.matrix(tdm2)
    m3 <- t(m2) 
    set.seed(2017) 
    
    
    #----------------------> Go
 
    fviz_nbclust(m3, kmeans, method = "wss",linecolor = "steelblue")
    

  })
  
  
  
  
  
  output$topics_a <- renderPlotly({
    
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'topics', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
    
    tweets.df <- as.data.frame(rv_a$tweets.df)
    dtm <- as.DocumentTermMatrix(rv_b$tdm)
    rowTotals <- apply(dtm , 1, sum) 
    dtm.new   <- dtm[rowTotals> 0, ]  
    lda <- LDA(dtm.new, k = input$topics) 
    term <- terms(lda, input$term)
    
    (term <- apply(term, MARGIN = 2, paste, collapse = ", "))
    topic <- topics(lda, 1)
    prueba1 <- data.frame(topic)
    prueba2 <- data.frame(date=(tweets.df$created))
    prueba3 <- merge(prueba1,prueba2, by='row.names' )
    
    
    p <- ggplot(prueba3, aes(x = date)) + 
         geom_density(aes(fill = term[topic]), alpha = 0.5)+
         ggtitle("topic modeling")
    
    #---------------------> Go
    
    ggplotly(p)
    
  
  })
  
  
  output$topics_b <- renderPrint({
  
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'topics', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #----------------------->  Generate 
    
    tweets.df <- as.data.frame(rv_a$tweets.df)
    dtm <- as.DocumentTermMatrix(rv_b$tdm)
    rowTotals <- apply(dtm , 1, sum) 
    dtm.new   <- dtm[rowTotals> 0, ]  
    lda <- LDA(dtm.new, k = input$topics) 
    
    #----------------------> Go
    
    (term <- terms(lda, input$term))
    
  
    
  })
  
  
  output$devices <- renderPlotly({
  
    #----------------> Validate Data 
    
    validate(
      need(input$go, "please select a twitter to download")
    )
    
    #---------------------> Progress
    
    
    dat <- data.frame(x = numeric(0), y = numeric(0))
    withProgress(message = 'devices', value = 0, {
      
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        incProgress(1/n, detail = paste("loading...", i))
        Sys.sleep(0.1)
      }
    })
    
    #---------------------> Generate
  
    devices <- sapply(rv_c$tweets, function(x) x$getStatusSource())
    

    devices <- gsub("","", devices)
    devices <- strsplit(devices, ">")
    devices<- sapply(devices,function(x) ifelse(length(x) > 1, x[2], x[1]))
    devices <- gsub("</a","", devices)
    
    
    devicesdf <- data.frame(devices)
    devicesdf$cantidad = 1
    devicesdf_b <- aggregate(cantidad ~ devices, data = devicesdf, sum)
  
  
    #---------------------> Go
    
    plot_ly(devicesdf_b, 
            labels = ~devicesdf_b$devices, 
            values = devicesdf_b$cantidad, 
            textinfo = 'label+percent',
            type = "pie") %>%
      layout(title = 'devices',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    
    

  
  })
  
   
}) #------> shinyServer