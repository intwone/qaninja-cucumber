class SideBarView < IncludeCap
  def loggedUser
    user = find(".sidebar-wrapper .user .info span").text
  end
end
