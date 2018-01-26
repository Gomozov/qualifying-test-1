defmodule H4cc.Lib do

  @moduledoc """
  Structure that contains actual information about library.
  
  Consists of following fields: 
   * url      - URL of library
   * name     - name of library
   * desc     - description of library
   * stars    - number of library stars
   * commited - date of last commit
   * is_git   - true if library stores in Github
  """

  defstruct url:         nil,
            name:        nil,
            desc:        nil,
            stars:       nil,
            commited:    nil,
            is_git:      nil

end
