defmodule H4cc.Library do

  @moduledoc """
  Structure that contains actual information about library.
  
  Consists of following fields: 
   * url      - URL of library
   * name     - name of library
   * desc     - description of library
   * stars    - number of library stars
   * commited - date of last commit
  """

  defstruct url:         nil,
            name:        nil,
            desc:        nil,
            stars:       nil,
            commited:    nil

end
