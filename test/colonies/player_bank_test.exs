defmodule Colonies.PlayerBankTest do
  use ExUnit.Case
  doctest Colonies.PlayerBank
  
  describe "player bank" do
    setup do
      player_bank = Colonies.PlayerBank.new("example", :foodstuffs)
      
      %{player_bank: player_bank}
    end
  end

  test "edit_resources adds a list of resources to the players bank (sell 5 foodstuffs for 10 credits)" do
    assert Colonies.PlayerBank.edit_resources(player_bank, [credits: 10, foodstuffs: -5]) 
      == %{
            name: "player_bank", 
            credits: 60, 
            goal: %{type: :foodstuffs, number: {100, 150, 200}}, 
            resources: %{foodstuffs: 5, water: 10, aluminum: 10}
          }
  end
end
