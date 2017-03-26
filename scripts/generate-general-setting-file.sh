
project_dir=$(cd $(dirname ${0}); pwd;)
project_dir=${project_dir/scripts/}
echo "project dir is "$project_dir

# generate users
users=()
usersdir=${USERPROFILE}/../
users+=`ls ${usersdir}|grep -v cyg|grep -vi public|grep -vi user|grep -vi default|grep -vi desktop`

echo "user name is"
for user in $users
do
    echo " "$user
done

user=${users[0]}
echo "user name is "${user}

# input file name is swSettings.sldreg
sed $project_dir/settings/swSettings.sldreg -e s#[^\"\;]*/solidworksconfig#@project_dir_slash@#gi \
    | sed  -e s#[^\"\;]*\\\\solidworksconfig#@project_dir_yen@#gi \
    | sed  -e s#[^\"\;]*\\\\${user}#@user_dir@#gi \
    > $project_dir/settings/swSettings_general.sldreg
