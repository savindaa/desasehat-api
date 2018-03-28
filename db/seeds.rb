# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


variable = Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin", role: "super_admin")
variable = Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi", role: "admin_edukasi")

variable = Village.create(name: "Condong Catur", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55283")
variable = Village.create(name: "Catur Tunggal", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55281")

variable = Article.create(title: "Artikel Edukasi",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus faucibus malesuada. Fusce condimentum dolor a tortor cursus, pulvinar varius nisl placerat. Vivamus gravida libero et quam blandit, non lobortis risus aliquet. Vestibulum augue felis, auctor quis euismod vitae, vehicula eget nulla. Ut ut rhoncus justo, sed vehicula felis. Aenean semper ipsum consequat, mollis tortor at, ornare lectus. Morbi faucibus et odio eu volutpat. Integer eleifend purus consectetur dolor tempus, eu egestas augue volutpat. Fusce vitae urna justo. Fusce quis leo condimentum urna pellentesque varius eget ac elit. Quisque quis elit sit amet magna scelerisque porta ac semper tellus. Donec vestibulum rutrum risus, vitae viverra metus feugiat nec. Duis rutrum viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ac ex gravida, volutpat turpis et, porttitor odio. Sed mollis vulputate  lorem et iaculis.",
  admin_id: 2)
