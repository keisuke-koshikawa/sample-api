ActiveRecord::Base.transaction do
  user = User.create!(
    name: 'テストユーザー1',
    nickname: 'テスト',
    email: 'test-user+1@example.com',
    password: 'password'
  )

  puts "successed create #{user.name}"

  5.times do
    post = Post.new(
      user: user,
      title: 'SPA作ってみた',
      body: 'こんにちは！テストユーザー1です。今回はRails APIモードとVue.js 3 + TypeScriptを使って、SPAを作ってみましたので、紹介をさせてください。'
    )
    post.icatch.attach(io: File.open(Rails.root + 'db/seed_data/vue-rails.png'), filename: 'vue-rails.png')
    post.save!
  end
end