#dijkstra Algorithm

#' find shortest path between two nodes.
#'
#' @param my_df A data frame with two vertices and their weights.
#' @param init_node A number as starting node.
#' @return The shortest path vector from \code{init_node} to all other nodes.
#' @examples
#' v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6)
#' v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5)
#' w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#' wiki_graph <-data.frame(v1,v2,w)
#' dijkstra(wiki_graph, 1)
#' dijkstra(wiki_graph, 3)


dijkstra<- function(my_df,init_node){

  #stop if my_df is not a dataframe
  stopifnot(is.data.frame(my_df),ncol(my_df)==3,!any(is.na(my_df[,])))

  #get the number of nodes in graph
  node_range<- unique(my_df[,1],incomparables = FALSE)

  #stopif init_node is not with graph range
  stopifnot(init_node %in% node_range)

  #converting data.frame to matrix
  my_matrix<-convert_to_matrix(my_df,node_range)

  #initialize all the distanes with infinity
  distances<-rep(Inf,length(node_range))

  #initialize all the node to not visited yet to FALSE
  node_visited<-rep(FALSE,length(node_range))

  #set the source node to source node distance which is 0
  distances[init_node]<-0

  #loop for finding shortest path for all vertices
  for(outr in 1:(length(node_range)-1))
  {
    min_cur_node<-minimum_path_function(distances,node_visited)
    node_visited[min_cur_node]<-TRUE

    #loop to update the path of subjected vertex
    for (iner in 1:length(node_range))
    {
      if(node_visited[iner]==FALSE & my_matrix[min_cur_node,iner]!=0 & !is.infinite(distances[min_cur_node]))
      {
        if(sum(distances[min_cur_node],my_matrix[min_cur_node,iner])<distances[iner])
          distances[iner]<-distances[min_cur_node]+my_matrix[min_cur_node,iner]
      }
    }
  }

  return(distances)
}

minimum_path_function<- function(distance_vector,visited){
  minimum<-Inf
  min_index=0

  for(i in 1:length(distance_vector)){
    if(visited[i]==FALSE & distance_vector[i]<=minimum){
      minimum<-distance_vector[i]
      min_index<-i
    }
  }
  return(min_index)
}

convert_to_matrix<- function(df,node_range){

  my_matrix<-matrix(c(0:0),ncol=length(node_range),nrow = length(node_range),byrow = TRUE)
  my_row<-1
  #converting data to matrix
  for(i in 1:length(node_range))
  {
    for(j in 1:length(node_range))
    {
      if(df[my_row,1]==i & my_row<=length(df[,1]))
      {
        my_matrix[df[my_row,1],df[my_row,2]]<-df[my_row,3]
        my_row<-my_row+1
      }
    }
  }
  return(my_matrix)
}





