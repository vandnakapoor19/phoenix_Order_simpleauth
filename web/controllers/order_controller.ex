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
    cond do
      # 1 is for admin.
     current_user.user_role_id == 1 ->
        showOrders(conn, _params, current_user)
        # 2 is for Pharma.
     current_user.user_role_id == 2 ->
         showpharmacy(conn, _params, current_user)
         # 3 is for courier.
      current_user.user_role_id == 3 ->
          showcourier(conn, _params, current_user)
        end
    end

  def showpharmacy(conn, _params, current_user) do
    query = from(m in Order, where: m.user_id == ^current_user.id , order_by: m.inserted_at)
    orders =  Repo.all(query)

    courier  =  Repo.all(User)
    render conn, "index.html", orders: orders , courier: courier
  end

  def showcourier(conn, _params, current_user) do

    user_id = current_user.id
     query = from(m in Order, where: m.courier_id == ^user_id , order_by: m.inserted_at )

     orders =  Repo.all(query)
    # orders =  Order  |> order_by(desc: :inserted_at)  |> Repo.all()


    courier  =  Repo.all(User)
    render conn, "index.html", orders: orders , courier: courier
  end

  def showOrders(conn, _params, current_user) do
    orders =  Repo.all(Order)
    courier  =  Repo.all(User)
    render conn, "index.html", orders: orders , courier: courier
  end

  def new(conn, _params, current_user) do
    query = from(u in User, where: u.user_role_id == 3)
    courier  =  Repo.all(query)

    changeset = Order.changeset(%Order{}, %{})
    render conn, "new.html", changeset: changeset , courier: courier
  end

  def create(conn, %{"order"=>order}, current_user) do
    # changeset = Order.changeset(%Order{}, order)
    query = from(u in User, where: u.user_role_id == 3)
    courier  =  Repo.all(query)

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
      courier  =  Repo.all(User)
      render conn, "edit.html", changeset: changeset , order: order , courier: courier
  end

  def update(conn, %{"id"=>order_id, "order"=>order},current_user) do
    old_order = Repo.get(Order, order_id)
    changeset = Order.changeset(old_order,order)
    courier  =  Repo.all(User)
    IO.inspect(order)
    case Repo.update(changeset) do
      {:ok,_order}->
      conn
      |> put_flash(:info, "Order Updated")
      |> redirect(to: order_path(conn, :index))
      {:error, changeset}->
        render conn, "edit.html", changeset: changeset, order:  old_order , courier: courier
    end
  end

  def delete(conn, %{"id" => order_id}, current_user) do
      Repo.get!(Order, order_id) |> Repo.delete!

      conn
      |> put_flash(:info,"Order Deleted")
      |> redirect(to: order_path(conn, :index))
  end
end
