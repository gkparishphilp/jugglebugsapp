r = Role.create name: 'godmin'

u = User.create email: 'gk@jugglebugsapp.com', name: 'Gk', password: '1234'
u.roles << r

u = User.create email: 'avery@jugglebugsapp.com', name: 'Avery', password: '1234'
u.roles << r

#hp = SwellMedia::Page.create title: 'Homepage', content: 'I am a Homepage', status: 'active'
