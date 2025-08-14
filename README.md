🖥 Computer Cleanup and Repair Script
Author: Gemini
Type: Windows Batch Script (.bat)
Purpose: Perform quick computer maintenance tasks such as cleaning temporary files, flushing DNS cache, emptying the recycle bin, and repairing system files.

📋 Overview
This batch script automates a set of Windows maintenance tasks to help improve system performance and stability.
It is designed to:

Request Administrative Privileges – Ensures the script runs with full system permissions.

Flush DNS Cache – Clears any stored DNS entries to fix possible internet and connectivity issues.

Clean Temporary Files – Deletes unnecessary system and user temp files to free storage space.

Empty the Recycle Bin – Permanently removes files marked for deletion.

Scan and Repair System Files – Uses the sfc /scannow command to detect and repair corrupted Windows system files.

⚠️ Warnings
Permanent Deletion: Files in the Recycle Bin will be permanently erased. Make sure you no longer need them.

System Changes: The SFC tool may replace corrupted or modified system files.

Admin Rights Required: The script automatically asks for elevated privileges.

Not Reversible: Once files are deleted, they cannot be recovered through normal means.

📂 Included Commands & Functions
ipconfig /flushdns – Clears DNS cache.

del /q /f /s %TEMP%* and C:\Windows\Temp* – Deletes user and system temp files.

rd /s /q C:\$Recycle.Bin – Empties the recycle bin.

sfc /scannow – Scans and repairs protected system files.

🛠 How to Use
Save the Script
Copy the contents into a text file and save it with a .bat extension
(Example: CleanupAndRepair.bat).

Run as Administrator

Right-click the file → Run as administrator

The script will request elevation automatically if not already running as admin.

Follow the Prompts

Review the warning message presented.

Press any key to proceed.

Wait for Completion

The process can take several minutes, depending on system speed and the time required for sfc /scannow.

⏱ Estimated Duration
Task	Time Required
Flush DNS Cache	< 5 seconds
Cleaning Temporary Files	< 1 minute
Empty Recycle Bin	< 5 seconds
Run System File Checker	5–30 minutes
🧑💻 Notes
To stop midway, press CTRL + C and confirm, but this may leave some processes incomplete.

Compatible with Windows 7, 8, 8.1, 10, and 11 (admin rights required).

Best run when you are not using the PC for other heavy tasks.
