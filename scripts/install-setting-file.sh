
project_dir=$(cd $(dirname ${0}); pwd;)
project_dir=${project_dir/\/scripts/}
echo "project dir is "$project_dir
project_dir_yen=${project_dir//\//\\\\\\\\}
echo "project dir with \ is "$project_dir_yen

# generate users from cygdrive path
users=()
for val in $(ls /cygdrive)
do
    if [ -e /cygdrive/$val/Users ]
    then
	drive=$val
	users+=`ls /cygdrive/$val/Users|grep -v cyg|grep -vi public|grep -vi user|grep -vi default|grep -vi desktop`
    fi
done

echo "drive is "$drive

echo "user name is"
for user in $users
do
    echo " "$user
done

for user in $users
do
    sed $project_dir/settings/swSettings_general.sldreg -e s#@project_dir_slash@#${drive}\:\/cygwin64${project_dir}#gi \
	| sed -e s#@project_dir_yen@#${drive}\:\\\\\\\\cygwin64${project_dir_yen}#gi \
	| sed -e s#@user_dir@#${drive}\:\\\\\\\\Users\\\\\\\\${user}#gi \
	> $project_dir/settings/swSettings_${user}.sldreg
done

user=${users[0]}
echo "user name is "${user}
