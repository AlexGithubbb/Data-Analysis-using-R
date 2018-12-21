id <- 1:15
age <- c(22, 60, 45, 38, 36, 48, 44, 38, 40, 38, 32, 37, 44, 39, 41)
name <- c("mathew", "Rick", "ZacK", "Ravi", "Liana",
          "Keith","Armen", "ANson", "Bryan", "MD",
          "Vish", "Pons", "Neil", "Chris", "Som")
x <- data.frame(id, age, name)

alexlist <- list(23,"haha", c(1:3),"simon",x )
alexlist

names(alexlist) <- c("adsf","favjuice","favvector","goodfood","favdata")
alexlist[["favvector"]]
alexlist[["goodfood"]]
alexlist[["adsf"]]
alexlist[["favdata"]]$name
alexlist[["favdata"]]$age

length(alexlist)
alexlist[["sistersName"]] <- "hanna"
length(alexlist)