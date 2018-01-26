require 'tmpdir'
require 'zip'

require 'idlc-sdk-core/version'
require 'idlc-sdk-core/helpers'
require 'idlc-sdk-core/utility'
require 'idlc-sdk-core/workspace'
require 'idlc-sdk-core/zip'
require 'idlc-sdk-core/restclient'

module Idlc
  # Service Definitions
  SERVICES = {
    'build' => {
      'endpoint' => 'build.orchestrate.imageapi.com',
      'stage' => 'dev'
    },
    'config' => {
      'endpoint' => 'config.orchestrate.imageapi.com',
      'stage' => 'dev'
    },
    'deploy' => {
      'endpoint' => 'deploy.orchestrate.imageapi.com',
      'stage' => 'dev'
    },
    'status' => {
      'endpoint' => 'status.orchestrate.imageapi.com',
      'stage' => 'dev'
    }
  }.freeze
end
