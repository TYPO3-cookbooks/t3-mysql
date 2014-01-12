#
# Cookbook Name:: mysql
# Recipe:: backup
#
# Copyright 2012, Steffen Gebert / TYPO3 Association
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cron "mysql_backup" do
	hour "4"
	minute "0"
	command "/usr/local/sbin/custom-mysql-dump-backup.sh > /dev/null"
end

template "/usr/local/sbin/custom-mysql-dump-backup.sh" do
	source "mysql-dump-backup.sh.erb"
	mode "0700"
end