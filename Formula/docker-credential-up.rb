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
  version 'v0.47.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 'cbeb71151ec0d3395fa6afa59fcb72cd829028be9facd66611f7dd4e4a5896a0'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 '498b285d681ce7e1f20edfc2fe848f066754cd23cd6adaf82fe6cd083d5565b0'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'ef7efc2f1d085b96845bf0f634253b0359bf180dceb9f16eaf05a284359e81a3'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.47.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '7c29cfa7ad214e1a46d5b4c8491f57fb2a89d400901653d9d152b514a1bc3b5e'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
