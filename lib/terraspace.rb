$stdout.sync = true unless ENV["TS_STDOUT_SYNC"] == "0"

$:.unshift(File.expand_path("../", __FILE__))
require "active_support/concern"
require "active_support/core_ext/class"
require "active_support/core_ext/hash"
require "active_support/core_ext/string"
require "active_support/ordered_options"
require "deep_merge/rails_compat"
require "dsl_evaluator"
require "fileutils"
require "json"
require "memoist"
require "rainbow/ext/string"
require "render_me_pretty"
require "set"
require "terraspace/ext"
require "terraspace/version"

require "terraspace/autoloader"
Terraspace::Autoloader.setup

DslEvaluator.backtrace_reject = "lib/terraspace"

module Terraspace
  extend Core # for Terraspace.root
  class Error < StandardError; end
  class InitRequiredError < Error; end
  class BucketNotFoundError < Error; end
end

Terraspace::Booter.boot
