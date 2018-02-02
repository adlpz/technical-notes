# Add a package needed in yum

When provisioning a machine if a package is missing in yum, it can be built
from the `infra` repo doing:

`bin/package PACKAGE-NAME unstable`

If it complains the package is not valid add it to the array of valid packages
in bin/include/shared.sh

Then ssh into the machine and do:

`sudo yum clean all`

to flush the repos. Logout and do `vagrant provision` again.

# Fix aws credentials inside the VM for accessing the yum repo

If inside the VM the AWS credentials aren't there, with the credentials in the env
do:

`bin/ansible-playbook -i ansible/inventory/agencyportal-dev.ini ansible/playbooks/agencyportal/agencyportal.yml --tags aws-keys`

# Provision fails because it complains about no php-fpm pools

Just disable the step. Change the "Ensure php-fpm is running..." step to run `when: false`
on `ansible/roles/php/tasks/configure.yml`
