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
  version 'v0.50.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '0e518676acd852ce92d5e5abedc8aa53fdafa468808a30ea5b4b5087b88d7ac1'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '0edda4d26dfe6d057096c42b0e61db4d0abf777b3014f3830ad7cb892e145275'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '97df11b50fa71d518c17dcc73ef308fbce1e82dd9b39223dc65f0b14144567d5'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.50.1/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '6175e7472cd18d20c38ce192b57ce1c01aecc8a133bd774dd0b3725dc1b3e885'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
