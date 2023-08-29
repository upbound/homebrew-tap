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
  version 'v0.19.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '4ebfa742406fbb89c21bbeea611fb20e64d714d1952c39f5d6da95ae235a444c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '5d8fc6fc5c9ba8f7a7a2de2dff7a6ad1a4514c30b7f9d85110bf11e413e59b25'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 'a5dd8e7f360a8160d808a716f9132f3fb2d52179daf735228093c0ee67357325'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '4b61b6b22e138a364a68e259b0a49f0816dc6c41cd8f8b062f19e29b39e89910'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.19.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 'cd2b6cc201d295c842f819118dfaf047f8871bc16a133afe61c48a66380fdbba'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
