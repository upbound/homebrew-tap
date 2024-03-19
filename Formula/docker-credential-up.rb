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
  version 'v0.26.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '9d19c4c5ffe3192b5e46a3a865fb2ade477d8d3d41361e5a3a88b2e61d6f0f6c'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 'c06493633c1089ea3804acf9717ef0f1a6dc6d8ddb10e496a99fde80407fc070'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '7425e0398e779cee0b9c98914473eb0392dacd151b4582a8ceb063e751aee801'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 'b856a86e531c8d17247f6499727a490e6e9698f5902a10a0baeac9eb8bbec820'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.26.0/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '9c0b943ed4fb346c9e83ea87536309ebbff651638f6db114c55ac3825235961d'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
