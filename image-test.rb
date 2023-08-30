# packer_image_test.rb

# Test the Packer-built CentOS 8 image

control 'centos-8-image' do
  impact 1.0
  title 'CentOS 8 Image Configuration testing'
  desc 'Ensure CentOS 8 image has the required configurations'

  # Check if required packages are installed
  describe package('falcon-sensor') do
    it { should be_installed }
  end

  describe package('monitoring-Agent') do
    it { should be_installed }
  end

  # Check if required ports are open
  describe port(22) do
    it { should be_listening }
    its('protocols') { should include 'tcp' }
  end
  # Check if specific user exist exist
  describe user('devops') do
    it { should exist }
  end

  # Check if specific files and directories exist
  describe file('/etc/hosts') do
    it { should exist }
    its('content') { should include 'localhost' }
  end

  describe directory('/var/log') do
    it { should exist }
    it { should be_directory }
  end
