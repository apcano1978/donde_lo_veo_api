Role.create_with(name: "admin").find_or_create_by(code: 'admin')
Role.create_with(name: "user").find_or_create_by(code: 'user')
