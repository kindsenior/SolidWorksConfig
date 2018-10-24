project_dir=$(cd $(dirname ${0}); pwd;)
project_dir=$(cygpath -w ${project_dir/\/scripts/})
## Since cygpath converted white space to unspecified symbol,
## next command is neccessary to reconvert it to white space
project_dir=$(echo ${project_dir})
echo "project dir is "$project_dir
project_dir_yen=${project_dir//\\/\\\\\\\\}
echo "project dir with \ is "$project_dir_yen
project_dir_slash=${project_dir//\\/\/}
echo "project dir slash is "$project_dir_slash

user=${USERPROFILE##*\\}
user_no_space=${user/ }
user=${user/ /\\ }
echo "user name is "${user}

sed "${project_dir}"/settings/swSettings_general.sldreg -e s#@project_dir_slash@#"${project_dir_slash}"#gi \
| sed -e s#@project_dir_yen@#"${project_dir_yen}"#gi \
| sed -e s#@user_dir@#"${drive}\:\\\\Users\\\\${user}"#gi \
> "${project_dir}"/settings/swSettings_${user_no_space}.sldreg
