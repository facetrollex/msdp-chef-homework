# InSpec test for recipe msdp-chef::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe port(80) do
  it { should be_listening }
end

describe http('http://localhost/index.html') do
  its('status') { should cmp 200 }
  its('body') { should match /Hello, world!/ }
  its('body') { should match /ipaddress:\ [0-9]+/ }
  its('body') { should match /hostname:\ (.+)/ }
end
