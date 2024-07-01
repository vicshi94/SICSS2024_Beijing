import os

# Define input and output paths
IN_FILE = "/Users/shixuanyu/Desktop/MAC/files/in-research.txt"
OUT_FILE = "/Users/shixuanyu/Desktop/MAC/files/output/pyresult.txt"

# Read the lines from the input file
with open(IN_FILE, 'r') as file:
    lines = file.readlines()

# Open the output file for writing
with open(OUT_FILE, 'w') as file_conn:
    # Loop through each line and create the command
    for i, line in enumerate(lines, start=1):
        # Create the command
        command = f'echo {line.strip()} | ollama run llama3'
        
        # Print the command for debug purposes
        # print(command)
        
        # Execute the command and capture the output
        result = os.popen(command).read()
        
        # Write the result to the output file
        separate_line = f'========= Q&A {i} ========='
        file_conn.write(separate_line + '\n')
        file_conn.write(f"## Prompt: {line.strip()}." + '\n')
        file_conn.write('## Answer:' + '\n')
        file_conn.write(result + '\n')
