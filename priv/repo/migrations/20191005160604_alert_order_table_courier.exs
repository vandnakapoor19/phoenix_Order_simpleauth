defmodule SimpleAuth.Repo.Migrations.AlertOrderTableCourier do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :user_id, references(:users)
      end
  end
end
