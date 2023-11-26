# frozen_string_literal: true

require "test/unit"

require_relative "../lib/parse_diff"

class ParseDiffTest < Test::Unit::TestCase
  def test_multiple_platforms
    fixture  = File.join(__dir__, "fixtures", "nokogiri.diff")
    input    = File.read(fixture)
    expected = {
      "mini_portile2" => %w[2.8.4  2.8.5],
      "nokogiri"      => %w[1.15.4 1.15.5],
      "racc"          => %w[1.7.1  1.7.3],
    }

    assert_equal expected, ParseDiff.parse(input)
  end

  def test_multiple_bumps
    fixture  = File.join(__dir__, "fixtures", "sentry.diff")
    input    = File.read(fixture)
    expected = {
      "redis-client"  => %w[0.16.0 0.17.0],
      "sentry-resque" => %w[5.10.0 5.11.0],
      "sentry-ruby"   => %w[5.10.0 5.11.0],
    }

    assert_equal expected, ParseDiff.parse(input)
  end

  def test_only_added
    fixture  = File.join(__dir__, "fixtures", "bigdecimal.diff")
    input    = File.read(fixture)
    expected = {
      "sequel"  => %w[5.39.0 5.72.0],
    }

    assert_equal expected, ParseDiff.parse(input)
  end
end
