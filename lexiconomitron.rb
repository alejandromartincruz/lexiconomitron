require 'rspec'

class Lexiconomitron

	def eat_t(words)
		array = words.downcase.split("")
		words=array.find_all { |i|  i != "t" }
		words=words.join
	end

	def shazam (words)
		array=words.split(" ")
		words = array.map { |i| i.reverse }
		words = [words[0], words[-1]]
		eat_t(words.join(" "))
	end

	def oompa_loompa(words)
		array = words.split(" ")
		words=array.find_all { |i|  i.length <= 3 }
		shazam(words.join(" "))
	end

end

describe Lexiconomitron do 

before :each do
	@lexi = Lexiconomitron.new
end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#Shazam" do
    it "Turns back the entire phrase and remove every letter t from the input" do
      expect(@lexi.shazam("This is a boring test")).to eq("sih se")
    end
  end

  describe "#Oompa Loompa" do
    it "Turns back The words less than 3 letters" do
      expect(@lexi.oompa_loompa("If you wanna be my lover")).to eq("fi ym")
    end
  end

end