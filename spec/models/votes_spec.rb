require 'spec_helper'

describe Vote do

  it { should validate_presence_of :direction }
  it { should belong_to :submission }

end