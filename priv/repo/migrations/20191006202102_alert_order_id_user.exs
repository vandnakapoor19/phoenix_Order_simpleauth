defmodule SimpleAuth.Repo.Migrations.AlertOrderIdUser do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add :user_id, references(:users)
    end
    create index(:orders, [:user_id])
  end
end
