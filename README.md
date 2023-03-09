# Restoring Large DB dump file
## Exported SQL dump file as .tgz extension
## Parameters
- HOSTNAME="localhost";
- DBName="<< database_name >>";
- DBUserName="root";
- WORKING_DIR="C:/<< To_Work_Dir_Path >>";
- FILENAME="C:/<< Path >>/DBfiles/20221002_2300_compact_version_5.mysql.tgz"; 
- STR_TO_REPLACE="";
- MYSQL_DIRECTORY="C:/wamp64/bin/mysql/mysql5.7.39/bin";

## Note
- Replace the extracted `*.sql` filename to the << extracted_filename >>. 
- If there is only one file, remove other restoring lines.

============================================================================

Developed by, <a href="mailto:dev.aungkyawhtwe@gmail.com"> Aung Kyaw Htwe </a>;