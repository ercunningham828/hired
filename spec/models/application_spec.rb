require 'rails_helper'

describe Application do
  before do
    @app1=create(:application,created_at: 20.days.ago)
    @app2=create(:application,created_at: Time.now)
    @app3=create(:application,created_at: 6.days.ago)
    @app4=create(:application,created_at: 10.days.ago)
    @app5=create(:application,created_at: 15.days.ago)
    @app4.status="Hired"
    @app4.save!
    @app5.status="Rejected"
    @app5.save!
  end

  describe "default_scope" do
    it "returns the most recent applications first" do
      expect(Application.all).to eq([@app2,@app3,@app4,@app5,@app1])
    end

    it "shows the oldest application last" do
      expect(Application.last).to eq(@app1)
    end
  end

  describe "application status" do 
    it "should default to New Application" do
        expect(@app1.status).to eq("New Application")
        expect(Application.where(status:"New Application").count).to eq(3)
    end
  end

  describe "Hired applications" do
    it "should return applications of candidates who were hired" do
      expect(Application.hired).to include (@app4)
    end
  end

  describe "Rejected applications" do
    it "should return applications of candidates who were rejected" do
      expect(Application.rejected).to include (@app5)
    end
  end
end
