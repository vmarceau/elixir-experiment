defmodule FartlekWeb.ChangesetView do
  use FartlekWeb, :view

  def format_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end

  def render("error.json", %{changeset: changeset}) do
    %{errors: format_errors(changeset)}
  end
end
