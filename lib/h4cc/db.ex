defmodule H4cc.DB do
  require Logger

  @moduledoc """
  Wraps interaction with DETS. 
  """
  
  def save_data(map) do
    Enum.map(map, &save_lib(&1))
    Logger.info "Data save successfully"
  end

  def save_lib(lib) do
    {:ok, table} = :dets.open_file(:disk_storage, [type: :set])
    :dets.insert(table, {lib.name, lib.url, lib.desc, lib.stars, lib.commited, lib.is_git})
    :dets.close(:disk_storage)
    #:dets.open_file(:file_table, [{:file, 'cool_table.txt'}])
  end

  def load_map() do
    load_rawdata()
    |> Enum.map(fn {n, u, d, s, c, i} -> %H4cc.Lib{name: n, url: u, desc: d, stars: s, commited: c, is_git: i} end) 
  end

  def load_rawdata() do
    :dets.open_file(:disk_storage, [type: :set])
    raw = :dets.match_object(:disk_storage, {:"_", :"_", :"_", :"_", :"_", :"_"}) 
    :dets.close(:disk_storage)
    raw
  end
end