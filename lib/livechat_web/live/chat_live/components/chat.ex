defmodule LivechatWeb.ChatLive.Components.Chat do
  use LivechatWeb, :html

  def chat_input(assigns) do
    ~H"""
    <div
      class="rounded-md px-3 pb-1.5 pt-2.5 shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-indigo-600"
    >
      <input
        type="text"
        name="name"
        id="name"
        class="block w-full border-0 p-0 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
        placeholder="Jane Smith"
      >
    </div>
    """
  end
end