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
  version 'v0.49.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/darwin_amd64/docker-credential-up.tar.gz'
    sha256 '8bca2f7a75315bdcaed638eef0d8d69de4d3d243cbb91f9635450dd01e516273'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/darwin_arm64/docker-credential-up.tar.gz'
    sha256 'a08e2d904b82a419b8ecad55265b54b5a6dcb01ea67ead86fa37a51d8362a247'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/linux_amd64/docker-credential-up.tar.gz'
    sha256 'b14683a568df29e9ba50485ff3aec1e2d6a71ad835959b1b4770df2194c99b06'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.49.0/bundle/linux_arm64/docker-credential-up.tar.gz'
    sha256 '0d00b40173ebdefc0ac7e1e1e902eb43018e781e176478ef476ab6cf7c83e9ff'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
