# Linux/macOS: "ps aux | grep python"
import subprocess

# Command 1: List all processes
ps_process = subprocess.Popen(["ps", "aux"], stdout=subprocess.PIPE)

# Command 2: Filter for "python" (using output from ps_process)
grep_process = subprocess.Popen(
    ["grep", "python"],
    stdin=ps_process.stdout,
    stdout=subprocess.PIPE,
    text=True
)

# Close the first process's output to avoid hangs
ps_process.stdout.close()

# Get the final result
output = grep_process.communicate()[0]
print("Python processes:\n", output)
