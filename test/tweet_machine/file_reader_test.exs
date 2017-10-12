defmodule FileReaderTest do
    use ExUnit.Case
    import TweetMachine.FileReader
    import Mock
    doctest TweetMachine.FileReader

    test "Passing a file should return a string" do
        str = get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:tweet_machine)}", "sample.txt")
        )
        assert str != nil
    end

    test "will not return a string longer than 140 characters" do
        str = get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:tweet_machine)}", "/test/too_long.txt")
        )
        assert str == "short line"
    end

    @tag watching: true
    test "An empty string should return an empty string" do
        with_mock File, [read!: fn(_) -> "" end] do
            str = pick_string("")
            assert str == ""
        end
    end

    @tag watching: true
    test "The string should be trimmed" do
        with_mock File, [read!: fn(_) -> " ABC " end] do
            str = get_strings_to_tweet("doesn't exist.txt")
            assert str == "ABC"
        end
    end
end