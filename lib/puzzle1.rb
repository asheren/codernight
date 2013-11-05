require 'nokogiri'
#require_relative 'SAMPLE_RATES.xml'

require 'csv'

class Puzzle1 #class is a method that defines puzzle and actually creates a constant that points to the puzzle object
  #so even if you don't have methods defined, something is still done



#put the csv file into a hash and then find the DM1182s
  def find_item
    skus = {}

    CSV.foreach('/Users/allisonsheren/projects/coder_night/lib/SAMPLE_TRANS.csv', {:headers => true, 
                                                                                   :return_headers => true, 
                                                                                   :header_converters => :symbol, 
                                                                                   :converters => :all} ) do |row|
    #puts row[0]
    puts skus["DM1182"][:amount] #right now, referring to skus the hash, needs to be skus the column
    end
  end

  def item
  # item = []
   # if @item = AUD 
      # convert AUD to USD
      ##the nokogiri stuff goes somewhere in here
       # doc = Nokogiri::XML(open('/Users/allisonsheren/projects/coder_night/lib/SAMPLE_RATES.xml'))
       # doc.xpath("//AUD").each do |node|
      #   puts node.text
         # end 
   # else
      # puts @item 

  end

  # def total_sales
      #total_sales = []
  #   @item.reduce(:+)
  # end
  


  
 #
	
end

p = Puzzle1.new
p.find_item #calls the method. You need to set p (a variable that refers to an object Puzzle1) to Puzzle1.new. We created the class
#puzzle1 which created a puzzle object but in order to call the method we have to creat an actual object to call it on 