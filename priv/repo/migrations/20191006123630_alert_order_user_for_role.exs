defmodule SimpleAuth.Repo.Migrations.AlertOrderUserForRole do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :users_role_id, references(:user_role)
    end


  end
end
