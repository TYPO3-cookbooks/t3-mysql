#
# Cookbook Name:: mysql
# Attributes:: custom
#
# Copyright 2012, TYPO3 Association
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

override['mysql']['bind_address'] = "127.0.0.1"

#### buffers

# Size of the buffer used for index blocks
override['mysql']['tunable']['key_buffer_size'] = "16M"

# Buffer size for sorting indexes
override['mysql']['tunable']['sort_buffer_size'] = "16M"

# Buffer size for reading data
override['mysql']['tunable']['read_buffer_size'] = "4M"

# Buffer size for reading data which needs to be sorted afterwards
override['mysql']['tunable']['read_rnd_buffer_size'] = "8M"

# Buffer size for joins
override['mysql']['tunable']['join_buffer_size'] = "2M"


#### innodb

# Limit the number of InnoDB threads
override['mysql']['tunable']['innodb_thread_concurrency'] = 16

# Memory pool size for data dictionary and other internal data structures
override['mysql']['tunable']['innodb_additional_mem_pool_size'] = "16M"

# Flush method for data and log files
override['mysql']['tunable']['innodb_flush_method'] = "O_DIRECT"

# InnoDB buffer pool size
# This value depends on the size of the InnoDB storage
override['mysql']['tunable']['innodb_buffer_pool_size'] = "1G"

# Use one InnoDB file per table
override['mysql']['tunable']['innodb_file_per_table'] = 1


#### logging

override['mysql']['tunable']['log_slow_queries']     = "/var/log/mysql/slow.log"
override['mysql']['tunable']['long_query_time']      = 2


#### myisam

# MyISAM storage engine recovery mode
override['mysql']['tunable']['myisam-recover'] = "BACKUP,FORCE"

# Buffer size for sorting MyISAM indexes
override['mysql']['tunable']['myisam_sort_buffer_size'] = "64M"


#### other-tuning

# Maximum number of simultaneous connections
override['mysql']['tunable']['max_connections'] = 100

# Threads to cache for reuse
override['mysql']['tunable']['thread_cache_size'] = 50

# Do not cache results that are larger than this size
override['mysql']['tunable']['query_cache_limit'] = "2M"

# Size of the query cache
override['mysql']['tunable']['query_cache_size'] = "256M"

# Number of open tables for all threads
override['mysql']['tunable']['table_cache'] = 1024

# Maximum length for the GROUP_CONCAT function
override['mysql']['tunable']['group_concat_max_len'] = "32K"

# Inactivity timeout
override['mysql']['tunable']['wait_timeout'] = 300

override['mysql']['tunable']['max_allowed_packet']   = "16M"

##### temporary data

# Maximum size to which user-created MEMORY tables are permitted to grow
override['mysql']['tunable']['max_heap_table_size']  = "32M"


override['mysql']['tunable']['thread_cache']         = "128"
override['mysql']['tunable']['thread_cache_size']    = 8
override['mysql']['tunable']['thread_concurrency']   = 10
override['mysql']['tunable']['thread_stack']         = "256K"
