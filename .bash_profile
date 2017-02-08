# path settings
HOMEBREW=/usr/local/bin:/usr/local/sbin
M2_HOME=/usr/local/opt/apache-maven-2.2.1
M3_HOME=/usr/local/Cellar/maven/3.3.9
NODE=/usr/local/lib/node:/usr/local/lib/node_modules
GIT=/usr/local/git/bin
GEM=$(cd $(which gem)/..; pwd)
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH=/usr/local/bin:$HOMEBREW:$NODE:$GIT:$RBENV:$GEM:$PATH
export M2=$M2_HOME/bin
export M3=$M3_HOME/bin
export PATH=$M2:$PATH
#export PATH=$M3:$PATH
export MAVEN_OPTS="-Xms512m -Xmx1024m"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra used for settings I don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

#-------------------------------------------------------------
# Create New Virtual Host
#-------------------------------------------------------------
alias addvhost="sublime /Applications/MAMP/conf/apache/httpd.conf && sublime /etc/hosts"
