# YARN - view application info
yarn application -list -appStates RUNNING  > application_list.txt
yarn application -list | grep -ie $(whoami)

yarn application -kill <application_id>

yarn logs -applicationId <application_id> > <application_id>.log

# Start with cloning the HDFS Project
# HDFS list commands to show all the directories in current directory "/" ("-h" = human)
hdfs dfs -ls -h /
# or
hadoop fs -ls -h /apps/hive/database.db

# Create a new directory inside HDFS using mkdir tag.
hdfs dfs -mkdir -p /user/root
# or
hadoop fs -mkdir /user/root

# Generates a file in HDFS with a file size corresponding to 0 bytes
hadoop fs -touchz /user/bruszewski/input.txt

# Copy the files to the input path in HDFS.
hadoop fs -copyFromLocal /var/lib/sqoop /user/bruszewski
# Read a CSV file into Spark DataFrame
# spark.read.csv('/user/bruszewski/input.csv', header=True, inferSchema = True)

# To copy files/folders from hdfs store to local file system.
hdfs dfs -copyToLocal /user/bruszewski/input.txt .

# To print file contents.
hdfs dfs -cat /user/bruszewski/input.txt
# or
hadoop fs -tail /user/bruszewski/input.txt

# This command is used to copy files within hdfs.
hdfs dfs -cp -f /user/bruszewski/conda_venv.tar.gz /apps/data/envs

# Remove directory
hdfs dfs -rm -r /user/bruszewski/input.txt

# Remove file
hdfs dfs -rm -r -skipTrash /user/bruszewski/input.csv

# Finding all files which match the mentioned
hadoop fs -find /apps/hive/ -name abt_spark -print

# We are using the stat command to print the information about file ‘input.txt’ present in the dataflair directory of HDFS.
hadoop fs -stat %y /user/bruszewski/input.txt

# %b – file size in bytes
# %g – group name of owner
# %n – file name
# %o – block size
# %r – replication
# %u – user name of owner
# %y – modification date

# Check a HDFS directory's size
hadoop fs -du -s -h /apps/hive/database.db

# Here in this example, we are trying to find ‘input.txt’ file in HDFS.
hadoop fs -find / -name input* -print

# HDFS Command to count the number of directories, files, and bytes under the paths that match the specified file pattern.
hadoop fs -count /user/bruszewski

# This command will give the total size of directory/file.
hdfs dfs -du -s /user/bruszewski

# <size>, <disk space consumed with all replicas>
hdfs dfs -du -s -h /apps/hive/database.db

# disk usage
hdfs dfs -du -h /apps/hive/database.db

# In this example, we are trying to check the health of the files in '/user/root' directory present in HDFS using the fsck command.
hadoop fsck /user/bruszewski -files

# Check hadoop server name
hadoop fsck /tmp/
# Connecting to namenode via http://...

# The Hadoop fs shell command df shows the capacity, size, and free space available on the HDFS file system.
hadoop fs -df

# To check the Hadoop services are up and running
jps

# Show hadoop version
hadoop version

# Run a jar file
hadoop jar <jar>