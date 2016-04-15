# ohai_efixes

small plugin for ohai to search through efixes, installed on AIX.

Installation
============

Create a directory for ohai plugins, if you don't have it already:

    mkdir /etc/chef/plugins
  
Copy the plugin there:

    cp efixes.rb /etc/chef/plugins

Enable the directory in Chef-client or Ohai config:

    echo 'ohai[:plugin_path] << "/etc/chef/plugins"' >> /etc/chef/client.rb

Run chef-client or ohai:

    chef-client

or

    ohai -c /etc/chef/client.rb efixes

Usage
=====

If it is configured properly, the plugin is called automatically by every run of chef-client. You can see all the installed efixes, using knife command:

    $ knife node show server1 -a efixes
    server1:
      efixes:
        1602c_fix:
          date:        04/14/16
          description: ifix for NAS CVEs
          state:       S
          time:        18:31:08

You can also search for nodes with installed efixes, using knife or chef-manage web interface:

    $ knife search "efixes:1602*" -i
    1 items found
    
    server1

