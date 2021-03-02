defmodule Fartlek.Results do
  import Ecto.Query, warn: false
  alias Fartlek.Repo
  alias Fartlek.Results.Result

  def list_results do
    Repo.all(Result)
  end

  def get_result!(id), do: Repo.get!(Result, id)

  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

  def update_result(%Result{} = result, attrs) do
    result
    |> Result.changeset(attrs)
    |> Repo.update()
  end

  def delete_result(%Result{} = result) do
    Repo.delete(result)
  end

  def change_result(%Result{} = result, attrs \\ %{}) do
    Result.changeset(result, attrs)
  end
end
