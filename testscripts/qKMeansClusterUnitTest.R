#' K Means Unit Test
#' Simulating test data that Qlik will send to opencpu to validate the R code is working
#' 
#' Load in the necessary Libraries
library("rjson", lib.loc="~/R/win-library/3.1")
library("qKMeansCluster", lib.loc="~/R/win-library/3.1")

#' Simulating test data that Qlik will send to openCPU
QlikJson <- 
  '{"data":{
  "Zip Code":["11557","11727","11747","11001","11520","11363","11756","11780","11428","11769","11702","11755","11216","11753","11959"],
  "count(distinct [Order Number])":["11","30","33","73","23","19","45","31","3","7","29","11","14","25","4"],
  "Sum(Sales)/count(distinct [Order Number])":["88.856363636364","70.356666666667","83.288484848485","103.57520547945","122.01347826087","75.481052631579","70.09","86.162580645161","142.68","188.64142857143","112.47275862069","128.91181818182","86.039285714286","108.6936","125.0975"],
  "count(distinct [Customer])":["11","27","33","66","23","17","42","27","3","7","29","10","13","18","4"]
},
"type":{
  "Zip Code":"dimension",
  "count(distinct [Order Number])":"dimension",
  "Sum(Sales)/count(distinct [Order Number])":"expression",
  "count(distinct [Customer])":"expression"
},
"cluster":{
   "group":"5"
  }
}'

#' OpenCPU will automatically convert it to a list using fromJSON
OpenCpuData <- fromJSON(QlikJson)

#' List is pass to the function and return back to Qlik in JSON format
kmean(OpenCpuData)
