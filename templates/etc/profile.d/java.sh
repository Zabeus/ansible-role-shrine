# {{ ansible_managed }}
export JAVA_HOME=/opt/{{ java_exploded_dirname }}
export JDK_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH
export MANPATH=$JAVA_HOME/man:$MANPATH
