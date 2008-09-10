module TidyTestHelper
  def under_pant_gnome
    assert system "tidy #{@response.body.strip}"
  end
end