require "test_helper"

class Zaikio::Directory::Test < ActiveSupport::TestCase
  def setup
    Zaikio::Directory.configure do |config|
      config.environment = :test
    end
  end

  def client_id
    "da6333fc-19ab-51d7-8295-4904358c5ecb"
  end

  def client_secret
    "e415a98b72f0b48f554de75756f31780"
  end

  def token
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJQZXJzb24vMzgzNjYzYmMtMTQ5YS01Yjc2LWI1MGQtZWUwMzkwNDZjMTJlIiwiYXVkIjpbIlBlcnNvbi8zODM2NjNiYy0xNDlhLTViNzYtYjUwZC1lZTAzOTA0NmMxMmUiXSwianRpIjoiYTE5MTAwNGYtM2EwMi00MGY4LWI2ZGQtYjM0MTQxM2FkOTMxIiwibmJmIjoxNTg1NjgwNTIzLCJleHAiOjMzMTQyNTkyOTIzLCJqa3UiOiJodHRwczovL2RpcmVjdG9yeS5oYy50ZXN0L2FwaS92MS9qd3RfcHVibGljX2tleXMiLCJzY29wZSI6WyJkaXJlY3RvcnkuZGVsZWdhdGlvbnMucnciLCJkaXJlY3RvcnkubWFjaGluZXMucnciLCJkaXJlY3Rvcnkub3JnYW5pemF0aW9ucy5ydyIsImRpcmVjdG9yeS5wZXJzb24ucnciLCJkaXJlY3RvcnkucmVtb3ZlX21hY2hpbmVzLnciLCJkaXJlY3RvcnkucmVtb3ZlX3NvZnR3YXJlLnciLCJkaXJlY3Rvcnkuc2l0ZXMucnciLCJkaXJlY3Rvcnkuc29mdHdhcmUucnciXX0.VkU-uX_drgB8JL8Ir0nM3sVGLsFMYGrTzV17e1mVWAIibeK4CGbQz7aq9r3hszx-qFYRSwpYLfFKeoRLJ_UGxVYaz8h4kNItaOHoGBJKZe_PsU9DA4MBr-3n0zVa_7zxcNaeFflTgq-ZK-2yrXuxyyI2q-QXkEbRGGbemml2jKJB6Vgf3AYJUYlEn24NpoMzntBncGna7Ejvh1I3gyUr6FTgvCn0HAIC9xF-OT7pYpZ85QW8E2jdKnlD5zydI7d7qjC6GTDRovO_ePrwH5oKPxY7tB6aN8x4S_EfyAXDRT0KkicnQM4KcT4HL8xlRcFCOCGXUCjec9bLOQuLW98Biw" # rubocop:disable Layout/LineLength
  end

  def org_token
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJPcmdhbml6YXRpb24vYjE0NzVmNjUtMjM2Yy01OGI4LTk2ZTEtZTE3NzhiNDNiZWI3IiwiYXVkIjpbIk9yZ2FuaXphdGlvbi9iMTQ3NWY2NS0yMzZjLTU4YjgtOTZlMS1lMTc3OGI0M2JlYjciXSwianRpIjoiNWRmNDU5MGUtNzM4Mi00YTMxLWE1N2YtYWUwZTBjZTkwMmYyIiwibmJmIjoxNTg1ODM5NDQ0LCJleHAiOjMzMTQyNzUxODQ0LCJqa3UiOiJodHRwczovL2RpcmVjdG9yeS5oYy50ZXN0L2FwaS92MS9qd3RfcHVibGljX2tleXMiLCJzY29wZSI6WyJkaXJlY3RvcnkuYnVzaW5lc3NfcmVsYXRpb25zaGlwcy5ydyIsImRpcmVjdG9yeS5tYWNoaW5lcy5ydyIsImRpcmVjdG9yeS5vcmdhbml6YXRpb24uciIsImRpcmVjdG9yeS5vcmdhbml6YXRpb25fbWVtYmVycy5yIiwiZGlyZWN0b3J5LnNpdGVzLnJ3IiwiZGlyZWN0b3J5LnNvZnR3YXJlLnJ3Il19.NXUx3WUdcnUHlNG6s_fpEt2aH8xa-NFwNVF8vtk15P1DhJdP2e-vsFtOgRpwMrQc6MwDpaBG0L4PYV-NSLIU0Zqm1SLlWTodoAGWr31uwFUji0_8aBNsiIXVEhr5xfWYckUlw44xkcLAoD1Jo5t3BJvXdlQlGtgWg7jTj8rBRnafN5gm_ebbB17_TDohTnpMZQxOi8iKdl-hCAMHs3CjbN_TxHAblQbnhxvx01OhDrMOVNqsQpH3hGcr-rSihO85UpoAwDfqidiiGtnCgUsE5p8QHIqO8wgGAGqUHutg7W4GRH_T_OAfS7VbH9G60mazWYIhWW-JAxh-KRkg0wcP5g" # rubocop:disable Layout/LineLength
  end

  def default_headers(token)
    {
      "Accept" => "*/*",
      "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
      "Authorization" => "Bearer #{token}",
      "Content-Type" => "application/json",
      "User-Agent" => "Faraday v1.0.1"
    }
  end

  test "is a module" do
    assert_kind_of Module, Zaikio::Directory
  end

  test "has version number" do
    assert_not_nil ::Zaikio::Directory::VERSION
  end

  test "it is configurable" do
    Zaikio::Directory.configure do |config|
      config.environment = :test
    end

    assert_equal :test, Zaikio::Directory.configuration.environment
  end

  test "makes calls as person" do
    host = "http://directory.zaikio.test/api/v1"
    VCR.use_cassette("current_person") do
      Zaikio::Directory.with_token(token) do
        assert_equal "Person/383663bc-149a-5b76-b50d-ee039046c12e",
                     Zaikio::Directory.current_token_data.audience
        person = Zaikio::Directory::CurrentPerson.new
        person.fetch
        assert_equal "Frank Gallikanokus", person.full_name
        assert_equal "Bounty Soap Inc.", person.admin_organizations.first.name
        organization = person.admin_organizations.first
        org_host = "#{host}/person/organizations/#{organization.id}"

        machine = organization.machines.to_a.find { |m| m.name.include?("Speed") }
        assert_equal "Speedmaster CX 102", machine.name

        assert_equal "Frank Gallikanokus", organization.memberships.first.person.full_name

        machine_data = {
          name: "My Personal Machine",
          kind: "sheetfed_digital_press",
          manufacturer: "My Manufacturer"
        }
        machine = organization.machines.create(machine_data)

        assert_requested :post, "#{org_host}/machines",
                         headers: default_headers(token),
                         body: { machine: machine_data }.to_json,
                         times: 1
        assert_requested :post, "#{org_host}/machines/#{machine.id}/machine_ownership",
                         headers: default_headers(token), body: "{}",
                         times: 1

        assert_not_nil machine.id
        assert_equal "My Personal Machine", machine.name
        assert_equal "My Personal Machine", organization.machines.all.last.name

        machine.destroy
        assert_requested :delete, "#{org_host}/machines/#{machine.id}/machine_ownership",
                         headers: default_headers(token), body: "{}",
                         times: 1
        site = organization.sites.first
        site.update(name: "A new cool name")
        assert_requested(:patch, "#{host}/sites/#{site.id}",
                         headers: default_headers(token),
                         times: 1) do |req|
                           JSON.parse(req.body)["site"]["name"] == "A new cool name"
                         end
      end
    end
  end

  test "makes calls as organization" do
    host = "http://directory.zaikio.test/api/v1"
    VCR.use_cassette("current_organization") do
      Zaikio::Directory.with_token(org_token) do
        organization = Zaikio::Directory::CurrentOrganization.new
        machine_data = {
          name: "My Machine",
          kind: "sheetfed_digital_press",
          manufacturer: "My Manufacturer"
        }
        machine = organization.machines.create(machine_data)

        body = { machine: { current_organization_id: nil }.merge(machine_data) }
        assert_requested :post, "#{host}/machines",
                         headers: default_headers(org_token), body: body.to_json,
                         times: 1
        assert_requested :post, "#{host}/machines/#{machine.id}/machine_ownership",
                         headers: default_headers(org_token), body: "{}",
                         times: 1

        assert_not_nil machine.id
        assert_equal "My Machine", machine.name
        assert_equal "My Machine", organization.machines.all.last.name
        organization.fetch
        assert_equal "Bounty Soap Inc.", organization.name

        machine.destroy
        assert_requested :delete, "#{host}/machines/#{machine.id}/machine_ownership",
                         headers: default_headers(org_token), body: "{}",
                         times: 1
        assert_equal "Frank Gallikanokus", organization.members.first.full_name
      end
    end
  end

  test "fetches roles" do
    VCR.use_cassette("roles") do
      roles = Zaikio::Directory::Role.where(lang: "de")
      owner_role = roles.to_a.find { |r| r.id == "owner" }
      assert_equal "Eigentümer", owner_role.name
    end
  end

  test "fetches connections" do
    VCR.use_cassette("connections") do
      Zaikio::Directory.with_basic_auth(client_id, client_secret) do
        connections = Zaikio::Directory::Connection.all
        assert_equal 3, connections.size
        assert_equal "Person", connections.first.connectable_type
        assert_equal "383663bc-149a-5b76-b50d-ee039046c12e", connections.first.connectable_id
        assert_equal ["directory.person.r", "warehouse.items.r"], connections
          .first.granted_oauth_scopes
      end
    end
  end
end
