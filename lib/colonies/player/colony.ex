defmodule Colonies.Player.Colony do
  @moduledoc """
  This module deals with holding the information about the player's colony. 
  For right now, the colonies can only have one kind of module: The Production Module
  
  The Production Module
  =================
  Makes one assigned resource every tic
  
  That's it! Keeping it super simple.
  
  So, this module has a state containing the list of modules and their information. Right now, the info will include:
    - id (auto-increment?)
    - type (only :production right now)
    - level (only 1 right now. Later, this will be upgradeable)
    - assigned resource (from player)
    
  The only interface we need is to add new modules. This will send a request to the player's bank to remove the require ingredients. (just credits, for now)
  """
  
  def init(resource) do
    %{modules: [
      %{
        id: 0,
        type: :production,
        level: 1,
        assigned: resource
      }
    ]}
  end
  
  def add_module(%{modules: modules_list}, type, assigned) do
    id = length(modules_list)
    
    %{
      modules: [module(type, id, assigned) | modules_list]
    }
  end
  
  defp module(type, id, assigned) do
    %{
      id: id,
      type: type,
      level: 1,
      assigned: assigned
    }
  end
  
  def harvest(%{modules: _modules_list}) do
    # return list of tuples {type, number} for each resource harvested
    [{:foodstuffs, 1}]
  end
  
  def cost(_modules) do
    # return list of tuples {type, number} for each resource used up
    [{:credits, 1}]
  end
end
