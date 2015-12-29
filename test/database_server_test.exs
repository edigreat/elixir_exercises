defmodule DatabaseServerTest do 
  use ExUnit.Case
  import DatabaseServer, only: [run_async: 2 , start: 0]
  setup  do 
      context = %{ databaseserver_pid: start}
    {:ok, context}
  end
  
  test "The result of query 1 must be query 1 result ", %{databaseserver_pid: databaseserver_pid}  do
    result = run_async(databaseserver_pid, "query 1")
    assert "query 1 result"  == result
  end

   test "The result of query 1 must not be query 2 result ", %{databaseserver_pid: databaseserver_pid}  do
    result = run_async(databaseserver_pid, "query 1")
    refute "query 2 result"  == result
  end

end

