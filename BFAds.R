# Create files to write to
if(!file.exists('titles.txt')){
        file.create('titles.txt')
}
if(!file.exists('links.txt')){
        file.create('links.txt')
}

# Write out titles and urls to files
BF_ads <- function(){
        library(XML)
        url <- 'http://www.buzzfeed.com/trending'
        
        doc <- htmlParse(url)
        
        titles <- xpathSApply(doc, "//div[@class='trending-post-text']//a", xmlValue)
        
        # Put in a delimiter for easy parsing later
        titles <- paste0(titles, ';')
        links  <- xpathSApply(doc, "//li//a[@class='trending-post-image']", xmlGetAttr, 'href')
        links  <- paste0('www.buzzfeed.com', links, ';')
        
        cat(titles, file='titles.txt', append=T)
        cat(links,file='links.txt', append=T)
}

# Run
BF_ads()