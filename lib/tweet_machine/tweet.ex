defmodule TweetMachine.Tweet do
    def send(str) do
        ExTwitter.configure(:process, [
            consumer_key: System.get_env("TWEET_MACHINE_TWITTER_CONSUMER_KEY"),
            consumer_secret: System.get_env("TWEET_MACHINE_TWITTER_CONSUMER_SECRET"),
            access_token: System.get_env("TWEET_MACHINE_TWITTER_ACCESS_TOKEN"),
            access_token_secret: System.get_env("TWEET_MACHINE_TWITTER_ACCESS_SECRET")
        ])
        ExTwitter.update(str)
    end

    def send_random(file) do
        TweetMachine.FileReader.get_strings_to_tweet(file)
        |> send
    end
end