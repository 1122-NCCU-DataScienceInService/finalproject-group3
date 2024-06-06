import os

def list_files(startpath):
    with open("folder_structure.txt", "w") as f:
        for root, dirs, files in os.walk(startpath):
            level = root.replace(startpath, '').count(os.sep)
            indent = ' ' * 4 * (level)
            f.write('{}{}/\n'.format(indent, os.path.basename(root)))
            subindent = ' ' * 4 * (level + 1)
            for file in files:
                f.write('{}{}\n'.format(subindent, file))

# Replace with your directory
startpath = r"C:\Users\fortu\OneDrive - National ChengChi University\Github_0422\finalproject-group3"
list_files(startpath)
