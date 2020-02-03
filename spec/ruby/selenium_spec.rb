require "watir"
require "webdrivers"

RSpec.describe "Tutorial"  do
 it "Do different steps for form testing" do
    browser = Watir::Browser.new
    browser.goto "http://explorecalifornia.org/contact.htm"

    expect(browser.text_field(id: "name").exists?).to equal(true)
    expect(browser.textarea(id: "comments").exists?).to equal(true)

    browser.text_field(id: "name").set "Marvelous Marvin"
    browser.select_list(id: "state").select "Texas"

    backpack = browser.checkbox(id: "backpack")
    browser.execute_script("arguments[0].scrollIntoView();", backpack)
    backpack.click

    browser.radio(id: "newsletter_yes").set

    expect(browser.text_field(id: "name").value).to match("Marvelous Marvin")
    expect(browser.select_list(id: "state").text).to match("Texas")
    expect(backpack.set?).to equal(true)
    expect(browser.radio(id: "newsletter_yes").set?).to equal(true)
  end
end