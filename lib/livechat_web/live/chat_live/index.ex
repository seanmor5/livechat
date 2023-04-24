defmodule LivechatWeb.ChatLive.Index do
  use LivechatWeb, :live_view

  import LivechatWeb.ChatLive.Components.Sidebar
  import LivechatWeb.ChatLive.Components.Model
  import LivechatWeb.ChatLive.Components.Chat

  alias LivechatWeb.ChatLive.Components.Message

  @models %{
    "chat_gpt" => "Default (GPT-3.5)",
    "legacy_gpt" => "Legacy (GPT-3.5)",
    "gpt4" => "GPT-4"
  }

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:models, @models)
      |> assign(:selected_model, "chat_gpt")

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, socket) do
    
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.sidebar />
      <div class="lg:pl-72">
        <div class="max-w-md mx-auto mt-8">
          <.model_select models={@models} selected_model={@selected_model} />
        </div>
        <div class="w-full mt-4">
          <.live_component
            id={"foobar"}
            role={:user}
            module={Message}
          />
          <.live_component
            id={"baz"}
            role={:assistant}
            module={Message}
          />
        </div>
        <div class="absolute bottom-0 left-0 w-full border-t md:border-t-0 dark:border-white/20 md:border-transparent md:dark:border-transparent md:bg-vert-light-gradient bg-white dark:bg-gray-800 md:!bg-transparent dark:md:bg-vert-dark-gradient pt-2">
          <form class="stretch mx-2 flex flex-row gap-3 last:mb-2 md:mx-4 md:last:mb-6 lg:mx-auto lg:max-w-2xl xl:max-w-3xl">
            <div class="relative flex h-full flex-1 items-stretch md:flex-col">
              <div class="flex flex-col w-full py-2 flex-grow md:py-3 md:pl-4 relative border border-black/10 bg-white dark:border-gray-900/50 dark:text-white dark:bg-gray-700 rounded-md shadow-[0_0_10px_rgba(0,0,0,0.10)] dark:shadow-[0_0_15px_rgba(0,0,0,0.10)]">
                <textarea tabindex="0" data-id="request-:rk:-2" rows="1" placeholder="Send a message..." class="m-0 w-full resize-none border-0 bg-transparent p-0 pr-7 focus:ring-0 focus-visible:ring-0 dark:bg-transparent pl-2 md:pl-0" style="max-height: 200px; height: 24px; overflow-y: hidden;"></textarea>
                <button class="absolute p-1 rounded-md text-gray-500 bottom-1.5 md:bottom-2.5 hover:bg-gray-100 enabled:dark:hover:text-gray-400 dark:hover:bg-gray-900 disabled:hover:bg-transparent dark:disabled:hover:bg-transparent right-1 md:right-2 disabled:opacity-40">
                  <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4 mr-1" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("change_selected_model", %{"model" => model}, socket) do
    {:noreply, assign(socket, :selected_model, model)}
  end

  def handle_event("send_message", %{"message" => contents}) do
  end
end