require 'spec_helper'

describe Submission do

submission = FactoryGirl.build(:submission)
  
  # let!(:submission){
  #   Submission.new
  # }

  it 'should validate presence of a title' do
   submission.should_not be_valid
  end

  it 'should validate presence of a url' do
    submission.should_not be_valid
  end

  it 'should validate the format of a URL' do
    submission.url = 'http://www.thisisaurl.com'
    submission.title = 'this is a title'
    submission.save
    p submission
    submission.should be_valid
  end

  it 'should reject an invalid URL format' do
    submission.url = 'invalid URL'
    submission.title = 'this is a title'
    submission.save
    p submission
    submission.should_not be_valid
  end


end
