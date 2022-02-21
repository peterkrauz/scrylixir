defmodule Scryfall.Error do
  import Map

  @moduledoc """
  General-purpose error wrapper in typed format.
  """

  defstruct [:error, :base_data, details: nil]

  @type t :: %__MODULE__{
          error: String.t(),
          base_data: any,
          details: list
        }

  @spec from(struct, any) :: t
  def from(error, raw_data) do
    %Scryfall.Error{
      error: "KeyError",
      base_data: raw_data,
      details: Enum.zip(keys(error), values(error))
    }
  end
end
