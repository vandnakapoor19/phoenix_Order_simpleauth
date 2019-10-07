defmodule SimpleAuth.User do
  use SimpleAuth.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :is_admin, :boolean, default: true
    field :user_role_id, :integer, default: 1

    has_many :orders, SimpleAuth.Order

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(email)a
  @optional_fields ~w(name is_admin user_role_id)a

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end

  def registration_changeset(struct, params) do
   struct
   |> changeset(params)
   |> cast(params, ~w(password)a, [])
   |> validate_length(:password, min: 6, max: 100)
   |> hash_password
   |> user_role
 end

 defp user_role(struct) do
   # role_id = get_field(struct, :users_role_id)
   put_change(struct, :user_role_id, 1)
 end

 defp hash_password(changeset) do
   case changeset do
     %Ecto.Changeset{valid?: true,
                     changes: %{password: password}} ->
       put_change(changeset,
                  :password_hash,
                  Comeonin.Bcrypt.hashpwsalt(password))
     _ ->
       changeset
   end
 end
end
