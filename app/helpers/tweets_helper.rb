#Helpers are key b/c it separates out your complicated pieces of code from your controller, keeping controller as simple as possible; also helps isolate bugs
module TweetsHelper

	def get_tagged(tweet)
		message_arr = Array.new
		message_arr = tweet.message.split #we're splitting up the sentence to be placed in an array
	    message_arr.each_with_index do |word, index|
    if word[0] == "#"
	        if Tag.pluck(:phrase).include?(word) #if there is a #, check tag table, get unique list of all phrases to see if it exists (.include? is just a search method for an array)
	          tag = Tag.find_by(phrase: word) # result of the search (currently exist) OR 
	        else
	          tag = Tag.create(phrase: word) # create a new one
	        end
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id) #TweetTag is our Join Table
        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>" #replaced with a hyperlink for the tag
      end
    end

    tweet.update(message: message_arr.join(" "))
    return tweet
	end
end
