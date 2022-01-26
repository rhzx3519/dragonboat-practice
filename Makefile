# Copyright 2017-2020 Lei Ni (nilei81@gmail.com).
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

GOCMD=go build -v

all: helloworld


docker: GOCMD = CGO_ENABLED=0 GOOS=linux go build -v
docker: helloworld
	@docker build -t rhzx3519/helloworld:dragonboat .
	@docker push rhzx3519/helloworld:dragonboat

helloworld:
	$(GOCMD) -o helloworld github.com/rhzx3519/dragonboat-practice/v1/internal/app/helloworld

clean:
	@rm -f helloworld

.PHONY: helloworld clean
