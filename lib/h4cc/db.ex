defmodule H4cc.DB do
  require Logger

  @moduledoc """
  Wraps interaction with DETS. 
  """
  
  def save_lib(libs) do
    {:ok, t} = :dets.open_file(:disk_storage, [type: :set])
    Enum.map(libs, &:dets.insert(t, {&1.name, &1.url, &1.desc, &1.stars, &1.commited, &1.folder, &1.is_git}))
    :dets.close(:disk_storage)
  end

  def load_lib() do
    :dets.open_file(:disk_storage, [type: :set])
    raw = :dets.match_object(:disk_storage, {:"_", :"_", :"_", :"_", :"_", :"_", :"_"}) 
    :dets.close(:disk_storage)
    Enum.map(raw, fn {n, u, d, s, c, f, i} -> %H4cc.Lib{name: n, url: u, desc: d, stars: s, commited: c, folder: f, is_git: i} end) 
  end

  def load_lib(stars) do
    :dets.open_file(:disk_storage, [type: :set])
    pattern = [{{:"$1", :"$2", :"$3", :"$4", :"$5", :"$6", :"$7"}, [{:>, :"$4", stars}], [{{:"$1", :"$2", :"$3", :"$4", :"$5", :"$6", :"$7"}}]}]
    raw = :dets.select(:disk_storage, pattern) 
    :dets.close(:disk_storage)
    Enum.map(raw, fn {n, u, d, s, c, f, i} -> %H4cc.Lib{name: n, url: u, desc: d, stars: s, commited: c, folder: f, is_git: i} end) 
  end

  def load(name) do
    :dets.open_file(:disk_storage, [type: :set])
    pattern = [{{:"$1", :"$2", :"$3", :"$4", :"$5", :"$6", :"$7"}, [{:==, :"$1", name}], [{{:"$1", :"$2", :"$3", :"$4", :"$5", :"$6", :"$7"}}]}]
    raw = :dets.select(:disk_storage, pattern) 
    :dets.close(:disk_storage)
    Enum.map(raw, fn {n, u, d, s, c, f, i} -> %H4cc.Lib{name: n, url: u, desc: d, stars: s, commited: c, folder: f, is_git: i} end) 
  end
end
