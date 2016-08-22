FactoryGirl.define do
  factory :message do
    sequence(:body) { |n| "Message #{n}" }
    chatroom
    user
  end
end
