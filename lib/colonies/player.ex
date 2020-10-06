defmodule Colonies.Player do
  @moduledoc """
  This module is the go between for the colony and the bank.
  """
  
  def new(name, type) do
    # return map containing name, type, bank, and colony
    %{
      name: name,
      type: type,
      goal: {100, 150, 200},
      bank: Colonies.Player.Bank.init(),
      colony: Colonies.Player.Colony.init(type)
    }
  end
  
  def run_tic(player) do
    # in each tick, simply ask the colony how many resources to add
    # then tell the bank to add those resources
    
    harvest = Colonies.Player.Colony.harvest(player[:colony])
    cost = Colonies.Player.Colony.cost(player[:colony])
    
    new_bank = 
      player[:bank]
      |> Colonies.Player.Bank.edit_resources(harvest)
      |> Colonies.Player.Bank.edit_resources(cost)
      
    # return the new player state
    
    Map.update!(player, :bank, new_bank)
  end
end
