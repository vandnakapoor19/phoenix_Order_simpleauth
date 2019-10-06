defmodule SimpleAuth.Repo.Migrations.AlertOrderTableOrderNumber do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :order_number, :string
      end
  end
end
