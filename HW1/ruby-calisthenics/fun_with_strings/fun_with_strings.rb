module FunWithStrings
  def palindrome?
    # your code here
    string = self.gsub(/\W/, '').downcase
    #string = self.gsub(/[^(a-zA-Z)]/){|x| ""}.downcase
    string == string.reverse
  end


  def count_words
    array = self.gsub(/\W/, ' ').downcase.split
    #array = self.gsub(/[^(a-zA-Z)]/){|x| " "}.downcase.split
    hash = Hash.new(0)
    array.each do |a|
      hash[a] += 1 
    end
    return hash
  end

  def anagram_groups
    array = self.downcase.split
    hash = array.group_by{|x| x.chars.sort}
    hash.select{|v| v.size > 1}.values
  end

end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
