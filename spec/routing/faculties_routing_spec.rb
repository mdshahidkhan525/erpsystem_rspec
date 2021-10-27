require "rails_helper"

describe "routing to faculties" do

  it "routes /faculties to faculties#index" do
    expect(get: "/faculties").to route_to(
      controller: "faculties",
      action: "index"
    )
  end

  it "routes /faculties/1 to faculties#show" do
    expect(get: "/faculties/1").to route_to(
      controller: "faculties",
      action: "show",
      id: "1"
    )
  end

  it "routes /faculties/new to faculties#new" do
    expect(get: "/faculties/new").to route_to(
      controller: "faculties",
      action: "new"
    )
  end

  it "routes /faculties to faculties#create" do
    expect(post: "/faculties").to route_to(
      controller: "faculties",
      action: "create"
    )
  end

  it "routes /faculties/1/edit to faculties#edit" do
    expect(get: "/faculties/1/edit").to route_to(
      controller: "faculties",
      action: "edit",
      id: "1"
    )
  end

  it "routes /faculties/1 to faculties#update" do
    expect(put: "/faculties/1").to route_to(
      controller: "faculties",
      action: "update",
      id: "1"
    )
  end

  it "routes /faculties/1 to faculties#destroy" do
    expect(delete: "/faculties/1").to route_to(
      controller: "faculties",
      action: "destroy",
      id: "1"
    )
  end

end
