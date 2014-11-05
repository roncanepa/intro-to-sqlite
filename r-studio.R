# if not installed, you'll want to install the RSQLite package
library(RSQLite)

# this tells R what sort of "language" we'll be speaking (ie., what R will be talking to)
drv <- dbDriver("SQLite")

# the next line gives us the actual "object" that represents the link between R and the database.
# This file needs to exist, etc, or else this won't work. So check your paths and names.
#
# Note that "con" is just a variable name, so you can call it whatever you'd like.  This
# is often extra helpful if you're working with 2 different databases at the same time. You
# can give them more meaningful names besides "con1" and "con2". 
#
# Tip: the extension of the database can be *.db, *.sqlite, *.sqlite3, or no extention at all.
#
# 


###########################
# NOTE NOTE NOTE NOTE NOTE
#NOTE NOTE NOTE: You need to update this path to match your own system!
# mine is: 
#con <- dbConnect(drv, "/Users/agnor/Documents/working/intro to sqllite/sample.sqlite")
con <- dbConnect(drv, "/put/the/full/path/to your database/here/db.sqlite")


raw_data = dbGetQuery(con, "SELECT Customer.*, Invoice.* FROM customer 
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
ORDER BY CustomerId ASC")

# Now raw_data is an R dataframe and you can do whatever you would usually do in R from here. Yay!
# Example:  Try typing summary(raw_data) and hitting <enter> in the R studio console.