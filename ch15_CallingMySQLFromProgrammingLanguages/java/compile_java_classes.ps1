$env:classpath = ".;C:\Program Files\Java\jdk-20\lib;C:\Program Files\MySQL\JavaLib\mysql-connector-j-8.1.0.jar"

# javac MountainList.java
# java MountainList | Out-File MountainList.txt

# javac MountainNew.java
# java MountainNew
# java MountainList | Out-File MountainNew.txt

javac MountainAsia.java
java MountainAsia # | Out-File MountainAsia.txt

Remove-Item *.class