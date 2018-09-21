This is an Ansible Galaxy role for installing SHRINE 1.20 and newer. It is intended to be used with CentOS 6 or newer, as it defaults to using the yum package manager. For smoothest operation, i2b2 1.7 should also be stored on the same machine.

Caveats
---------
- i2b2 must be manually restarted after the installation is complete, so that i2b2 picks up on the new shrine-ont datasource.
  - If the installer tries to run the shutdown/startup commands for i2b2 itself, it will wind up running as root instead, which is not desirable on most systems.
- The `filter_plugins` folder in this role must be manually copied up to the base playbook level.
  - This installer relies on a custom filter plugin for generating i2b2-compatible passwords. Ansible does not pick up on custom plugins at the role level.
- If your i2b2 installation is on a different server, you will have to set `is_local_i2b2` to `false`, and you will have to manually execute the database scripts on the i2b2 server, and also drop the modified `ont-ds.xml` into your jboss standalone/deployments folder. 
  - These database scripts will be placed in `/opt/shrine/i2b2-files` (substitute `/opt/shrine` with the value of `shrine_home`), which can then be transferred to the i2b2 server for import.

TODO
----
- Currently, the only database supported for the i2b2 portion of the installer is Postgres. MySQL, SQL Server, and Oracle are up next, but not officially supported by this installer.
  - For systems that are running a currently unsupported database system for their i2b2 instance, the .sql scripts placed in `/opt/shrine/i2b2-files` can be manually translated to the appropriate SQL grammar for that system and run against that database.
- The SHRINE portion of the installer assumes it will be backed by MySQL. This can be expanded to Oracle and SQL Server in the future.
  - For systems that are running a currently unsupported database system for their SHRINE instance, the .sql scripts placed in `/opt/shrine/shrine-files/` can be manually translated to the appropriate SQL grammar for that system and run against that database.
- Supplementary scripts in `/opt/shrine/util` are not compatible with Windows.