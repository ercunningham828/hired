require 'rails_helper'

describe Job do
  describe "default scope" do 
    before do
      @job1=create(:job,created_at: 20.days.ago)
      @job2=create(:job,created_at: Time.now)
      @job3=create(:job,created_at: 6.days.ago)
    end

    it "returns the most recent job first" do
      expect(Job.all).to eq([@job2,@job3,@job1])
    end

    it "shows the oldest job last" do
      expect(Job.last).to eq(@job1)
    end

  end
end
