qKMeansCluster
==============

This is the r package used with the qKMeansClusterExtension to process data send from a QlikView Document to R and back.  The R package contains only one function called kmean which takes a json object called Data.  The R package is build in a way so that it will always send the exact data structre back to QlikView with a new column labeled fit.cluster.
