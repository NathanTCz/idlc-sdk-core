require "spec_helper"

RSpec.describe Idlc do
  it "has a version number" do
    expect(Idlc::VERSION).not_to be nil
  end
  context 'finds service obj for region' do
    ENV['AWS_ACCESS_KEY_ID'] = 'AKID'
    ENV['AWS_SECRET_ACCESS_KEY'] = 'SUPERSECRETEXAMPLE'

    ['us-east-1', 'us-gov-west-1'].each do |region|
      context region do
        # N. Virginia Backend
        ENV['AWS_REGION'] = region
        client = Idlc::AWSRestClient.new()

        it "can ping the build service" do
          expect(Idlc::SERVICES[region]['build']['endpoint']).not_to be nil
          expect(client.fetch('{"service": "build", "method": "GET", "path": "/ping"}')['pong']).to be true
        end

        it "can ping the config service" do
          expect(client.fetch('{"service": "config", "method": "GET", "path": "/ping"}')['pong']).to be true
          expect(Idlc::SERVICES[region]['config']['endpoint']).not_to be nil
        end

        it "can ping the deploy service" do
          expect(client.fetch('{"service": "deploy", "method": "GET", "path": "/ping"}')['pong']).to be true
          expect(Idlc::SERVICES[region]['deploy']['endpoint']).not_to be nil
        end

        it "can ping the status service" do
          expect(client.fetch('{"service": "status", "method": "GET", "path": "/ping"}')['pong']).to be true
          expect(Idlc::SERVICES[region]['status']['endpoint']).not_to be nil
        end

        it "can ping the auth service" do
          expect(Idlc::SERVICES[region]['auth']['endpoint']).not_to be nil
        end
      end
    end
  end
end
