defmodule LiveChat.Model do
  def serving() do
    {:ok, model} = Bumblebee.load_model({:hf, "google/flan-t5-base"})
    {:ok, tokenizer} = Bumblebee.load_tokenizer({:hf, "google/flan-t5-base"})
    {:ok, generation_config} = Bumblebee.load_generation_config({:hf, "google/flan-t5-base"})
    Bumblebee.Text.generation(model, tokenizer, generation_config)
  end

  def generate(text) do
    Nx.Serving.batched_run(LiveChat.Serving, text)
  end
end
