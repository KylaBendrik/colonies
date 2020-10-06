defmodule Colonies.Player.Bank do
  
  defstruct credits: 50, resources: %{foodstuffs: 10, water: 10, aluminum: 10} 
  
  # client functions
  def init() do
    %Colonies.Player.Bank{}
  end
  
  def display(bank) do
    IO.inspect(bank)
  end
  
  def edit_credits(bank, credits) do
    edit_resource(bank, {:credits, credits})
  end
  
  # callback functions
  def edit_resource(bank, {:credits, number}) do
    {:ok, old_credits} = Map.fetch(bank, :credits)
    Map.put(bank, :credits, old_credits + number)
  end
  
  def edit_resource(bank, {type, number}) do
    {:ok, old_resources} = Map.fetch(bank, :resources)
    {:ok, old_resource} = Map.fetch(old_resources, type)
    
    new_resources = Map.put(old_resources, type, old_resource + number)
    Map.put(bank, :resources, new_resources)
  end
  
  def edit_resources(bank, []) do
    IO.puts("all resources edited")
    bank
  end
  
  def edit_resources(bank, [{type, number} | rest]) do
    edit_resources(
      edit_resource(bank, {type, number}), 
      rest
    )
  end
end
