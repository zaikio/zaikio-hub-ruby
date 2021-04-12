require "test_helper"
require "action_controller"

class Zaikio::Hub::Test < ActiveSupport::TestCase
  def setup
    Zaikio::Hub.configure do |config|
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
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJQZXJzb24vMzgzNjYzYmMtMTQ5YS01Yjc2LWI1MGQtZWUwMzkwNDZjMTJlIiwiYXVkIjpbImtleWxpbmUiXSwianRpIjoiMzZkYTZkOTEtNzIxNS00YzllLTk3OGMtMThlMjRkM2Y4MWQzIiwibmJmIjoxNTg5NTU3NzM2LCJleHAiOjMzMTQ2NDcwMTM2LCJqa3UiOiJodHRwczovL2h1Yi56YWlraW8udGVzdC9hcGkvdjEvand0X3B1YmxpY19rZXlzIiwic2NvcGUiOlsiZGlyZWN0b3J5LmRlbGVnYXRpb25zLnJ3IiwiZGlyZWN0b3J5Lm1hY2hpbmVzLnJ3IiwiZGlyZWN0b3J5Lm9yZ2FuaXphdGlvbnMucnciLCJkaXJlY3RvcnkucGVyc29uLnJ3IiwiZGlyZWN0b3J5LnJlbW92ZV9tYWNoaW5lcy53IiwiZGlyZWN0b3J5LnJlbW92ZV9zb2Z0d2FyZS53IiwiZGlyZWN0b3J5LnNpdGVzLnJ3IiwiZGlyZWN0b3J5LnNvZnR3YXJlLnJ3Il19.tCsXCpsDohoDXC2VphWe-LDYqVh4686TcPaGGavxqY2DXgXvHpy7WGdP8gwEu3L8eMmjYyYkj2W_o5C3jdBOSOYWtjHkTcYnxlpAdpJQuuPx5BnIo0qift999dDGoWU97dzyej-f--9LPU7c1v_qLJCYRZadg4vJQ1DD9Wpua_sRPGi89QBO1ILfiFsx9kZLveJpQ36OHip2hWMK9ByGQQVaaoy1JuqUUstjnlSdmUH0J9nX5EIEf08kBLlBxVNkGDAF91PZi4nreZdq6hycIdbDUPZry3DYGVaggvJVQbMb2nMpweNVNb2JVHgNdXp7X4damckLy_Aplo2u5vsq5g" # rubocop:disable Layout/LineLength
  end

  def org_token
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJPcmdhbml6YXRpb24vYjE0NzVmNjUtMjM2Yy01OGI4LTk2ZTEtZTE3NzhiNDNiZWI3IiwiYXVkIjpbImtleWxpbmUiXSwianRpIjoiNjMxNDU2OTgtYzlkOS00ZjJmLWI4YWUtZWJmMzcyOWMwNTA3IiwibmJmIjoxNTg5NTU3NzM2LCJleHAiOjMzMTQ2NDcwMTM2LCJqa3UiOiJodHRwczovL2h1Yi56YWlraW8udGVzdC9hcGkvdjEvand0X3B1YmxpY19rZXlzIiwic2NvcGUiOlsiZGlyZWN0b3J5LmJ1c2luZXNzX3JlbGF0aW9uc2hpcHMucnciLCJkaXJlY3RvcnkuY29uZmlkZW50aWFsX21hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5jb25maWRlbnRpYWxfc3BlY2lhbGlzdF9zcGVjaWZpY2F0aW9ucy5yIiwiZGlyZWN0b3J5LmRlbGVnYXRpb25zLnJ3IiwiZGlyZWN0b3J5Lm1hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5tYWNoaW5lcy5ydyIsImRpcmVjdG9yeS5tYW51ZmFjdHVyZWRfbWFjaGluZXMucnciLCJkaXJlY3Rvcnkub3JnYW5pemF0aW9uLnIiLCJkaXJlY3Rvcnkub3JnYW5pemF0aW9uX21lbWJlcnMuciIsImRpcmVjdG9yeS5yZW1vdmVfbWFjaGluZXMudyIsImRpcmVjdG9yeS5yZW1vdmVfc29mdHdhcmUudyIsImRpcmVjdG9yeS5yZW1vdmVfc3BlY2lhbGlzdHMudyIsImRpcmVjdG9yeS5zaXRlcy5ydyIsImRpcmVjdG9yeS5zb2Z0d2FyZS5ydyIsImRpcmVjdG9yeS5zcGVjaWFsaXN0X3NwZWNpZmljYXRpb25zLnIiLCJkaXJlY3Rvcnkuc3BlY2lhbGlzdHMucnciXX0.xFb2MLNGh5MHGDzS1sEPHtkMbHeXLTWdLhP1qeSXuT2WlKSjoENDYHmtMFyT_xVsYWdStkLYdDoeP9pnUPv1SOmnVArLOf-39LG_j4FJ-HnyUFpW_vVmv7ZNcbZA8N3MK9JS_bDC2c7GdvaEH5YrmnTvBWAkrriiaaD46fxFBju5tACgOdeXBG4XFuiAPWfbsVKzAfdosjqZEh0MjhfT-TSRu-UN7r1MaU4A9oJdtnr6ZrCQAzX3AyGKR7pCEay0AMod_NHGQvVW4KKgviFBrz_JIych8pjTiWTWx8J9k2NRf7ZXNhRyECpySZbADR7AnDMWCraRe0cmnThOtOponw" # rubocop:disable Layout/LineLength
  end

  def org_token_specialists
    "eyJraWQiOiJhNmE1MzFjMGZhZTVlNWE1MDAzZDI2ZTRhMTIwMmIwNjg2ZDFkNTRjNGZhYTViZDlkZTBjMzdkY2JkY2RkYzdlIiwiYWxnIjoiUlMyNTYifQ.eyJpc3MiOiJaQUkiLCJzdWIiOiJPcmdhbml6YXRpb24vYjE0NzVmNjUtMjM2Yy01OGI4LTk2ZTEtZTE3NzhiNDNiZWI3IiwiYXVkIjpbIk9yZ2FuaXphdGlvbi9iMTQ3NWY2NS0yMzZjLTU4YjgtOTZlMS1lMTc3OGI0M2JlYjciXSwianRpIjoiNDhmYTZhMjAtYTg2Yi00MGM5LTg0NzAtOTNhNzRjYjIyOTUxIiwibmJmIjoxNTg5NTUxNjg1LCJleHAiOjMzMTQ2NDY0MDg1LCJqa3UiOiJodHRwczovL2RpcmVjdG9yeS5oYy50ZXN0L2FwaS92MS9qd3RfcHVibGljX2tleXMiLCJzY29wZSI6WyJkaXJlY3RvcnkuY29uZmlkZW50aWFsX21hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5jb25maWRlbnRpYWxfc3BlY2lhbGlzdF9zcGVjaWZpY2F0aW9ucy5yIiwiZGlyZWN0b3J5Lm1hY2hpbmVfc3BlY2lmaWNhdGlvbnMuciIsImRpcmVjdG9yeS5tYWNoaW5lcy5ydyIsImRpcmVjdG9yeS5yZW1vdmVfbWFjaGluZXMudyIsImRpcmVjdG9yeS5yZW1vdmVfc3BlY2lhbGlzdHMudyIsImRpcmVjdG9yeS5zcGVjaWFsaXN0X3NwZWNpZmljYXRpb25zLnIiLCJkaXJlY3Rvcnkuc3BlY2lhbGlzdHMucnciXX0.bbrdxWTkltZ7NSojZ9AdQz7e9y4VnGczUEn1qsP3D8qlK8B7y0kt3RBHSfyCMBGXqTvjAbGcNTbmqEKgx-cmQNyduucmqh1XsNeWCz-6QU9TfwCOHYiqFu8PIU03HEXb9fxgIWGlruoQrPuMWDlN0BOBcvVpZSyi5BEnsNXzZ79Y3UNg8wEr57VBkKlj2cWzU6prSa8c2N-z38gBoN28XyGYWguAqvMfpbxBautzDUuhlwVArKl1ZTkSUmqsExaYSJRVLoCoVjdQHt-UA7JVGzkWvMlSjFvaDTvstad5ajxM79t0G7di28EdlKiU4-KwNZ0EbJcU2zsdu7FBA1KvSw" # rubocop:disable Layout/LineLength
  end

  def default_headers(token)
    {
      "Accept" => "*/*",
      "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
      "Authorization" => "Bearer #{token}",
      "Content-Type" => "application/json"
    }
  end

  test "is a module" do
    assert_kind_of Module, Zaikio::Hub
  end

  test "has version number" do
    assert_not_nil ::Zaikio::Hub::VERSION
  end

  test "it is configurable" do
    Zaikio::Hub.configure do |config|
      config.environment = :test
    end

    assert_equal :test, Zaikio::Hub.configuration.environment
  end

  test "makes calls as person" do
    host = "https://hub.zaikio.test/api/v1"
    VCR.use_cassette("current_person") do
      Zaikio::Hub.with_token(token) do
        assert_equal "keyline",
                     Zaikio::Hub.current_token_data.audience
        person = Zaikio::Hub::CurrentPerson.new
        person.fetch
        assert_equal "Frank Gallikanokus", person.full_name
        assert_equal "Bounty Soap Inc.", person.admin_organizations.first.name
        assert_equal %w[directory.person.r warehouse.items.r], person.granted_oauth_scopes
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
        assert_equal "383663bc-149a-5b76-b50d-ee039046c12e",
                     Zaikio::Hub.current_token_data.subject_id
      end
    end
  end

  test "makes calls as organization" do
    host = "https://hub.zaikio.test/api/v1"
    VCR.use_cassette("current_organization", record: :new_episodes) do
      Zaikio::Hub.with_token(org_token) do
        organization = Zaikio::Hub::CurrentOrganization.new
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
        assert_equal %w[directory.organization.r directory.machines.rw],
                     organization.granted_oauth_scopes

        machine.destroy
        assert_requested :delete, "#{host}/machines/#{machine.id}/machine_ownership",
                         headers: default_headers(org_token), body: "{}",
                         times: 1
        assert_equal "Frank Gallikanokus", organization.members.first.full_name

        organization = Zaikio::Hub::CurrentOrganization.new
        machine2 = organization.machines.find("55a37c0f-c2c5-531c-be8c-8e012a938fc5")
        assert_equal "55a37c0f-c2c5-531c-be8c-8e012a938fc5", machine2.id
        assert_equal({ "capabilities" => [] }, machine2.specification)
      end
    end
  end

  test "creates site with address" do
    VCR.use_cassette("create_site", record: :new_episodes) do
      Zaikio::Hub.with_token(org_token) do
        organization = Zaikio::Hub::CurrentOrganization.new
        site = organization.sites.new(ActionController::Parameters.new(
          "name" => "Another Site",
          "address_attributes" => {
            "addition" => "2nd Floor",
            "addressee" => "Janine Lane",
            "country_code" => "DE",
            "street_and_number" => "SomeStreet 12",
            "town" => "Berlin",
            "zip_code" => "10115"
          }
        ).permit!)

        site.save

        assert_equal "Another Site", site.name
        assert_equal "2nd Floor", site.address["addition"]
        assert_equal "SomeStreet 12", site.address["street"]
        assert_not_nil site.address["id"]
      end
    end
  end

  test "fetches roles" do
    VCR.use_cassette("roles") do
      roles = Zaikio::Hub::Role.where(lang: "de")
      owner_role = roles.to_a.find { |r| r.id == "owner" }
      assert_equal "Eigentümer", owner_role.name
    end
  end

  test "fetches specialists" do
    host = "https://hub.zaikio.test/api/v1"
    VCR.use_cassette("current_organization_specialists") do
      Zaikio::Hub.with_token(org_token_specialists) do
        organization = Zaikio::Hub::CurrentOrganization.new
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

  test "fetches paginated connections" do
    VCR.use_cassette("connections") do
      Zaikio::Hub.with_basic_auth(client_id, client_secret) do
        Zaikio::Hub::Connection.per_page(1).each_page do |page|
          assert_equal 1, page.size
          assert_equal 3, page.total_count

          if page.first_page?
            assert_equal "Person", page.first.connectable_type
            assert_equal "383663bc-149a-5b76-b50d-ee039046c12e", page.first.connectable_id
            assert_equal ["directory.person.r", "warehouse.items.r"], page
              .first.granted_oauth_scopes
            assert_equal [], page.first.requested_oauth_scopes_waiting_for_approval
          else
            assert_not_equal "383663bc-149a-5b76-b50d-ee039046c12e", page.first.connectable_id
          end
        end
      end
    end
  end

  test "fetches subscriptions" do
    VCR.use_cassette("subscriptions") do
      Zaikio::Hub.with_basic_auth(client_id, client_secret) do
        subscriptions = Zaikio::Hub::Subscription.all
        assert_equal 1, subscriptions.size
        subscription = subscriptions.first
        assert_equal "Organization", subscription.subscriber_type
        assert_equal "b1475f65-236c-58b8-96e1-e1778b43beb7", subscription.subscriber_id
        assert_equal "Organization-b1475f65-236c-58b8-96e1-e1778b43beb7", subscription.id

        subscription = Zaikio::Hub::Subscription
                       .find("Organization-b1475f65-236c-58b8-96e1-e1778b43beb7")
        assert_equal "Organization", subscription.subscriber_type
        assert_equal "b1475f65-236c-58b8-96e1-e1778b43beb7", subscription.subscriber_id
        assert_equal({ "orders_created" => 12 }, subscription.usages_in_current_billing_period)
        subscription.increment_usage_by!(:orders_created, 8)
        subscription.reload
        assert_equal({ "orders_created" => 20 }, subscription.usages_in_current_billing_period)
      end
    end
  end

  test "creates test accounts" do
    VCR.use_cassette("test_accounts") do
      Zaikio::Hub.with_basic_auth(client_id, client_secret) do
        Zaikio::Hub::TestAccount.create(
          name: "My Test Org",
          country_code: "DE",
          kinds: ["printer"],
          connection_attributes: ["procurement_consumer"]
        )

        test_accounts = Zaikio::Hub::TestAccount.all

        assert_equal 1, test_accounts.size
        assert_equal "My Test Org", test_accounts.first.name
      end
    end
  end

  test "uses zaikio client from token" do
    VCR.use_cassette("client_requests_organization") do
      client = Zaikio::Hub::Client.from_token(org_token)

      assert_equal "Bounty Soap Inc.", client.organization.name
      assert_equal "Black Mesa Research Facility", client.sites.first.name
      machine = client.machines.create(
        name: "Machine Name",
        kind: "sheetfed_digital_press",
        manufacturer: "My Manufacturer"
      )
      assert_equal "Machine Name", machine.name
    end
  end

  test "uses zaikio client from credentials" do
    VCR.use_cassette("client_requests_credentials") do
      client = Zaikio::Hub::Client.from_credentials(client_id, client_secret)

      assert_raise do
        client.organization
      end

      connection = client.connections.first
      assert_equal "383663bc-149a-5b76-b50d-ee039046c12e", connection.connectable_id

      client.test_accounts.create(
        name: "My Test Org",
        country_code: "DE",
        kinds: ["printer"],
        connection_attributes: ["procurement_consumer"]
      )

      test_account = client.test_accounts.last
      assert_equal "My Test Org", test_account.name
    end
  end

  test "respects attributes" do
    organization = Zaikio::Hub::Organization.new

    assert_nil organization.id
    assert_nil organization.name
    assert_nil organization.kinds
  end

  test "works with fallbacks" do
    host = "https://hub.zaikio.test/api/v1"
    stub_request(:get, "#{host}/person")
      .with(
        headers: {
          "Authorization" => "Bearer #{token}"
        }
      )
      .to_return(status: 403, body: "", headers: {})

    stub_request(:get, "#{host}/machines/machine-id?current_organization_id")
      .with(
        headers: {
          "Authorization" => "Bearer #{org_token}"
        }
      )
      .to_return(status: 404, body: "", headers: {})

    stub_request(:post, "#{host}/machines")
      .with(
        body: "{\"machine\":{\"current_organization_id\":null,\"name\":\"Machine Name\"}}",
        headers: {
          "Authorization" => "Bearer #{org_token}",
          "Content-Type" => "application/json"
        }
      )
      .to_return(status: 403, body: "", headers: {})

    Zaikio::Hub.with_token(token) do
      person = Zaikio::Hub::CurrentPerson
               .find_with_fallback(Zaikio::Hub::CurrentPerson.new(full_name: "Hello World"))

      assert_equal "Hello World", person.full_name

      organization_memberships = person.organization_memberships.with_fallback.to_a
      assert_equal [], organization_memberships
      assert_equal [], person.organizations
    end

    Zaikio::Hub.with_token(org_token) do
      organization = Zaikio::Hub::CurrentOrganization.new

      assert_raise Zaikio::ResourceNotFound do
        organization.machines.find("machine-id")
      end

      assert_raise Zaikio::ConnectionError do
        organization.machines.create(name: "Machine Name")
      end
    end
  end
end
