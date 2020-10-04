defmodule Colonies.PlayerBank do
  
  defstruct name: "", credits: 50, goal: %{type: nil, number: {100, 150, 200}} 
  
  # client functions
  def new(name \\ "npc", type) do
    %Colonies.PlayerBank{name: name, goal: %{type: type}}
  end
  
  def display(bank) do
    IO.inspect(bank)
  end
  
  def edit_credits(bank, credits) do
    {:ok, old_credits} = Map.fetch(bank, :credits)
    Map.put(bank, :credits, old_credits + credits)
  end
  
  # callback functions
  
end
