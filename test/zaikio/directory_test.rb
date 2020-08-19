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
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJPcmdhbml6YXRpb24vYjE0NzVmNjUtMjM2Yy01OGI4LTk2ZTEtZTE3NzhiNDNiZWI3IiwiYXVkIjpbIk9yZ2FuaXphdGlvbi9iMTQ3NWY2NS0yMzZjLTU4YjgtOTZlMS1lMTc3OGI0M2JlYjciXSwianRpIjoiYWUwYjQwMDUtZDFlZC00YmY2LWFhYjAtODQzMDFiZDY0ODk1IiwibmJmIjoxNTg5NTU3NzM2LCJleHAiOjMzMTQ2NDcwMTM2LCJqa3UiOiJodHRwczovL2RpcmVjdG9yeS5oYy50ZXN0L2FwaS92MS9qd3RfcHVibGljX2tleXMiLCJzY29wZSI6WyJkaXJlY3RvcnkuYnVzaW5lc3NfcmVsYXRpb25zaGlwcy5ydyIsImRpcmVjdG9yeS5jb25maWRlbnRpYWxfbWFjaGluZV9zcGVjaWZpY2F0aW9ucy5yIiwiZGlyZWN0b3J5LmNvbmZpZGVudGlhbF9zcGVjaWFsaXN0X3NwZWNpZmljYXRpb25zLnIiLCJkaXJlY3RvcnkuZGVsZWdhdGlvbnMucnciLCJkaXJlY3RvcnkubWFjaGluZV9zcGVjaWZpY2F0aW9ucy5yIiwiZGlyZWN0b3J5Lm1hY2hpbmVzLnJ3IiwiZGlyZWN0b3J5Lm1hbnVmYWN0dXJlZF9tYWNoaW5lcy5ydyIsImRpcmVjdG9yeS5vcmdhbml6YXRpb24uciIsImRpcmVjdG9yeS5vcmdhbml6YXRpb25fbWVtYmVycy5yIiwiZGlyZWN0b3J5LnJlbW92ZV9tYWNoaW5lcy53IiwiZGlyZWN0b3J5LnJlbW92ZV9zb2Z0d2FyZS53IiwiZGlyZWN0b3J5LnJlbW92ZV9zcGVjaWFsaXN0cy53IiwiZGlyZWN0b3J5LnNpdGVzLnJ3IiwiZGlyZWN0b3J5LnNvZnR3YXJlLnJ3IiwiZGlyZWN0b3J5LnNwZWNpYWxpc3Rfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5zcGVjaWFsaXN0cy5ydyJdfQ.Ejpz-i8fafzarlgArU1PrifEiHAzPhByUw2bXpsjodC6dDZOiznZgOmDQg-YnXN2ksYbBeHvtaNrsd4qgHAnoP3T9_shDSslaSbBmvcqVLPcgBEvCirVaXjHMAM64oulpmsNvyWfNKcBCI-yB4jARgfOT3EGxT_x56FMRFsosvlY7kAeLd--ta53_kb5MxWvKy0fZ-6sLV44CKK74q4fmerjY-k8ZF4kdsPllX1KEGoa9m4p_FZaHqNKBg0CcITGBBwPMnzMsOzaxaW3o9-O-qm6CmPy_xrJb3B0VPm9DlEKlbKxhZqLSva-wbaUgTRXb_8jt2z8YyqnZSk93mUNng" # rubocop:disable Layout/LineLength
  end

  def org_token_specialists
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJPcmdhbml6YXRpb24vYjE0NzVmNjUtMjM2Yy01OGI4LTk2ZTEtZTE3NzhiNDNiZWI3IiwiYXVkIjpbIk9yZ2FuaXphdGlvbi9iMTQ3NWY2NS0yMzZjLTU4YjgtOTZlMS1lMTc3OGI0M2JlYjciXSwianRpIjoiNDhmYTZhMjAtYTg2Yi00MGM5LTg0NzAtOTNhNzRjYjIyOTUxIiwibmJmIjoxNTg5NTUxNjg1LCJleHAiOjMzMTQ2NDY0MDg1LCJqa3UiOiJodHRwczovL2RpcmVjdG9yeS5oYy50ZXN0L2FwaS92MS9qd3RfcHVibGljX2tleXMiLCJzY29wZSI6WyJkaXJlY3RvcnkuY29uZmlkZW50aWFsX21hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5jb25maWRlbnRpYWxfc3BlY2lhbGlzdF9zcGVjaWZpY2F0aW9ucy5yIiwiZGlyZWN0b3J5Lm1hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5tYWNoaW5lcy5ydyIsImRpcmVjdG9yeS5yZW1vdmVfbWFjaGluZXMudyIsImRpcmVjdG9yeS5yZW1vdmVfc3BlY2lhbGlzdHMudyIsImRpcmVjdG9yeS5zcGVjaWFsaXN0X3NwZWNpZmljYXRpb25zLnIiLCJkaXJlY3Rvcnkuc3BlY2lhbGlzdHMucnciXX0.bbrdxWTkltZ7NSojZ9AdQz7e9y4VnGczUEn1qsP3D8qlK8B7y0kt3RBHSfyCMBGXqTvjAbGcNTbmqEKgx-cmQNyduucmqh1XsNeWCz-6QU9TfwCOHYiqFu8PIU03HEXb9fxgIWGlruoQrPuMWDlN0BOBcvVpZSyi5BEnsNXzZ79Y3UNg8wEr57VBkKlj2cWzU6prSa8c2N-z38gBoN28XyGYWguAqvMfpbxBautzDUuhlwVArKl1ZTkSUmqsExaYSJRVLoCoVjdQHt-UA7JVGzkWvMlSjFvaDTvstad5ajxM79t0G7di28EdlKiU4-KwNZ0EbJcU2zsdu7FBA1KvSw" # rubocop:disable Layout/LineLength
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
    host = "https://hub.zaikio.test/api/v1"
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
    host = "https://hub.zaikio.test/api/v1"
    VCR.use_cassette("current_organization", record: :new_episodes) do
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

        organization = Zaikio::Directory::CurrentOrganization.new
        machine2 = organization.machines.find("55a37c0f-c2c5-531c-be8c-8e012a938fc5")
        assert_equal "55a37c0f-c2c5-531c-be8c-8e012a938fc5", machine2.id
        assert_equal({ "capabilities" => [] }, machine2.specification)
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

  test "fetches specialists" do
    host = "https://hub.zaikio.test/api/v1"
    VCR.use_cassette("current_organization_specialists") do
      Zaikio::Directory.with_token(org_token_specialists) do
        organization = Zaikio::Directory::CurrentOrganization.new
        specialist_data = {
          name: "My Specialist",
          kind: "boxing"
        }
        specialist = organization.specialists.create(specialist_data)

        body = { specialist: { current_organization_id: nil }.merge(specialist_data) }
        assert_requested :post, "#{host}/specialists",
                         headers: default_headers(org_token_specialists), body: body.to_json,
                         times: 1
        assert_requested :post, "#{host}/specialists/#{specialist.id}/specialist_ownership",
                         headers: default_headers(org_token_specialists), body: "{}",
                         times: 1

        assert_not_nil specialist.id
      end
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

  test "works with fallbacks" do
    host = "https://hub.zaikio.test/api/v1"
    stub_request(:get, "#{host}/person")
      .with(
        headers: {
          "Authorization" => "Bearer #{token}",
          "User-Agent" => "Faraday v1.0.1"
        }
      )
      .to_return(status: 403, body: "", headers: {})

    stub_request(:get, "#{host}/machines/machine-id?current_organization_id")
      .with(
        headers: {
          "Authorization" => "Bearer #{org_token}",
          "User-Agent" => "Faraday v1.0.1"
        }
      )
      .to_return(status: 404, body: "", headers: {})

    stub_request(:post, "#{host}/machines")
      .with(
        body: "{\"machine\":{\"current_organization_id\":null,\"name\":\"Machine Name\"}}",
        headers: {
          "Authorization" => "Bearer #{org_token}",
          "Content-Type" => "application/json",
          "User-Agent" => "Faraday v1.0.1"
        }
      )
      .to_return(status: 403, body: "", headers: {})

    Zaikio::Directory.with_token(token) do
      person = Zaikio::Directory::CurrentPerson
               .find_with_fallback(Zaikio::Directory::CurrentPerson.new(full_name: "Hello World"))

      assert_equal "Hello World", person.full_name

      organization_memberships = person.organization_memberships.with_fallback.to_a
      assert_equal [], organization_memberships
      assert_equal [], person.organizations
    end

    Zaikio::Directory.with_token(org_token) do
      organization = Zaikio::Directory::CurrentOrganization.new

      assert_raise Zaikio::ResourceNotFound do
        organization.machines.find("machine-id")
      end

      assert_raise Zaikio::ConnectionError do
        organization.machines.create(name: "Machine Name")
      end
    end
  end
end
