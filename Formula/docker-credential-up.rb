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
  version 'v0.48.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '2c3a9257c9a3a10c98ccf1f7536cdb358baa6c0589aa3f1676a3e42d94c75490'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '17e8a6e1d193967f396a2b3b90a07a15a3bbe21d656677275535ed32224f2202'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'd8e8450a87b6d605b9c48f038afe0ee89dddc765a0d18391d6302b23ee727f65'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.48.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '130be1e460bf670fde8f193eeef854aaf6822e31c1d92774e6ca646c0ea1cd0a'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
