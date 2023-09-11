$env:path += "C:\Program Files\Java\jdk-20\bin:$env:path"
$env:classpath = ".;C:\Program Files\Java\jdk-20\lib;C:\Program Files\MySQL\JavaLib\mysql-connector-j-8.1.0.jar"

javac MountainList.java
java MountainList

Remove-Item *.class