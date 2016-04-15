# Author:: Andrey Klyachkin <andrey.klyachkin@enfence.com>
# Copyright (C) 2016 eNFence GmbH
# License: Apache License, Version 2.0
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

Ohai.plugin(:Efixes) do
  provides "efixes"

  collect_data(:aix) do
    efixes Mash.new
    so = shell_out("emgr -l | grep '^[1-9]'")
    emgr = so.stdout.lines

    # Output format is
    # ID STATE LABEL INST_DATE INST_TIME REST
    emgr.each do |fix|
      _, state, label, date, time, desc = fix.split(" ", 6)
      efixes[label] = { "state" => state, "date" => date, "time" => time, "description" => desc[0..-2] }
    end

  end
end
