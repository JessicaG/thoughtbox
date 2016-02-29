require 'spec_helper'

describe Link do
  describe "Validations" do
    context "on a new link" do
    	it "should not be valid without link and title" do
      	link = Link.new(url: nil, title: nil)
      	link.should_not be_valid
      end

      it "should not be valid with fake url" do
      	link = Link.new(url: 'http:: exampple com', title: nil)
      	link.should_not be_valid
      end

      it "should allow valid urls" do
      	link = Link.new(url: 'http://today.turing.io', title: 'Turing School Lesson Plans')
      	link.should be_valid
      end

      it "should not save without a title" do
      	link = Link.new(url: 'http://today.turing.io', title: nil)
      	link.should_not be_valid
      end

      it "should default read status to false upon creation" do
      	link = Link.create(url: 'http://today.turing.io', title: 'Turing School Lesson Plans')
      	expect(link.read).to eq(false)
      end
  	end

  	context "on list of links" do
  		it "should only see links associated with current user" do
  			jessica = User.create(name: 'Jessica', email: 'jessica@gmail.com', password: 'eightletters', password_confirmation: 'eightletters')
  			steve   = User.create(name: 'Steve', email: 'steve@gmail.com', password: 'eightletters1', password_confirmation: 'eightletters1')
      	link1   = Link.create(url: 'http://today.turing.io', title: 'Turing School Lesson Plans', user_id: steve.id)
   
      	expect(steve.links.first).to   eq(link1)
      	expect(jessica.links).to       eq([])
      end
  	end
	end
end
