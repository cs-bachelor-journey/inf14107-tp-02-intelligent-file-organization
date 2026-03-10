# 📁 Intelligent File Organization – Linux Scripting Project

> **Université du Québec à Rimouski**  
> **Course:** INF14107 – Architecture des Systèmes Informatiques  
> **Assignment:** Travail 2 – Linux Scripting  
> **Topic:** Organisation Intelligente des Fichiers

---

## 🎯 Objective

Folders like `Documents` or `Downloads` often contain many files of different types: images, documents, audio, video, code, etc.  
Organizing files by type improves visibility and makes searching much easier — but doing this manually is time-consuming.  

**Goal:** Create a shell script that automates this file organization task.

---

## 📋 Part I: Basic File Organization Script (13 pts)

Write a Shell script that can be launched from the terminal to organize files by type into different folders. Also generate an information file containing a description of the organized folder.

### ✅ Required Tasks

1. **Create a `files/` directory** containing sample files to organize:
   - Images: `.png`, `.jpg`
   - Documents: `.odt`, `.txt`
   - Code: `.py`, `.php`, `.cpp`  
   *(See Figure 1.1 for reference)*  
   Place this folder in the same directory as your final script.

2. **Create a `.sh` script file** with:
   - A proper Shebang line (`#!/bin/bash`)
   - Executable permissions (`chmod +x script.sh`)

3. **Read the contents** of the `files/` directory and store filenames in an array using a `for` loop.

4. **Extract file extensions** from each filename (hint: use `${file##*.}`)

5. **Copy files** from `files/` into a new directory named `Files_$USER` (where `$USER` is the current username), created by the script.

6. **Filter and move files by extension** into categorized subfolders:
   ```
   Images:  .png, .jpg   → images/
   Docs:    .odt, .txt   → docs/
   Code:    .py, .php, .cpp → code/
   ```

7. **Generate an `info.txt` file** containing:
   - Number of files in `images/`
   - Number of files in `docs/`
   - Number of files in `code/`
   - Total number of files
   - Current date
   - Username (`$USER`)

### 🖼️ Expected Output

| Figure 1.1 – Initial State | Figure 1.2 – Final State |
|----------------------------|--------------------------|
| Mixed files in `files/`    | Organized subfolders + `info.txt` |

> Assemble all steps into a single, functional shell script that achieves the stated objective.

---

## 🚀 Part II: Advanced Configurable Script (2 pts)

Create a second, more flexible script that:

- Accepts a **custom directory path** as input (the folder to organize)
- Uses a configuration file named `extension.txt` to define file-type mappings

### 📄 Example `extension.txt` format:
```
Image: png, bmp, gif
Code: cs, php, cpp
Document: odt, txt, pdf
Audio: mp3, wav, flac
```

This allows the script to dynamically categorize files based on user-defined rules — making it reusable for any folder structure.

---

## 🛠️ Technical Requirements

- Language: Bash/Shell scripting
- Permissions: Script must be executable (`chmod +x`)
- Variables: Use `$USER`, parameter expansion `${file##*.}`, arrays, loops
- File operations: `mkdir`, `cp`/`mv`, `echo`, redirection `>`
- Portability: Should run on standard Linux terminals

---




