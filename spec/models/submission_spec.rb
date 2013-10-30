require 'spec_helper'

describe Submission do

  let!(:my_submission){
    Submission.new
  }
  it 'should validate presence of a title' do
    my_submission.should_not be_valid
  end

  it 'should validate presence of a url' do
    my_submission.should_not be_valid
  end

  it 'should validate the format of a URL' do
    my_submission.url = 'http://www.thisisaurl.com'
    my_submission.title = 'this is a title'
    my_submission.save
    p my_submission
    my_submission.should be_valid
  end

  it 'should reject an invalid URL format' do
    my_submission.url = 'invalid URL'
    my_submission.title = 'this is a title'
    my_submission.save
    p my_submission
    my_submission.should_not be_valid
  end


end
