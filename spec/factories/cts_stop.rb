FactoryGirl.define do
  sequence(:code) {|n| n }
  sequence(:name) {|n| "Stop #{n}" }

  factory :cts_stop, class: Cts::Stop do
    code { generate(:code) }
    name { generate(:name) }
  end
end
