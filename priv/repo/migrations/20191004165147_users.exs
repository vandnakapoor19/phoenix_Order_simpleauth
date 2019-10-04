defmodule SimpleAuth.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password_hash, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

    alter table(:users) do
      add :role_id, references(:user_role, on_delete: :nothing)
      add :address, :string
      add :state, :string
      add :city, :string
      add :zipcode, :integer
    end
  end
end
