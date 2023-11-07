import subprocess

# Function to execute the command for each link
def download_sc(link):
    sccommand = f"scdl -l {link} --original-art"
    subprocess.run(sccommand, shell=True)

def download_sd(link):
    sdcommand = f"spotdl {link}"
    subprocess.run(sdcommand, shell=True)

def move_files():
    source_folder = ""
    destination_folder = ""

    movecommand = f'move "{source_folder}\\*.mp3" "{destination_folder}"'
    subprocess.run(movecommand, shell=True)

# Read links from the file and execute the appropriate command for each link
file_path = ""

try:
    with open(file_path, "r") as file:
        links = file.readlines()
        for link in links:
            link = link.strip()  # Remove leading/trailing whitespaces, newlines, etc.
            if "spotify" in link.lower():
                download_sd(link)
            elif "soundcloud" in link.lower():
                download_sc(link)
            else:
                print(f"Unrecognized link: {link}")

except FileNotFoundError:
    print(f"Error: File '{file_path}' not found.")
except Exception as e:
    print(f"An error occurred: {e}")

move_files()