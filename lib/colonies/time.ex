defmodule Colonies.Time do
  @moduledoc """
  This module just records time.
  """
  
  def init() do
    run(%{time: 0})
  end
  
  def run(%{time: time}) do
    IO.inspect(time)
    :timer.sleep(2000)
    run(%{time: time + 1})
  end
end
