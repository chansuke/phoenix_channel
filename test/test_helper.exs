ExUnit.start

Mix.Task.run "ecto.create", ~w(-r PhoenixChannel.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r PhoenixChannel.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(PhoenixChannel.Repo)

