require 'tmpdir'
require 'zip'

require 'idlc-sdk-core/version'
require 'idlc-sdk-core/helpers'
require 'idlc-sdk-core/utility'
require 'idlc-sdk-core/workspace'
require 'idlc-sdk-core/zip'

# Service Definitions
$services = {
  'config' => {
    'endpoint' => 'un0t03st4m.execute-api.us-east-1.amazonaws.com',
    'stage' => 'dev'
  },
  'deploy' => {
    'endpoint' => 'dwervfhpxe.execute-api.us-east-1.amazonaws.com',
    'stage' => 'dev'
  },
  'status' => {
    'endpoint' => 'xmztqnqkb8.execute-api.us-east-1.amazonaws.com',
    'stage' => 'dev'
  }
}

module Idlc
  # ...
end
