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

echo "apparent project dir is "$apparent_project_dir
echo "project dir is "$project_dir

if [ $IS_WSL ]; then
    user=$(/mnt/c/Windows/System32/cmd.exe /c echo %USERPROFILE% | nkf -Lu | sed -e 's#^.*\\##')
else
    user=${USERPROFILE##*\\}
fi
user_no_space=${user/ }
user=${user/ /\\ }
echo "user name is "${user}

# input file name is swSettings.sldreg
sed ${apparent_project_dir}/settings/swSettings.sldreg -e s#[^\"\;]*/solidworksconfig#@project_dir_slash@#gi \
    | sed  -e s#[^\"\;]*\\\\solidworksconfig#@project_dir_yen@#gi \
    | sed  -e s#[^\"\;]*\\\\${user}#@user_dir@#gi \
    > ${apparent_project_dir}/settings/swSettings_general.sldreg
