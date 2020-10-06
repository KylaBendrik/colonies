defmodule Colonies.PlayerServer do
  use GenServer
  
  def start do
    GenServer.start(Colonies.PlayerServer, nil)
  end
  
  def run_tic(player) do
    GenServer.cast(player, {:run_tic})
  end
  
  def init(_) do
    name = IO.gets("Name: ")
    {:ok, Colonies.Player.new(name, :foodstuffs)}
  end
  
  def handle_cast({:run_tic}, player) do
    new_state = Colonies.Player.run_tic(player)
    {:noreply, new_state}
  end
end
