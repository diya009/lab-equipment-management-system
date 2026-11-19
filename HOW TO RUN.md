# How to Run — Super Simple Guide

Just two steps. Really.

---

## Step 1 — Install Java (one time only)

1. Open this link in your browser:
   **https://adoptium.net/**
2. Click the big blue **"Latest LTS Release"** download button.
   (It automatically picks the right file for Windows.)
3. When the file finishes downloading, **double-click it** to open the installer.
4. Keep clicking **Next**. On the "Custom Setup" screen, make sure these two options are set to **"Will be installed on local hard drive"**:
   - **Add to PATH**
   - **Set JAVA_HOME variable**
   (They usually already are — just check.)
5. Click **Next → Install → Finish**.

That's it for Step 1. You never need to do this again.

---

## Step 2 — Run the app

1. Open the project folder.
2. **Double-click `Start App.bat`**.
3. A black window will flash, and then the app window will open.
4. Log in with:
   - **Username:** `admin`
   - **Password:** `admin123`

The database and sample equipment are created automatically the first time you run it. From then on, your data stays in the `data` folder inside the project.

---

## That's it. There's no database to install.

This version uses a tiny built-in database (H2) that lives inside the project folder. **You do NOT need to install MySQL.** You do NOT need to set any password. You do NOT need to edit any file.

Just Step 1, then Step 2.

---

## If something doesn't work

**The window flashes and closes instantly**
Open Command Prompt (press Windows key, type "cmd", hit Enter), then type:
```
cd "C:\path\to\the\folder"
"Start App.bat"
```
(Replace the path with wherever you put the folder.) The error will stay on screen so you can read it.

**It says "Java is not installed"**
Go back to Step 1. After installing, **restart your computer** and try again — Windows needs a reboot to notice new PATH entries sometimes.

**"Access denied" or a Windows SmartScreen warning**
Right-click `Start App.bat` → **Properties** → tick **Unblock** at the bottom → OK. Then double-click again.

**You want to move the folder to the Desktop or somewhere else**
Totally fine. Just keep ALL the files inside the folder together.

---

Login: **admin** / **admin123**
