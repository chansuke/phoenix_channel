defmodule PhoenixChannel.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", auth_msg, socket) do
    {:ok, socket}
  end
  def join("rooms:" <> _private_room_id, _auth_msg, socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("move", %{"x" => x, "y" => y}, socket) do
    broadcast! socket, "move", %{x: x, y: y}
    {:noreply, socket}
  end
end
