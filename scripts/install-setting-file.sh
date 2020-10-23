if [ -n "$WSL_DISTRO_NAME" ]; then
    echo wsl mode
    IS_WSL=1
else
    echo windows mode
fi

apparent_project_dir=$(cd $(dirname ${0}); pwd;)
apparent_project_dir=${apparent_project_dir/\/scripts/}
if [ $IS_WSL ];then
    project_dir=$(wslpath -w $(readlink -f ${apparent_project_dir}))
else
    project_dir=$(cygpath -w ${apparent_project_dir})
fi
## Since cygpath converted white space to unspecified symbol,
## next command is neccessary to reconvert it to white space
echo "apparent project dir is "$apparent_project_dir
project_dir=$(echo ${project_dir})
echo "project dir is "$project_dir
project_dir_yen=${project_dir//\\/\\\\\\\\}
echo "project dir with \ is "$project_dir_yen
project_dir_slash=${project_dir//\\/\/}
echo "project dir slash is "$project_dir_slash

if [ $IS_WSL ]; then
    user=$(/mnt/c/Windows/System32/cmd.exe /c echo %USERPROFILE% | nkf -Lu | sed -e 's#^.*\\##')
else
    user=${USERPROFILE##*\\}
fi
user_no_space=${user/ }
user=${user/ /\\ }
echo "user name is "${user}

sed "${apparent_project_dir}"/settings/swSettings_general.sldreg -e s#@project_dir_slash@#"${project_dir_slash}"#gi \
| sed -e s#@project_dir_yen@#"${project_dir_yen}"#gi \
| sed -e s#@user_dir@#"${drive}\:\\\\Users\\\\${user}"#gi \
> "${apparent_project_dir}"/settings/swSettings_${user_no_space}.sldreg
