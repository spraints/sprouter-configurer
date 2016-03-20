$ ->
  $(document).delegate ".js-connection-mode", "change", ->
    $(".js-until").prop("checked", false).parent().removeClass("active")
    if $(this).val() == "normal"
      # "normal" auto-selects "forever"
      $(".js-until-options").css({"visibility": "hidden"})
      $(".js-until[value=forever]").prop("checked", true)
      $(".js-routing-req-submit").prop("disabled", false)
    else
      # everything else clears the duration
      $(".js-until-options").css({"visibility": "visible"})
      $(".js-routing-req-submit").prop("disabled", true)

  $(document).delegate ".js-until", "change", ->
    # Enable the submit button
    $(".js-routing-req-submit").prop("disabled", false)
