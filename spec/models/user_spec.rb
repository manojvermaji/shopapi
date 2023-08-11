require 'rails_helper'

RSpec.describe User, type: :model do

  subject { 
    described_class.new(name:"anything",
    username:"manoj@123", email:"manoj@123gmail.com", password:"123456")
   } 






  it " is valid with valid attribute" do
    expect(subject).to be_valid
  end 
  # it " is not valid without a name " do
  #   subject.name = nil
  #   expect(subject).to be_valid
  # end  

  it " is not valid wihtout a username " do
    subject.username = nil
    expect(subject).to_not be_valid
  end
  it " is not valid without email " do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a password " do
    subject.password = nil
    expect(subject).to_not be_valid
  end
    



end
