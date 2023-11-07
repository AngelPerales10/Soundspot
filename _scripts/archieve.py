import subprocess

def move_files():
    source_folder = "C:\\locationofsoundspot\\soundspot\\upload"
    destination_folder = "C:\\locationofsoundspot\\soundspot\\uploaded_songs"

    movecommand = f'move "{source_folder}\\*.mp3" "{destination_folder}"'
    subprocess.run(movecommand, shell=True)

move_files()