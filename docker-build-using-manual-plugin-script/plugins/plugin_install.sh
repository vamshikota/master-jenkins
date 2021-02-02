plugin_path="/usr/share/jenkins/ref/plugins"
mkdir ${plugin_path}; cd ${plugin_path}

cp /tmp/plugins/plugins.txt ${plugin_path}
plugin_list="${plugin_path}/plugins.txt"
plugin_url="https://updates.jenkins-ci.org/download/plugins"

while read line; do
    plugin=${line%%:*}
    version=${line##*:}
    wget ${plugin_url}/${plugin}/${version}/${plugin}.hpi -O ${plugin}.jpi
done < ${plugin_list}