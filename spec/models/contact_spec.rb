require "rails_helper"

describe Contact do
  it "is valid with name" do
    contact = Contact.new(name: "o", email: "@", content: "f")
    expect(contact).to be_valid
  end

  it "is invalid without name" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is valid with email" do
    contact = Contact.new(name: "o", email: "@", content: "f")
    expect(contact).to be_valid
  end

  it "is invalid without email" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "is valid with content" do
    contact = Contact.new(name: "o", email: "@", content: "f")
    expect(contact).to be_valid
  end

  it "is invalid without content" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end
end
