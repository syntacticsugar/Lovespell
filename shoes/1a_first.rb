Shoes.app do
  background "#EFC"
  border(
    "#BE8",
    :strokewidth => 6
  )
  stack(:margin => 12) do
    flow do
      title(
        "Once upon a Time",
        :top => 60,
        :font => "Lucida Grande"
      )
      @note = para "On the first day, God created light:"
      button "Create Light" do
        @note.replace "Bonjour Neptune."
      end
    end
  end
end
