class SwitchAlert
  include::DSL

  def alertConfirm
    find(".swal2-confirm").click
  end

  def alertCancel
    find(".swal2-cancel").click
  end
end