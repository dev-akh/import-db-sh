#!/bin/bash
HOSTNAME="localhost";
DBName="<<database_name>>";
DBUserName="root";
WORKING_DIR="C:/<<Path>>/DBfiles/20221002_2300_compact_version_5.mysql";
FILENAME="C:/<<Path>>/DBfiles/20221002_2300_compact_version_5.mysql.tgz"; 
STR_TO_REPLACE="";
MYSQL_DIRECTORY="C:/wamp64/bin/mysql/mysql5.7.39/bin";
SEPERATOR="============================================";
# #########################################################################################################
#removing file extension "tgz"
FILENAME_WITHOUT_EXTENSION=${FILENAME/.tgz/$STR_TO_REPLACE};
# #########################################################################################################
echo "File Name : " $FILENAME;
echo "File Name without extension : " $FILENAME_WITHOUT_EXTENSION;
echo $SEPERATOR;
# #########################################################################################################
# Change Working Directory
echo "Changing Working Directory to " $WORKING_DIR;
cd $WORKING_DIR;
echo $SEPERATOR;
# #########################################################################################################
#unzipping
echo "Unzipping ...";
tar -zxvf $FILENAME
echo $SEPERATOR;
# #########################################################################################################
# Replacing "Definer" from "Create View" statement with current user
echo "Replacing DEFINER from CREATE VIEW statement with current user ...";
sed -E "s/DEFINER=[^]+@[^]+/DEFINER=$DBUserName/g" $WORKING_DIR/$FILENAME_WITHOUT_EXTENSION/<<extracted_filename>>_views.sql > $WORKING_DIR/$FILENAME_WITHOUT_EXTENSION/<<extracted_filename>>_views_2.sql
# #########################################################################################################
#restoring database
echo "Restoring Database (Main DB) ...";
$MYSQL_DIRECTORY/mysql -h $HOSTNAME -u $DBUserName $DBName<$WORKING_DIR/$FILENAME_WITHOUT_EXTENSION/<<extracted_filename>>.sql
echo $SEPERATOR;

echo "Restoring Database (Structure Only tables) ...";
$MYSQL_DIRECTORY/mysql -h $HOSTNAME -u $DBUserName $DBName<$WORKING_DIR/$FILENAME_WITHOUT_EXTENSION/<<extracted_filename>>_extra.sql
echo $SEPERATOR;

echo "Restoring Database (Views) ...";
$MYSQL_DIRECTORY/mysql -h $HOSTNAME -u $DBUserName $DBName<$WORKING_DIR/$FILENAME_WITHOUT_EXTENSION/<<extracted_filename>>_views_2.sql
echo $SEPERATOR;
# #########################################################################################################
echo "Restoring Database Completed.";
# #########################################################################################################
