options(echo=FALSE)
args <- commandArgs(trailingOnly=TRUE)
output="result_motif.dat"
data <- read.table(args, sep="\t")

for (i in 1:nrow(data)) {
	dat <- matrix(c(data[i,2], data[i,3], data[i,4], data[i,5]), nrow=2, byrow=F)
	result <- fisher.test(dat, alternativ = "g")
	result_p <- result$p.value
	
	w <- paste(data[i,1],data[i,2],data[i,4],result_p, sep = "\t")
	write(w, file = output, ncolumns = 1,append = TRUE)
}

q()

