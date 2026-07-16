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
  version 'v0.51.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'c7f5c4d05353f33c304821eca79c2377678db677119df1296d570f445c5efe8a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '9d2e79c2da6f3f3716e5c9d1321af05c66a9a71710b980f0f3cd359bbf8f0a28'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '8f958d350e99aa5f6c96679277eab20c7b315789525e324dbfcf0e002328dca2'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.51.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'db2db90c26df1c0b1f8aa314b5e9af21db8dff9337efd926331ba1ca5832b282'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
