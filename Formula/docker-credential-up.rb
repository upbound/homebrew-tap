# frozen_string_literal: true

# Copyright 2022 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DockerCredentialUp < Formula
  desc 'Upbound Docker credential helper'
  homepage 'https://upbound.io'
  version 'v0.54.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '971e4b0e40a2b811224c7beccbd832e9c284bc7c90f82d3860ee98286583699d'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '6ede10799657a44885ed75e43f3aa9e930eebbbafadbc49fa88484161ef23509'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'aad5991d353321105fd89534bdc9b9817f53eb6c6fd5f01067dba7bf7f300ae0'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.54.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '0180110e5184404cc8e332d655ac779334d66091a71f4ef791dab42010391bea'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
