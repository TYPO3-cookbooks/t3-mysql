require 'chefspec'

describe 't3-mysql::server' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 't3-mysql::server' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
