# Zaikio::Directory

Ruby API Client for Zaikio's Directory.

## Installation

### 1. Add this line to your application's Gemfile:

```ruby
gem 'zaikio-directory'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install zaikio-directory
```

### 2. Configure the gem:

```rb
# config/initializers/zaikio_directory.rb

Zaikio::Directory.configure do |config|
  config.environment = :production # sandbox or production
end
```


## Usage

The Directory Client has an ORM like design. However, we distinguish between the contexts of the organization and the person.

For the requests to work, a valid JSON Web token with the correct OAuth Scopes must always be provided. Please refer to [zakio-oauth_client](https://github.com/zaikio/zaikio-oauth_client).

If you want to know which actions are available and which scopes are required, please refer to the [Directory API Reference](https://docs.zaikio.com/api/directory/directory.html).

### As an organization

```rb
token = "..." # Your valid JWT for an organization
Zaikio::Directory.with_token(token) do
  organization = Zaikio::Directory::CurrentOrganization.new

  # Fetch Data
  organization.memberships.find('abc')
  organization.members.all
  organization.machines.all
  organization.software.all
  organization.sites.all
  organization.sites.find('123')
  organization.business_relationships.all
  organization.fetch
  organization.name

  # Create new resources
  organization.business_relationships.create(target_id: "abcd-efgh", kind: "printer", reference: "a-123")
  organization.machines.create(name: "Speedmaster 2020", manufacturer: "heidelberg", kind: "sheetfed_digital_press", serial_number: "HDB1337", site_id: "d6308910-f5ae-58c0-aba7-d099947845c6")
  organization.sites.create(name: "Mainz", address_attributes: {
    addressee: "Crispy Mountain GmbH",
    text: "Emmerich-Josef-Straße 1A, 55116 Mainz"
  })

  # Delete resources
  organization.machines.first.destroy
end
```

### As a person

```rb
token = "..." # Your valid JWT for a person
Zaikio::Directory.with_token(token) do
  person = Zaikio::Directory::CurrentPerson.new

  # Fetch Data
  person.organizations
  person.organization_memberships
  person.fetch
  person.full_name

  organization = person.admin_organizations.find(&:connected?)
  organization.machines.all
  organization.sites.all

  # Update details
  person.update(first_name: "Lisa", name: "Simpson", pronoun: "She/Her")
end
```

### Other Use Cases

```rb
Zaikio::Directory.with_basic_auth(client_id, client_secret) do
  connections = Zaikio::Directory::Connection.all
  subscription = Zaikio::Directory::Subscription.find("Organization-b1475f65-236c-58b8-96e1-e1778b43beb7")
  subscription.plan # => "advanced"
  subscription.activate!
  subscription.increment_usage_by!(:orders_created, 12)
end

roles = Zaikio::Directory::Role.all
revoked_access_tokens = Zaikio::Directory::RevokedAccessToken.all

Zaikio::Directory.with_token(token) do
  Zaikio::Directory::RevokedAccessToken.create
end
```

### Error Handling

If an unexpected error occurs with an API call (i.e. an error that has no status code `2xx`, `404` or `422`) then a `Zaikio::ConnectionError` is thrown automatically (for `404` there will be a `Zaikio::ResourceNotFound`).

This can be easily caught using the `with_fallback` method. We recommend to always work with fallbacks.

```rb
Zaikio::Directory.with_token(token) do
  person = Zaikio::Directory::CurrentPerson
           .find_with_fallback(Zaikio::Directory::CurrentPerson.new(full_name: "Hello World"))

  person.organizations # Automatically uses empty array as fallback
end

Zaikio::Directory.with_token(token) do
  organization = Zaikio::Directory::CurrentOrganization.new

  organization.machines.with_fallback.all
  organization.machines
    .with_fallback(Zaikio::Directory::Machine.new(name: 'My Machine'))
    .find('machine-id')


  organization.machines
    .with_fallback(Zaikio::Directory::Machine.new(name: 'My Machine'))
    .find('machine-does-not-exist') # => raises Zaikio::ResourceNotFound

  begin
    organization.machines.create(name: "Machine Name")
  rescue Zaikio::ConnectionError
    # Do something
  end
end
```
