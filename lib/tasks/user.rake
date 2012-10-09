namespace :user do
  task :create => :environment do |t, args|
    # XXX: id.to_s == container_user_id
    i = (User.maximum(:id) || 0) + 1
    user = User.create(container_user_id: "#{i}", nickname: "user_#{i}")
    puts "#<User id: #{user.id}, container_user_id: \"#{user.container_user_id}\", nickname: \"#{user.nickname}\"> created."
  end
end

