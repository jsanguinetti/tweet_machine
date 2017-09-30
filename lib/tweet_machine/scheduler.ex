defmodule TweetMachine.Scheduler do

    def schedule_file(schedule, file) do
        Quantum.add_job(schedule, fn ->
            TweetMachine.FileReader.get_strings_to_tweet(file)
            |> IO.puts
        end)
    end
end