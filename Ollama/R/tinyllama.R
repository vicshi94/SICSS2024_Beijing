# Define input and output
in_file <- "/Users/shixuanyu/Desktop/MAC/files/in.txt"
out_file <- "/Users/shixuanyu/Desktop/MAC/files/singleresult.txt"

# Read the lines from the input file
lines <- readLines(in_file)

# Open the output file for writing
file_conn <- file(out_file, open = "wt")

# Loop through each line and create the command
for (i in seq_along(lines)) {
  # Create the command
  command <- paste("echo", shQuote(lines[i]), "| ollama run tinyllama")
  
  # Print the command
  # print(command)
  
  # Execute the command and capture the output (intern = TRUE)
  result <- system(command, intern = TRUE)
  
  # Write the result to the output file
  separate_line <- paste('=============== Q&A ', i, '===============', sep = " ")
  writeLines(separate_line, file_conn)
  writeLines(paste('## Prompt:',shQuote(lines[i])), file_conn)
  writeLines(paste('## Result:'), file_conn)
  writeLines(result, file_conn)
  # writeLines("\n", file_conn)
}

# Close the output file connection
close(file_conn)
