require "rails_helper"

RSpec.describe Idea, type: :model do

	describe Idea, "#title" do 
		it "returns true if title is set" do
			idea = Idea.new(title: "This is the first idea")
			expect(idea.title).to eq("This is the first idea")
		end
	end 

	describe Idea, "#content" do 
		it "returns true if content is set" do
			idea = Idea.new(content: "there are content here")
			expect(idea.content).to eq("there are content here")
		end
	end 

end
