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
  version 'v0.22.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/docker-credential-up/darwin_amd64.tar.gz'
    sha256 '915ccb69b0e05b00da6c72bb2045717a265201e9a09023fca6ddc7d52d0da12a'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/docker-credential-up/darwin_arm64.tar.gz'
    sha256 '28d13d17f56bf39d063a206c57c7a5b1a82e04267c66306f74510e74a01264bb'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/docker-credential-up/linux_amd64.tar.gz'
    sha256 '742c4220bf0aa3f699815d8ef617fc57a2dc084a67e6e2a9175b14836d7c3c9f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/docker-credential-up/linux_arm.tar.gz'
    sha256 '328669c1dee6438f40d1175fcf4eeb221451e6d6836f370cb44c84181c2009dd'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.22.1/bundle/docker-credential-up/linux_arm64.tar.gz'
    sha256 '741e12eee322f6b5e818614e642af56f5c9f6f72c029a682064022129f3f2580'
  end

  def install
    bin.install 'docker-credential-up'
  end

  test do
    system "#{bin}/docker-credential-up -v"
  end
end
