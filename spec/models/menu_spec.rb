require 'rails_helper'

RSpec.describe Menu, type: :model do
  let!(:menu) { create :menu }

  it "menu success" do
    expect(menu).to be_valid
  end

  it "name is nil" do
    menu.name = nil
    expect(menu).not_to be_valid
  end

  it "name is present" do
    menu.name = " "
    expect(menu).not_to be_valid
  end

  it "name characters is 29" do
    menu.name = "a" * 29
    expect(menu).to be_valid
  end

  it "name characters is 31" do
    menu.name = "a" * 31
    expect(menu).not_to be_valid
  end

  it "decription is nil" do
    menu.description = nil
    expect(menu).not_to be_valid
  end

  it "description is present" do
    menu.description = " "
    expect(menu).not_to be_valid
  end

  it "description characters is 299" do
    menu.description = "a" * 299
    expect(menu).to be_valid
  end

  it "description characters is 301" do
    menu.description = "a" * 301
    expect(menu).not_to be_valid
  end

  it "price is nil" do
    menu.price = nil
    expect(menu).not_to be_valid
  end

  it "price is present" do
    menu.price = " "
    expect(menu).not_to be_valid
  end
end
