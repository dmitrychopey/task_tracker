# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Role.delete_all
    User.delete_all
    Status.delete_all

    u = User.new(email:"user@email.com", password:"12345678")
    u.add_role "superadmin"
    u.save!

    u2 = User.new(email:"user2@email.com", password:"12345678")
    u2.add_role "worker"
    u2.save!

	Status.create(title:"New")
	Status.create(title:"In Progress")
	Status.create(title:"Resolved")
	Status.create(title:"Closed")

