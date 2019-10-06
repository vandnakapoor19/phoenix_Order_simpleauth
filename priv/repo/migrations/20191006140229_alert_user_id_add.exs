defmodule SimpleAuth.Repo.Migrations.AlertUserIdAdd do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :user_role_id, references(:user_role)
    end
  end
end
