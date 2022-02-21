defmodule Scryfall.List do
  @moduledoc """

  A List object represents a requested sequence of other objects (Cards, Sets, etc).
  List objects may be paginated, and also include information about issues raised when generating the list.

  API Reference: https://scryfall.com/docs/api/lists
  """

  defstruct [:object, :has_more, :next_page, :data]

  @type t(any) :: %__MODULE__{
          object: String.t(),
          has_more: boolean,
          next_page: String.t() | nil,
          data: [any]
        }
end
