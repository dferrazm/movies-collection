FactoryGirl.define do
  factory :picture do
    image { sample_file }
    movie
  end
end
