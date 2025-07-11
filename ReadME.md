# 📦 Apache Maven Setup for Windows

This project provides a **Windows batch script** to **download, install, and configure Apache Maven** automatically.  
It sets up the `MAVEN_HOME` environment variable and updates your system `PATH` permanently.

---

## ✅ What it does

- Downloads **Apache Maven 3.9.10** from the official Apache website.
- Extracts Maven to `C:\maven` (default location).
- Sets a system-level `MAVEN_HOME` environment variable.
- Adds Maven’s `bin` directory to your **system `PATH`**.
- Verifies the setup and reminds you how to check it.

---

## ⚙️ How to use

1. **Download or copy the `install.bat` file**

   Save the script as `install.bat`.

2. **Run as Administrator**

   > 📌 **Important:** You **must** run the script as **Administrator**  
   > to update system environment variables.

   - Right-click the file.
   - Select **Run as Administrator**.

3. **Wait for download & extraction**

   The script will:
   - Download Maven.
   - Extract it to `C:\maven`.
   - Set up `MAVEN_HOME` and `PATH`.

4. **Open a new terminal**

   After the script completes, run:
   ```bash
   mvn -v
