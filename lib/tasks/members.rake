namespace :create_members_with_friends do
  desc 'Create several members with two friends'

  task create_members: :environment do
    member1 = Member.create!(name: 'Leonard Euler')
    member2 = Member.create!(name: 'Emma Watson')
    member3 = Member.create!(name: 'Roger Federer')
    member4 = Member.create!(name: 'John Locke')
    member5 = Member.create!(name: 'George Harrison')

    member1.friends.create!(name: 'Carl Friederich Gaus', email: 'c.f.gaus@friendlist.com')
    member1.friends.create!(name: 'Albert Einstein',      email: 'albert.einstein@friendlist.com')

    member2.friends.create!(name: 'Rupert Grint',         email: 'ruper.grint@friendlist.com')
    member2.friends.create!(name: 'Bonny Wright',         email: 'bonnie.wright@friendlist.com')

    member3.friends.create!(name: 'Novak Djokovic',       email: 'novak.djokovic@friendlist.com')
    member3.friends.create(name: 'Stan Wawrinka',        email: 'stan.wawrinka@friendlist.com')

    member4.friends.create!(name: 'Kate Austen',          email: 'kate.austen@friendlist.com')
    member4.friends.create!(name: 'Desmond Hume',         email: 'desmond.hume@friendlist.com')

    member5.friends.create!(name: 'Ringo Starr',          email: 'ringo.starr@friendlist.com')
    member5.friends.create!(name: 'John Lennon',          email: 'john.lennon@friendlist.com')

    puts 'Members and their friends successfully created!'
  end
end

