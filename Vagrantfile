Vagrant.configure(2) do |config|
  
  config.vm.box = "centos66"
  config.vm.box_url = "https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"

  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t pageup/bot"
    d.run "pageup/bot", args: "-e HUBOT_SLACK_TOKEN={{put-your-token-here}}"
  end

end