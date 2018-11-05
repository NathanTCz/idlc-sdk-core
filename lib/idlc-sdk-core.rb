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
    'us-east-1' => {
      'build' => {
        'endpoint' => 'build.orchestrate.imageapi.com',
        'stage' => 'prod',
        'publish_bucket' => 'service-build-prod-build-artifacts'
      },
      'config' => {
        'endpoint' => 'config.orchestrate.imageapi.com',
        'stage' => 'prod'
      },
      'deploy' => {
        'endpoint' => 'deploy.orchestrate.imageapi.com',
        'stage' => 'prod'
      },
      'status' => {
        'endpoint' => 'status.orchestrate.imageapi.com',
        'stage' => 'prod'
      },
      'auth' => {
        'endpoint' => 'auth.orchestrate.imageapi.com',
        'stage' => 'prod'
      }
    },
    'us-gov-west-1' => {
      'build' => {
        'endpoint' => 'build.orchestrate-us-gov.imageapi.com',
        'stage' => 'govcloud',
        'publish_bucket' => 'service-build-govcloud-build-artifacts'
      },
      'config' => {
        'endpoint' => 'config.orchestrate-us-gov.imageapi.com',
        'stage' => 'govcloud'
      },
      'deploy' => {
        'endpoint' => 'deploy.orchestrate-us-gov.imageapi.com',
        'stage' => 'govcloud'
      },
      'status' => {
        'endpoint' => 'status.orchestrate-us-gov.imageapi.com',
        'stage' => 'govcloud'
      },
      'auth' => {
        'endpoint' => 'auth.orchestrate-us-gov.imageapi.com',
        'stage' => 'govcloud'
      }
    }
  }.freeze
end
