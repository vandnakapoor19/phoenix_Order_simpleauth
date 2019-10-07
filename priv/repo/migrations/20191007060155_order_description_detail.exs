defmodule SimpleAuth.Repo.Migrations.OrderDescriptionDetail do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :order_details, :string
      add :order_cancel_description, :string
      end
  end
end
