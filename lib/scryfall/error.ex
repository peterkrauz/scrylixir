defmodule Scryfall.Error do
  import Map

  @moduledoc """
  General-purpose error wrapper in typed format.
  """

  defstruct [:error, :base_data, details: nil]

  @type t :: %__MODULE__{
          error: String.t(),
          details: list
        }

  @spec from(struct) :: t
  def from(error) do
    %Scryfall.Error{
      error: "KeyError",
      details: Enum.zip(keys(error), values(error))
    }
  end
end
