defmodule SimpleAuth.DetailController do
  use SimpleAuth.Web, :controller
  alias SimpleAuth.Order
  alias SimpleAuth.User
  alias SimpleAuth.UserRole

  plug :scrub_params, "detail" when action in [:create, :update]

   def action(conn, _) do
      apply(__MODULE__, action_name(conn),
            [conn, conn.params, conn.assigns.current_user])
    end

   def index(conn, _params, current_user) do
     orders =  Repo.all(Order)
     courier  =  Repo.all(User)
     render conn, "index.html", orders: orders , courier: courier
   end

   def show(conn, %{"id" => order_id}, current_user) do
     order =  Repo.get(Order, order_id)
     IO.inspect(order)
     changeset  =  Order.changeset(order)
     courier  =  Repo.all(User)
     render conn, "index.html", changeset: changeset ,  order: order , courier: courier
   end

   def edit(conn, %{"id" => order_id}, current_user) do
     order =  Repo.get(Order, order_id)
     IO.inspect(order)
     changeset  =  Order.changeset(order)
     courier  =  Repo.all(User)
     render conn, "edit.html", changeset: changeset ,  order: order , courier: courier
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
         render conn, "edit.html", changeset: changeset , order:  old_order , courier: courier
     end
   end

end
