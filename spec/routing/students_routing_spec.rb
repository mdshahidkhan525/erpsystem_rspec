require "rails_helper"

describe "routing to students" do

  it "routes /students to students#index" do
    expect(get: "/students").to route_to(
      controller: "students",
      action: "index"
    )
  end

  it "routes /students/1 to students#show" do
    expect(get: "/students/1").to route_to(
      controller: "students",
      action: "show",
      id: "1"
    )
  end

  it "routes /students/new to students#new" do
    expect(get: "/students/new").to route_to(
      controller: "students",
      action: "new"
    )
  end

  it "routes /students to students#create" do
    expect(post: "/students").to route_to(
      controller: "students",
      action: "create"
    )
  end

  it "routes /students/1/edit to students#edit" do
    expect(get: "/students/1/edit").to route_to(
      controller: "students",
      action: "edit",
      id: "1"
    )
  end

  it "routes /students/1 to students#update" do
    expect(put: "/students/1").to route_to(
      controller: "students",
      action: "update",
      id: "1"
    )
  end

  it "routes /students/1 to students#destroy" do
    expect(delete: "/students/1").to route_to(
      controller: "students",
      action: "destroy",
      id: "1"
    )
  end

end
