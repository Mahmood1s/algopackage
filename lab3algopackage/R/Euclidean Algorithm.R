#euclidean Algorithm

#' find greatest common divisor of two numbers.
#'
#' @param first_num A number.
#' @param second_num A number.
#' @return The greatest common divisor of \code{first_num} and \code{second_num}.
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)


euclidean<- function(first_num,second_num){
temp_num<-0
stopifnot(is.numeric(first_num),is.numeric(second_num))
  repeat{
    if(second_num==0){
      break
    }
    temp_num<-first_num%%second_num
    first_num<-second_num
    second_num<-temp_num
  }
  return(first_num)
}
