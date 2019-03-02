require 'rails_helper'

describe "Get '/'" do
  it "loads homepage" do
    assert_generates "/", controller: "welcome", action: "index"
  end
end

describe "Get '/rules'" do
  it "loads rules page" do
    assert_generates "/rules", controller: "welcome", action: "rules"
  end
end

describe "Get '/people'" do
  it "loads people page" do
    assert_generates "/people", controller: "welcome", action: "people"
  end
end

describe "Get '/confirm-account'" do
  it "loads rules page" do
    assert_generates "/confirm-account", controller: "welcome", action: "confirm"
  end
end

describe "Get '/instructions'" do
  it "loads rules page" do
    assert_generates "/instructions", controller: "welcome", action: "instructions"
  end
end




