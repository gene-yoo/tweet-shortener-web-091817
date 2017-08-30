def dictionary
  {"hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet_array = tweet.split
  tweet_array.each_with_index do |word, index|
    if dictionary.keys.include?(word.downcase)
      tweet_array[index] = dictionary[word.downcase]
    end
  end
  tweet_array.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.split("").length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if selective_tweet_shortener(tweet).split("").length > 140
    selective_tweet_shortener(tweet)[0..136] + "..."
  else
    selective_tweet_shortener(tweet)
  end
end
