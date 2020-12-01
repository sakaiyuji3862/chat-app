FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room
     # afterメソッドは任意の処理の後に指定の処理を実行することができます。
      # after(:build) とすることで、インスタンスがbuild(生成)された後に指定の処理を実行できます。
    after(:build) do |message|
      # io: File.openで設定したパスのファイル（public/images/test_image.png）を、
      # test_image.pngというファイル名で保存をしています。
      message.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end