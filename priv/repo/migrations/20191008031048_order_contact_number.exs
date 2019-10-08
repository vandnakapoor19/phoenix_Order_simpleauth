defmodule SimpleAuth.Repo.Migrations.OrderContactNumber do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      remove :patient_contact
      add :patient_contact, :string
    end
  end
end
