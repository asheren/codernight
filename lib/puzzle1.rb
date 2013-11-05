require 'nokogiri'
#require_relative 'SAMPLE_RATES.xml'

require 'csv'

class Puzzle1 #class is a method that defines puzzle and actually creates a constant that points to the puzzle object
  #so even if you don't have methods defined, something is still done (it returns nil)



#put the csv file into a hash and then find the DM1182s
  def find_item
    

      CSV.foreach('/Users/allisonsheren/projects/coder_night/lib/SAMPLE_TRANS.csv', {:headers => true, 
                                                                                   :return_headers => true, 
                                                                                   :header_converters => :symbol, 
                                                                                   :converters => :all} ) do |row|
    #puts row[1] 
    skus = {
      "DM1182" => [:amount] #how to get this to put the actual amount from the CSV?
    }
    p skus
    #puts skus["DM1182"][:amount] #right now, referring to skus the hash, needs to be skus the column
      end
  end

  def item
   arr = []
    if @amount == /(\ AUD\z)/
      # finds the amounts that have AUD 
      ##use nokogiri to convert AUDs to USDs??
        doc = Nokogiri::XML(open('/Users/allisonsheren/projects/coder_night/lib/SAMPLE_RATES.xml'))
        doc.xpath("//AUD").each do |node|
          puts node.text
        end 
    else
       puts @amount 
    end
    arr << @amount #puts all the amounts (which are in USD) into an array
  end

  def total_sales 
    item.reduce(:+)
  end
end

p = Puzzle1.new
p.find_item #calls the method. You need to set p (a variable that refers to an object Puzzle1) to Puzzle1.new. We created the class
#puzzle1 which created a puzzle object but in order to call the method we have to creat an actual object to call it on 
p.item 
p.total_sales