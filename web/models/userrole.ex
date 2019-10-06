defmodule SimpleAuth.UserRole do
  use SimpleAuth.Web, :model

  schema "user_role" do
    field :title, :string
    field :status, :boolean, default: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(title)a
  @optional_fields ~w(status)a

def changeset(struct, params \\ %{}) do
  struct
  |> cast(params, @required_fields ++ @optional_fields)
  |> validate_required(@required_fields)
end
end
