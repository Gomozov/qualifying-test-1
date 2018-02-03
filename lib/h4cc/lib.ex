defmodule H4cc.Lib do

  @moduledoc """
  Structure that contains actual information about library.
  
  Consists of following fields: 
   * name     - name of library
   * url      - URL of library
   * desc     - description of library
   * stars    - number of library stars
   * commited - date of last commit
   * folder   - folder where the library is stored
   * is_git   - true if library stores in Github
  """

  defstruct name:        nil,
            url:         nil,
            desc:        nil,
            stars:       0,
            commited:    nil,
            folder:      nil,
            is_git:      false

end
