p 'Writing Roles'
r = Role.find_or_create_by_name_and_approval_required_and_user_role_and_application('Dashboard', false, false, 'facho')
p "#{r.name} - #{r.application}"
r = Role.find_or_create_by_name_and_approval_required_and_user_role_and_application('Admin', true, false, 'facho')
p "#{r.name} - #{r.application}"
r = Role.find_or_create_by_name_and_approval_required_and_user_role_and_application('Health Oficer', true, true, 'facho')
p "#{r.name} - #{r.application}"