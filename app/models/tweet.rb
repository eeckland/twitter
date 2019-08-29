class Tweet < ApplicationRecord
    belongs_to :user
    has_many :tweet_tags
    has_many :tags, through: :tweet_tags
    validates :message, presence: true, length:{maximum: 140, too_long: "A tweet is only 140 max."}, on: :create
    before_validation :link_check, on: :create #create action method
    after_validation :apply_link, on: :create #on: :create-- only want to validate these messages when we enter a new tweet into database

	  private #should only be available to the tweet class
    def apply_link
          arr = self.message.split
          i = arr.map { |x| x.include? ("http://") || x.include?("https://") }.index(true)
        unless i.nil?
          url = arr[i]
          arr[i] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
        end
          self.message = arr.join(" ")
    end

    def link_check 
      check = false
      if self.message.include? "http://" 
         check = true
      elsif self.message.include? "https://"
         check = true
      else
           check = false
      end	
    
    #this is how we shorten the link to under 20 characters
      if check == true
    	arr = self.message.split
    	i = arr.map{ |x| x.include? "http"}.index(true) #index method name
        self.link = arr[i]
        if arr[i].length > 23 #checking if URL is longer than 23 characters
    	    arr[i] = "#{arr[i][0..20]}..."	#i is the variable for index
        end
    				
        self.message = arr.join(" ")
      end
     end	
end