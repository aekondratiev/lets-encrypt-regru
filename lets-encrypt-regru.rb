#!/usr/bin/env ruby

# Based on https://gist.github.com/joshgarnett/02920846fea35f738d3370fd991bb0e0

require 'reg_api2'

RegApi2.username = 'test'
RegApi2.password = 'test'
RegApi2.lang     = 'ru'

def setup_dns(dbname, domain, txt_challenge)
  RegApi2.zone.add_txt domains: [ { dname: "#{dbname.split('.').last(2).join('.')}" } ], subdomain: "_acme-challenge.#{domain}.", text: "#{txt_challenge}"
  sleep(60)
end

def delete_dns(dbname, domain, txt_challenge)
  RegApi2.zone.remove_record domains: [ { dname: "#{dbname.split('.').last(2).join('.')]}" } ], subdomain: "_acme-challenge.#{domain}.", content: "#{txt_challenge}", record_type: :TXT
end

if __FILE__ == $PROGRAM_NAME
  hook_stage = ARGV[0]
  domain = ARGV[1]
  txt_challenge = ARGV[3]

  puts "stage: #{hook_stage} domain: #{domain} txt_challenge: #{txt_challenge}"

  if hook_stage == 'deploy_challenge'
    setup_dns(dbname, domain, txt_challenge)
  elsif hook_stage == 'clean_challenge'
    delete_dns(dbname, domain, txt_challenge)
  end
end


