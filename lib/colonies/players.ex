defmodule Colonies.Players do
  use GenServer
  @moduledoc """
  This state holds the key-value map of all the players' processes, and distributes the requests made from the timer.
  """
  def start do
    GenServer.start(__MODULE__, nil)
  end
  
  def server_process(cache_pid, todo_list_name) do
    GenServer.call(cache_pid, {:server_process, todo_list_name})
  end
  
  def init() do
    {:ok, %{}}
  end
  
  def handle_call({:server_process, todo_list_name}, _, todo_servers) do
  case Map.fetch(todo_servers, todo_list_name) do
    {:ok, todo_server} ->
      # if there is a return value for the key given, return that value
      {:reply, todo_server, todo_servers}
    :error -> 
      {:ok, new_server} = Todo.Server.start()
      # if there is no return value, create a new server and add it into the list
      {:reply, new_server, Map.put(todo_servers, todo_list_name, new_server)}
    end
  end
end
