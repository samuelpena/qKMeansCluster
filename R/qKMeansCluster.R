#' K Means a Dataset
#' 
#' Takes in any data table and does a k means cluster to the data
#' @param Data A data table to be clustered 
#' @return The data with the fit cluster field
#' @export
kmean<-function(Data)
{
  #Convert JSON to data frame
  df<-data.frame(Data$data)
  
  #find and remove all the dimensions
  #https://www.biostars.org/p/10143/
  dimensionCount<-length(which(Data$type == 'dimension'))
  
  #Remove the first column due to dimension 
  #Run Kmeans Clustering to the dataframe with the Cluster Group
  #apply the kmeans cluster to numeric only
  fit <- kmeans(df[dimensionCount*-1], Data$cluster$group)
  
  # append cluster assignment
  df<-data.frame(df, fit$cluster) 
  
  #return the original dataset with the fit.cluster column
  return(df)
}