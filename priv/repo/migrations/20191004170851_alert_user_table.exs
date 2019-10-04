defmodule SimpleAuth.Repo.Migrations.AlertUserTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role_id, references(:user_role, on_delete: :nothing)
    end
  end
end
