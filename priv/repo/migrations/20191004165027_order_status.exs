defmodule SimpleAuth.Repo.Migrations.OrderStatus do
  use Ecto.Migration

  def change do
    create table(:order_status)do
    add :title, :string
    add :status, :boolean, default: true, null: false

    timestamps()
    end
  end
end
