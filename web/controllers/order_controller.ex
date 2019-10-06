defmodule SimpleAuth.OrderController do
  use SimpleAuth.Web, :controller

  alias SimpleAuth.Order
  alias SimpleAuth.User
  alias SimpleAuth.UserRole

 plug :scrub_params, "order" when action in [:create, :update]

  def action(conn, _) do
     apply(__MODULE__, action_name(conn),
           [conn, conn.params, conn.assigns.current_user])
   end

  def index(conn, _params, current_user) do
    orders =  Repo.all(Order)
    courier  =  Repo.all(User)
    render conn, "index.html", orders: orders , courier: courier
  end

  def new(conn, _params, current_user) do
      courier  =  Repo.all(User)
    changeset = Order.changeset(%Order{}, %{})

      render conn, "new.html", changeset: changeset , courier: courier
  end

  def create(conn, %{"order"=>order}, current_user) do
    # changeset = Order.changeset(%Order{}, order)
    courier  =  Repo.all(User)

    changeset =
    current_user
    |> build_assoc(:orders)
    |> Order.changeset(order)

    case  Repo.insert(changeset) do
      {:ok, _order}->
        conn
        |> put_flash(:info, "Order Created")
        |> redirect(to: order_path(conn, :index))
      {:error,changeset}->render conn,"new.html", changeset: changeset , courier: courier
    end
  end

  def edit(conn, %{"id" => order_id}, current_user) do
    order =  Repo.get(Order, order_id)
    changeset  =  Order.changeset(order)
    render conn, "edit.html", changeset: changeset , order: order
  end

  def update(conn, %{"id"=>order_id, "order"=>order}) do
    old_order = Repo.get(Order, order_id)
    changeset = Order.changeset(old_order,order)

    case Repo.update(changeset) do
      {:ok,_order}->
      conn
      |> put_flash(:info, "Order Updated")
      |> redirect(to: order_path(conn, :index))
      {:error, changeset}->
        render conn, "edit.html", changeset: changeset, order:  old_order
    end
  end

  def delete(conn, %{"id" => order_id}, current_user) do
      Repo.get!(Order, order_id) |> Repo.delete!

      conn
      |> put_flash(:info,"Order Deleted")
      |> redirect(to: order_path(conn, :index))
  end
end
