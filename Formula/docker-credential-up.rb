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
  version 'v0.44.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '6d5447240a1a6d7c7368fe3037464d7e799a8f20c46c11ccd2e6280ef8beaf0b'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'e57a2cff045f3f572d1dcc32629e69892100a4b8910fa765be546de5a32a9d87'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 '360f49bde94bbddf57c6b2d26bf71078772ecf2837e214a99439638aa5da1bdb'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.3/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 'c0902527818c562aa978e5366cb26fcf7da06164900a2f2ebb9d5a1279ef2a4a'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
