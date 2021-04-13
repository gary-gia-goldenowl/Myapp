require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(first_name: "Gia", last_name: "Ha Gia Huy", email: "abc@gmail.com", gender: "male", age: 15, role: "user",) }
  before { subject.save }

  it "Name should be presence" do 
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "Name should be presence" do 
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "Email should be valid value" do 
    subject.email = "abc"
    expect(subject).to_not be_valid
  end

  it "Gender should be valid value" do 
    subject.gender = "none"
    expect(subject).to_not be_valid
  end

  it "Age should be valid value" do 
    subject.age = -5
    expect(subject).to_not be_valid
  end

  it "Role should be valid value" do 
    subject.role = "customer"
    expect(subject).to_not be_valid
  end

end
