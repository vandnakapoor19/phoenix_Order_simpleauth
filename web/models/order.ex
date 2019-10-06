defmodule SimpleAuth.Order do
use SimpleAuth.Web, :model
@alphabet Enum.concat([?0..?9, ?A..?Z, ?a..?z])

  schema "orders" do
    field :patient_name, :string
    field :patient_address, :string, default: ":rand.uniform(n)"
    field :patient_contact, :integer
    field :pickup_date, :date
    field :patient_state, :string, default: "abc"
    field :order_number, :string

    belongs_to :user, SimpleAuth.User
  end

  def changeset(struct,params \\ %{}) do
    struct
    |> cast(params, [:patient_name, :patient_address, :patient_contact, :pickup_date, :patient_state, :order_number])
    |> validate_required(:patient_name)
    |> generate_random_number
  end

  def generate_random_number(struct) do
      order_number = get_field(struct, :order_number)
      alphabet = randstring(8);
      alphabet = "SD-#{alphabet}."
      put_change(struct, :order_number, alphabet)
  end

  def randstring(count) do
    # Technically not needed, but just to illustrate we're
    # relying on the PRNG for this in random/1
    :rand.seed(:exsplus, :os.timestamp())
    Stream.repeatedly(&random_char_from_alphabet/0)
    |> Enum.take(count)
    |> List.to_string()
  end

  defp random_char_from_alphabet() do
    Enum.random(@alphabet)
  end

end
