require 'chefspec'

describe 't3-mysql::backup' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 't3-mysql::backup' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
