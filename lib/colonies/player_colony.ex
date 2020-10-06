defmodule Colonies.PlayerColony do
  @moduledoc """
  This module deals with holding the information about the player's colony. 
  For right now, the colonies can only have one kind of module: The Production Module
  
  The Production Module
  =================
  Makes one assigned resource every tic
  
  That's it! Keeping it super simple.
  
  So, this module has a state containing the list of modules and their information. Right now, the info will include:
    - type (only :production right now)
    - level (only 1 right now. Later, this will be upgradeable)
    
  The only interface we need is to add new modules. This will send a request to the player's bank to remove the require ingredients. (just credits, for now)
  """
end
