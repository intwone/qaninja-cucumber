class SideBarView
  include Capybara::DSL

  def loggedUser
    user = find(".sidebar-wrapper .user .info span").text
  end
end
